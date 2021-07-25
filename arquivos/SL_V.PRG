*------------------------------[ VARIAVEIS GERAIS DE AMBIENTE ]----------
function F_VAR_AMBIENTE()

public WSER,WVER,WLTP_B,WLTP_R,WARQ_F,WARQ_T
public WPATH1,WPATH2,WPATH3,WPATH4
public WIDIOMA,WINGLES,WPORTUGUES
public WIL_ENFATIZADO,WID_ENFATIZADO
public WIL_NEGRITO   ,WID_NEGRITO

M->WARQ_F     := .F.    && SET EXCLUSIVE OFF
M->WARQ_T     := .T.    && SET EXCLUSIVE ON

M->WIDIOMA    := "P"
M->WPORTUGUES := "c:\arquiv~1\intern~1\iexplore.exe"
M->WINGLES    := "c:\progra~1\intern~1\iexplore.exe"

M->WLTP_B     := "LPT1:"
M->WLTP_R     := "LPT1:"
M->WPATH1     := "\DOC\"

M->WIL_NEGRITO    := chr(27)+chr(71)  && liga   caracter negrito
M->WID_NEGRITO    := chr(27)+chr(72)  && deliga caracter negrito
M->WIL_ENFATIZADO := chr(27)+chr(69)  && liga   caracter enfatizado
M->WID_ENFATIZADO := chr(27)+chr(70)  && deliga caracter enfatizado

M->WVER := "4f"
M->WSER := "CAD2014-xHB"

close data

return NIL
*---------------------------------------------[ CONSULTA - Geral ] ----------
* variavel consulta geral
*
function F_VAR_PSQ_GERAL()

public CC,CT,LL,TT
public WREG,WCOD,WDET

M->WREG := array(16)
M->WCOD := array(16)
M->WDET := array(16)

afill(M->WREG,0,1,16)
afill(M->WCOD,space(02),1,16)
afill(M->WDET,space(76),1,16)

return NIL
*------------------------------------------[ VARIAVEIS DISTRIBUIDOR ]--------
function F_VAR_DISTRIB()

public WIDCHAVE,WDOCUMENTO,WNOME,WCADASTRO,WRAZAO
public WEND_RUA,WEND_BAIRRO,WEND_CIDADE,WEND_CEP,WEND_UF,WDT_NASC
public WFONE_DDD,WFONE_RES,WFONE_CEL
public WEND_EMAIL,WWEB_SITE,WNUM_ICQ
public WOBS1,WOBS2,WOBS3

M->WIDCHAVE    := 0
M->WDOCUMENTO  := space(40)
M->WCADASTRO   := date()               //_date()
M->WRAZAO      := space(40)
M->WNOME       := space(40)
M->WDT_NASC    := "  /  /    "

M->WEND_RUA    := space(40)
M->WEND_BAIRRO := space(30)
M->WEND_CIDADE := pad("Sao Paulo",30)
M->WEND_CEP    := space(09)
M->WEND_UF     := space(22)

M->WFONE_DDD   := space(04)
M->WFONE_RES   := space(30)
M->WFONE_CEL   := space(30)

M->WEND_EMAIL  := space(45)
M->WWEB_SITE   := space(45)
M->WNUM_ICQ    := space(45)

M->WOBS1       := space(45)
M->WOBS2       := space(45)
M->WOBS3       := space(45)

return NIL