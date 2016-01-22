import macros
import typetraits

#
type
  ulong* = culong

type
  Gen* = ptr clong

#
proc pariInit*(parisize: csize; maxprime: ulong) {.cdecl, importc: "pari_init",
    dynlib: "libpari.so".}

proc kbessel*(nu: Gen; gx: Gen; prec: clong): Gen {.cdecl, importc: "kbessel",
    dynlib: "libpari.so".}

#
var
  genM1* {.importc: "gen_m1", dynlib: "libpari.so".}: Gen
  gen1* {.importc: "gen_1", dynlib: "libpari.so".}: Gen
  gen2* {.importc: "gen_2", dynlib: "libpari.so".}: Gen
  genM2* {.importc: "gen_m2", dynlib: "libpari.so".}: Gen
  ghalf* {.importc: "ghalf", dynlib: "libpari.so".}: Gen
  gen0* {.importc: "gen_0", dynlib: "libpari.so".}: Gen
  gnil* {.importc: "gnil", dynlib: "libpari.so".}: Gen
  errESTACK* {.importc: "err_e_STACK", dynlib: "libpari.so".}: Gen

#
proc pariPrintf*(fmt: cstring) {.varargs, cdecl, importc: "pari_printf",
                              dynlib: "libpari.so".}

proc conjvec*(x: Gen; prec: clong): Gen {.cdecl, importc: "conjvec", dynlib: "libpari.so".}
proc gadd*(x: Gen; y: Gen): Gen {.cdecl, importc: "gadd", dynlib: "libpari.so".}
proc gaddsg*(x: clong; y: Gen): Gen {.cdecl, importc: "gaddsg", dynlib: "libpari.so".}
proc gconj*(x: Gen): Gen {.cdecl, importc: "gconj", dynlib: "libpari.so".}
proc gdiv*(x: Gen; y: Gen): Gen {.cdecl, importc: "gdiv", dynlib: "libpari.so".}
proc gdivgs*(x: Gen; s: clong): Gen {.cdecl, importc: "gdivgs", dynlib: "libpari.so".}
proc ginv*(x: Gen): Gen {.cdecl, importc: "ginv", dynlib: "libpari.so".}
proc gmul*(x: Gen; y: Gen): Gen {.cdecl, importc: "gmul", dynlib: "libpari.so".}
proc gmul2n*(x: Gen; n: clong): Gen {.cdecl, importc: "gmul2n", dynlib: "libpari.so".}
proc gmulsg*(s: clong; y: Gen): Gen {.cdecl, importc: "gmulsg", dynlib: "libpari.so".}
proc gsqr*(x: Gen): Gen {.cdecl, importc: "gsqr", dynlib: "libpari.so".}
proc gsub*(x: Gen; y: Gen): Gen {.cdecl, importc: "gsub", dynlib: "libpari.so".}
proc gsubsg*(x: clong; y: Gen): Gen {.cdecl, importc: "gsubsg", dynlib: "libpari.so".}
proc invSer*(b: Gen): Gen {.cdecl, importc: "inv_ser", dynlib: "libpari.so".}
proc mulcxI*(x: Gen): Gen {.cdecl, importc: "mulcxI", dynlib: "libpari.so".}
proc mulcxmI*(x: Gen): Gen {.cdecl, importc: "mulcxmI", dynlib: "libpari.so".}
proc serNormalize*(x: Gen): Gen {.cdecl, importc: "ser_normalize", dynlib: "libpari.so".}

#
proc pi2n*(n: clong; prec: clong): Gen {.cdecl, importc: "Pi2n", dynlib: "libpari.so".}
proc piI2*(prec: clong): Gen {.cdecl, importc: "PiI2", dynlib: "libpari.so".}
proc piI2n*(n: clong; prec: clong): Gen {.cdecl, importc: "PiI2n", dynlib: "libpari.so".}
proc qpExp*(x: Gen): Gen {.cdecl, importc: "Qp_exp", dynlib: "libpari.so".}
proc qpLog*(x: Gen): Gen {.cdecl, importc: "Qp_log", dynlib: "libpari.so".}
proc qpSqrt*(x: Gen): Gen {.cdecl, importc: "Qp_sqrt", dynlib: "libpari.so".}
proc qpSqrtn*(x: Gen; n: Gen; zetan: ptr Gen): Gen {.cdecl, importc: "Qp_sqrtn",
    dynlib: "libpari.so".}
proc znIspower*(a: Gen; q: Gen; k: Gen; pt: ptr Gen): clong {.cdecl, importc: "Zn_ispower",
    dynlib: "libpari.so".}
