***[IMPRESSAO HTML ]********************************************************
*............................................................................
* desativa a impressora
*
function FDEIMP(X_ARQUIVO,X_EXTENSAO)

set( _SET_CONSOLE, .T. )     // set console ON
set( _SET_DEVICE, "SCREEN" ) // set device to screen
set( _SET_PRINTFILE, "" )    // set printer to
set( _SET_PRINTER, .F. )     // set print off

@ 01,00 say M->MSG13 color M->W_MSG
@ 01,00

return NIL
*-------------------------------------------------------------------------
* verifica estado da impressora
*
function FIMPRS(X_ARQUIVO,X_EXTENSAO)

local WDISCO
local WARQ
local WPATH0
local WDRIVE
local XARQ

WDISCO := diskname()
WARQ := X_ARQUIVO
M->WPATH0 := ""
WDRIVE := curdir()

if len(WDRIVE) = 3
   WDRIVE := substr(WDRIVE,1,2)
endif

M->WPATH0 := WDISCO+":\"+WDRIVE+alltrim(M->WPATH1)

XARQ := M->WPATH0+alltrim(upper(WARQ))+"."+upper(X_EXTENSAO)

@ 01,00 say M->MSG18 color M->W_MSG

Fexplode(02,00,06,79,"D",M->W_MSG)
*            12345678901234567890123456789
@ 03,01 say "File :          Extent :" color M->W_MSG
@ 04,01 say "Path :" color M->W_MSG
@ 05,01 say "Print:" color M->W_MSG

@ 03,07 say X_ARQUIVO  pict "!!!!!!!!" color M->W_MSG
@ 03,26 say X_EXTENSAO pict "!!!"      color M->W_MSG
@ 04,07 say M->WPATH0  pict "@!"       color M->W_MSG
@ 05,07 say XARQ       pict "@!"       color M->W_MSG
INKEY(3)

if file(XARQ)
   erase XARQ
endif

@ 01,00 say M->MSG16 color M->W_MSG

set( _SET_CONSOLE, .F. )     // set console Off
set( _SET_DEVICE, "PRINTER" ) // set device to printer
set( _SET_PRINTFILE, XARQ )    // set printer to &XARQ
set( _SET_PRINTER, .T. )     // set print on

return NIL
*............................................................................
* cabecalhos impressora
*
function FCABEC()

