import strutils
import pari
import locks
import os

type
  MessageKind = enum
    print, stop
  Message = object
    case kind: MessageKind
    of print:
      test: string
    of stop:
      nil

const numthd=3

var
  channel: array [0..numthd-1, Channel[Message]]
  thread: array [0..numthd-1,Thread[int]]
  init_lock: Lock
  init_done= numthd

template fort(body:stmt) :stmt {.dirty, immediate.}=  ## Threads's for loop
  for i in 0..high(thread):
    body

proc toSeq(g:GEN):seq[float]=
  result = @[]
  var t = $type0(g)
  case t[1 .. ^2]
  of "t_INT", "t_REAL":
    result.add(g.gtodouble())
  of "t_VEC", "t_COL":
    for i in 1..g.glength:
      result.add(gtodouble(safegel(g,i)[]))
  else :
    result.add(0.0)

initLock(init_lock)

proc pari_child(tnum: int){.thread.}=

  pari_init(2000010,200000)
  var parth: pari_thread
  pari_thread_alloc(addr parth,2000000,nil)
  discard pari_thread_start(addr parth)

  acquire(init_lock) ## wait all thread initialized
  init_done=init_done-1
  release(init_lock)
  while init_done!=0:
    os.sleep(1)

  echo "[Thread: $#]: init done" % $tnum
  while true:
    let msg = recv channel[tnum]
    case msg.kind:
      of print:
        var g =newGEN(msg.test)
        #echo "[Thread: $#]" % $tnum , ": ", g
        echo "[Thread: $#]: " % $tnum, gel(factor(g),1).toSeq ## 1st colum of fact ti seq
      of stop:
        echo "[Thread: $#]: close" % $tnum
        pari_thread_close()
        break

proc stopth {.noconv.} =
  fort:
    channel[i].send Message(kind: stop)
    joinThread thread[i]
    close channel[i]

fort:
  open channel[i]
  createThread(thread[i], pari_child, i)

fort:
  channel[i].send Message(kind: print, test: "(2^120+1)^2-2")

for k in [81,64,99]:
  fort:
    channel[i].send Message(kind: print, test: "(2^$#+1)-2" % $k)
  echo k, " dispatched"

addQuitProc stopth