proc znIssquare*(x: Gen; n: Gen): clong {.cdecl, importc: "Zn_issquare", dynlib: "libpari.so".}
proc znSqrt*(x: Gen; n: Gen): Gen {.cdecl, importc: "Zn_sqrt", dynlib: "libpari.so".}
proc zpTeichmuller*(x: Gen; p: Gen; n: clong; q: Gen): Gen {.cdecl,
    importc: "Zp_teichmuller", dynlib: "libpari.so".}
proc agm*(x: Gen; y: Gen; prec: clong): Gen {.cdecl, importc: "agm", dynlib: "libpari.so".}
proc constcatalan*(prec: clong): Gen {.cdecl, importc: "constcatalan", dynlib: "libpari.so".}
proc consteuler*(prec: clong): Gen {.cdecl, importc: "consteuler", dynlib: "libpari.so".}
proc constlog2*(prec: clong): Gen {.cdecl, importc: "constlog2", dynlib: "libpari.so".}
proc constpi*(prec: clong): Gen {.cdecl, importc: "constpi", dynlib: "libpari.so".}
proc cxexpm1*(z: Gen; prec: clong): Gen {.cdecl, importc: "cxexpm1", dynlib: "libpari.so".}
proc expIr*(x: Gen): Gen {.cdecl, importc: "expIr", dynlib: "libpari.so".}
proc exp1rAbs*(x: Gen): Gen {.cdecl, importc: "exp1r_abs", dynlib: "libpari.so".}
proc gcos*(x: Gen; prec: clong): Gen {.cdecl, importc: "gcos", dynlib: "libpari.so".}
proc gcotan*(x: Gen; prec: clong): Gen {.cdecl, importc: "gcotan", dynlib: "libpari.so".}
proc gexp*(x: Gen; prec: clong): Gen {.cdecl, importc: "gexp", dynlib: "libpari.so".}
proc gexpm1*(x: Gen; prec: clong): Gen {.cdecl, importc: "gexpm1", dynlib: "libpari.so".}
proc glog*(x: Gen; prec: clong): Gen {.cdecl, importc: "glog", dynlib: "libpari.so".}
proc gpow*(x: Gen; n: Gen; prec: clong): Gen {.cdecl, importc: "gpow", dynlib: "libpari.so".}
proc gpowgs*(x: Gen; n: clong): Gen {.cdecl, importc: "gpowgs", dynlib: "libpari.so".}
proc gsin*(x: Gen; prec: clong): Gen {.cdecl, importc: "gsin", dynlib: "libpari.so".}
proc gsincos*(x: Gen; s: ptr Gen; c: ptr Gen; prec: clong) {.cdecl, importc: "gsincos",
    dynlib: "libpari.so".}
proc gsqrt*(x: Gen; prec: clong): Gen {.cdecl, importc: "gsqrt", dynlib: "libpari.so".}
proc gsqrtn*(x: Gen; n: Gen; zetan: ptr Gen; prec: clong): Gen {.cdecl, importc: "gsqrtn",
    dynlib: "libpari.so".}
proc gtan*(x: Gen; prec: clong): Gen {.cdecl, importc: "gtan", dynlib: "libpari.so".}
proc logrAbs*(x: Gen): Gen {.cdecl, importc: "logr_abs", dynlib: "libpari.so".}
proc mpcos*(x: Gen): Gen {.cdecl, importc: "mpcos", dynlib: "libpari.so".}
proc mpeuler*(prec: clong): Gen {.cdecl, importc: "mpeuler", dynlib: "libpari.so".}
proc mpcatalan*(prec: clong): Gen {.cdecl, importc: "mpcatalan", dynlib: "libpari.so".}
proc mpsincosm1*(x: Gen; s: ptr Gen; c: ptr Gen) {.cdecl, importc: "mpsincosm1",
    dynlib: "libpari.so".}
proc mpexp*(x: Gen): Gen {.cdecl, importc: "mpexp", dynlib: "libpari.so".}
proc mpexpm1*(x: Gen): Gen {.cdecl, importc: "mpexpm1", dynlib: "libpari.so".}
proc mplog*(x: Gen): Gen {.cdecl, importc: "mplog", dynlib: "libpari.so".}
proc mplog2*(prec: clong): Gen {.cdecl, importc: "mplog2", dynlib: "libpari.so".}
proc mppi*(prec: clong): Gen {.cdecl, importc: "mppi", dynlib: "libpari.so".}
proc mpsin*(x: Gen): Gen {.cdecl, importc: "mpsin", dynlib: "libpari.so".}
proc mpsincos*(x: Gen; s: ptr Gen; c: ptr Gen) {.cdecl, importc: "mpsincos", dynlib: "libpari.so".}
proc powis*(x: Gen; n: clong): Gen {.cdecl, importc: "powis", dynlib: "libpari.so".}
proc powiu*(p: Gen; k: ulong): Gen {.cdecl, importc: "powiu", dynlib: "libpari.so".}
proc powrfrac*(x: Gen; n: clong; d: clong): Gen {.cdecl, importc: "powrfrac",
    dynlib: "libpari.so".}