? [<html>]
? [<head>]
? [<title>M->MSG_TITULO_I</title>]
? [<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">]
? [</head>]
? [<body bgcolor="#FFFFFF" text="#000000" link="#0000FF" alink="#00CC00" vlink="#FF0000" leftMargin=0 topMargin=0 marginwidth=0 marginheight=0>]
? [<table width="701" border="0" valign="top" bgcolor="#FFFFFF" cellspacing="0">]
? [<td width=30% align="center" valign="middle">]
? [<img src="]+M->MSG_LOGO_I+[" width="30" height="30">]
? [</td>]
? [<td width=70% align="center" valign="top">]
? [<b>]
? [<font face="Arial, Helvetica, sans-serif" size="3">]
? M->MSG_TITULO_I
? [</font>]
? [</b>]
? [</td>]
? [</table>]

return NIL
*............................................................................
* rodape impressora
*
function FRODAPE()

? [</td>]
? [</tr>]
? [<tr valign="middle" align="center">]
? [<td colspan="2">]
? [<p><b><font face=verdana size=1 color=#999999>Copyright� 2007 - <a href='http://www.skydoo.b22.us'>skydoo</a></font></p>]
? [</td>]
? [</tr>]
? [</table>]
? [</body>]
? [</html>]

return NIL
***[IMPRESSAO TXT ]*********************************************************
*-------------------------------------------------------------------------
* verifica estado da impressora
*
function FCABEC_PRINT()

@ 01,00 say date()
@ 01,15 say M->MSG_TITULO_I

return NIL
*-------------------------------------------------------------------------
* procura arquivo impresso para visualizacao
*
function FI_FILES_TXT()

local OPC := 0
local WDISCO := diskname()
local W_MARCARA := ""
local WDRIVE := curdir()
local WPATH0
local WARQU0
local X_EXTENSAO
local TELA01
local N_ARQUIVO
local N_QTD
local WX_OPCAO
local X_PROGRAMA
local wcomando
local WN_FILE

if len(WDRIVE) = 3
   WDRIVE := substr(WDRIVE,1,2)
endif
while .T.
   TELA01 := SaveScreen()
   W_MARCARA := "*.TXT"
   X_EXTENSAO := "TXT"

   M->WPATH0 := ""
   WARQU0 := ""
   WDRIVE := curdir()
   if len(WDRIVE) = 3
      WDRIVE := substr(WDRIVE,1,2)
   endif

   if upper(WDRIVE) = "C:"
      M->WPATH0 := WDISCO+":\"+WDRIVE+alltrim(M->WPATH1)
      WARQU0 := M->WPATH0+W_MARCARA
   else
      M->WPATH0 := WDISCO+":\"+WDRIVE+"\DOC\"
      WARQU0 := M->WPATH0+W_MARCARA
   endif

   N_QTD := adir(WARQU0)

   if N_QTD > 0
      WN_FILE := array(N_QTD)
   else
      loop
   endif

   N_ARQUIVO := adir(WARQU0,WN_FILE)

   if N_ARQUIVO := 0
      loop
   endif

   Fexplode(02,65,13,78,"S",M->W_MENU)
   @ 03,66 say  "VerImpressao"  color M->W_MENU
   @ 04,65 say "+------------+" color M->W_MENU

   setcolor(M->W_MENU)
   WX_OPCAO := 0
   WX_OPCAO := achoice(05,66,12,77,WN_FILE)
   setcolor(M->W_NORMAL)
   if WX_OPCAO <> 0
       OPC := 0
       @ 14,36 prompt chr(179) + "a.Ver Standard"  // 1
       @ 15,36 prompt chr(179) + "b.Ver NotePad "  // 2
       @ 16,36 prompt chr(179) + "c.Voltar      "  // 3
       menu to OPC
       do case
           case OPC = 1
                X_PROGRAMA := "README.COM"
                wcomando := alltrim(M->WPATH0+"Readme "+M->WPATH0+WN_FILE[WX_OPCAO])
                Fexplode(02,00,05,79,"S",M->W_MSG)
                @ 03,05 say "{ Executando }" color M->W_MSG
                @ 04,04 SAY WCOMANDO color M->W_MSG
                INKEY(15)
*                execute wcomando
                __run( WCOMANDO )
                exit
           case OPC = 2
                X_PROGRAMA := "NOTEPAD.EXE"
                wcomando := alltrim("notepad "+M->WPATH0+WN_FILE[WX_OPCAO])
                Fexplode(02,00,05,79,"S",M->W_MSG)
                @ 03,05 say "{ Executando }" color M->W_MSG
                @ 04,04 SAY WCOMANDO color M->W_MSG
                INKEY(15)
*                execute wcomando
                __run( WCOMANDO )
                exit
           case OPC = 3 .or. OPC = 0
                exit
       endcase
   else
      exit
   endif
enddo
setcolor(M->W_NORMAL)

return NIL
*-------------------------------------------------------------------------
* procura arquivo impresso para visualizacao
*
function FI_FILES_HTM()

local OPC
local WDISCO
local W_MASCARA, W_MARCARA
local WDRIVE
local WPATH0
local WARQU0
local N_QTD
local N_ARQUIVO
local WX_OPCAO
local wcomando
local TELA01
local X_EXTENSAO
local WN_FILE

OPC := 0
WDISCO := diskname()
W_MASCARA := ""
WDRIVE := curdir()
if len(WDRIVE) = 3
   WDRIVE := substr(WDRIVE,1,2)
endif
while .T.
   TELA01 := SaveScreen()
   W_MARCARA := "*.HTM"
   X_EXTENSAO := "HTM"

   M->WPATH0 := ""
   WARQU0 := ""
   WDRIVE := curdir()
   if len(WDRIVE) = 3
      WDRIVE := substr(WDRIVE,1,2)
   endif

   if upper(WDRIVE) = "C:"
      M->WPATH0 := WDISCO+":\"+WDRIVE+alltrim(M->WPATH1)
      WARQU0 := M->WPATH0+W_MARCARA
   else
      M->WPATH0 := WDISCO+":\"+WDRIVE+"\DOC\"
      WARQU0 := M->WPATH0+W_MARCARA
   endif

   N_QTD := adir(WARQU0)

   if N_QTD > 0
      WN_FILE := array(N_QTD)
   else
      loop
   endif

   N_ARQUIVO := adir(WARQU0,WN_FILE)

   if N_ARQUIVO = 0
      loop
   endif

   Fexplode(02,65,13,78,"S",M->W_MENU)
   @ 03,66 say  "VerImpressao"  color M->W_MENU
   @ 04,65 say "+------------+" color M->W_MENU

   setcolor(M->W_MENU)
   WX_OPCAO := 0
   WX_OPCAO := achoice(05,66,12,77,WN_FILE)
   setcolor(M->W_NORMAL)
   if WX_OPCAO <> 0
      if M->WIDIOMA == "P"
         wcomando := alltrim(M->WPORTUGUES)+" "+alltrim(M->WPATH0+WN_FILE[WX_OPCAO])
         __run( wcomando )
      else
         wcomando := alltrim(M->WINGLES)+" "+alltrim(M->WPATH0+WN_FILE[WX_OPCAO])
         __run( wcomando )
      endif

      Fexplode(02,00,05,79,"S",M->W_MSG)
      @ 03,05 say "{ Executando }" color M->W_MSG
      @ 04,04 SAY WCOMANDO color M->W_MSG
      INKEY(5)
      exit
  else
      exit
  endif
enddo
setcolor(M->W_NORMAL)

return NIL