proc powrs*(x: Gen; n: clong): Gen {.cdecl, importc: "powrs", dynlib: "libpari.so".}
proc powrshalf*(x: Gen; s: clong): Gen {.cdecl, importc: "powrshalf", dynlib: "libpari.so".}
proc powru*(x: Gen; n: ulong): Gen {.cdecl, importc: "powru", dynlib: "libpari.so".}
proc powruhalf*(x: Gen; s: ulong): Gen {.cdecl, importc: "powruhalf", dynlib: "libpari.so".}
proc powuu*(p: ulong; k: ulong): Gen {.cdecl, importc: "powuu", dynlib: "libpari.so".}
proc powgi*(x: Gen; n: Gen): Gen {.cdecl, importc: "powgi", dynlib: "libpari.so".}
proc serchop0*(s: Gen): Gen {.cdecl, importc: "serchop0", dynlib: "libpari.so".}
proc sqrtnint*(a: Gen; n: clong): Gen {.cdecl, importc: "sqrtnint", dynlib: "libpari.so".}
proc teich*(x: Gen): Gen {.cdecl, importc: "teich", dynlib: "libpari.so".}
proc transEval*(fun: cstring; f: proc (a2: Gen; a3: clong): Gen {.cdecl.}; x: Gen;
               prec: clong): Gen {.cdecl, importc: "trans_eval", dynlib: "libpari.so".}
proc upowuu*(p: ulong; k: ulong): ulong {.cdecl, importc: "upowuu", dynlib: "libpari.so".}
proc usqrtn*(a: ulong; n: ulong): ulong {.cdecl, importc: "usqrtn", dynlib: "libpari.so".}
proc usqrt*(a: ulong): ulong {.cdecl, importc: "usqrt", dynlib: "libpari.so".}


#conversion
proc strtoGENstr*(s: cstring): Gen {.cdecl, importc: "strtoGENstr", dynlib: "libpari.so".}
proc strtoi*(s: cstring): Gen {.cdecl, importc: "strtoi", dynlib: "libpari.so".}
proc strtor*(s: cstring; prec: clong): Gen {.cdecl, importc: "strtor", dynlib: "libpari.so".}
proc gtodouble*(x: Gen): cdouble {.cdecl, importc: "gtodouble", dynlib: "libpari.so".}
proc itostr*(x: Gen): cstring {.cdecl, importc: "itostr", dynlib: "libpari.so".}
proc Gentostr*(x: Gen): cstring {.cdecl, importc: "GENtostr", dynlib: "libpari.so".}
proc stoi*(x: clong): Gen {.cdecl, importc: "stoi", dynlib: "libpari.so".}
proc dbltor*(x: cdouble): Gen {.cdecl, importc: "dbltor", dynlib: "libpari.so".}

#
proc GenCast(a: untyped):Gen =
  case a.type.name:
         of "Gen":
           result = a
         of "int":
           result = stoi(cast[clong](a))
         of "float64":
           result = dbltor(cast[cdouble](a))
         else:
           result = gen0

proc op2swap(op2: NimNode, pariop: NimNode): string =
  result = "proc `" & (op2.strval) & "`(a:Gen, b:int):Gen=" & (pariop.strval) & "(a,stoi(cast[clong](b)))\n"
  result &= "proc `" & (op2.strval) & "`(a:int, b:Gen):Gen=" & (pariop.strval) & "(stoi(cast[clong](a)),b)\n"
  result &= "proc `" & (op2.strval) & "`(a:Gen, b:float64):Gen=" & (pariop.strval) & "(a,dbltor(cast[cdouble](b)))\n"
  result &= "proc `" & (op2.strval) & "`(a:float64, b: Gen):Gen=" & (pariop.strval) & "(dbltor(cast[cdouble](a)),b)\n"

macro ops(op2: string, pariop: string): stmt =
  var res =  "proc `" & (op2.strval) & "`(a:Gen, b:Gen):Gen=" & (pariop.strval) & "(a,b)\n"
  res &= op2swap(op2, pariop)
  result = parseStmt(res)

ops("+","gadd")
ops("*","gmul")
ops("/","gdiv")
ops("-","gsub")

proc `$`(a:Gen):string =
  $Gentostr(a)


#
var prec: clong
prec = 12

pariInit(200000,900000)

echo gtodouble( kbessel(gen0, strtor("0.45", prec), prec))

var a: Gen
a= strtor("152.2156",prec)
var b= gadd(strtor("152.2156",prec),a)

echo a
echo a+b*b/1000.5*800-a*1.5/a+a+1*8+kbessel(gen0,1*gen1, prec)
