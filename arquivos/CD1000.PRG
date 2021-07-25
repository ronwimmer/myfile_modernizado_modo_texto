*----------------------------------------------------------------------------------
* CD1000 ..... programa menu cadastro de DISTRIBUIDORES/ASSOCIADOS
* data ....... 26.10.96  ultima revisao
*----------------------------------------------------------------------------------
static TCOD

function FCD1000()

local OPC
local TELA_ARQ

while .T.
   OPC := 0
   TELA_ARQ := SaveScreen()
   @ 14,12 prompt chr(179) + "a.Incluir " + chr(16) message "" // CD1100(1)
   @ 15,12 prompt chr(179) + "b.Alterar " + chr(16) message "" // CD1100(2)
   @ 16,12 prompt chr(179) + "c.Olhar   " + chr(16) message "" // CD1100(3)
   @ 17,12 prompt chr(179) + "d.Voltar   "          message "" 
   menu to OPC
   do case
      case OPC = 1
           FCD1100("1")
      case OPC = 2
           FCD1100("2")
      case OPC = 3
           FCD1100("3")
      case OPC = 0 .or. OPC = 4
           exit
   endcase
   RestScreen( 00, 00, MaxRow(), MaxCol(), TELA_ARQ )
enddo
setcolor(M->W_NORMAL)
RestScreen( 00, 00, MaxRow(), MaxCol(), TELA_ARQ )

return NIL
*...........................................................................
* CD1100 ...... modulo CADASTRO
*
function FCD1100(XOPCAO_T)

local GetList := {}

FARQUIVOS("NETASSOC","MK_ASS",M->WARQ_F,"1")

if XOPCAO_T = "1"
   FCD_T_DISTRIB()           && start tela de cadastro de cliente
else
   FBW_T_DISTRIB()           && start tela de cadastro de cliente
endif

F_VAR_DISTRIB()           && start variaveis de clientes

dbSelectArea( "NETASSOC" )
if XOPCAO_T = "1"
   M->WCADASTRO := date()
   NETASSOC->( dbGoBottom() )
   M->TCOD := val(NETASSOC->IDCHAVE) + 1
else
   M->TCOD := 0
endif

while .T.
   clear gets
   @ 03,39 get M->TCOD  pict "@E 9,999,999" color M->W_JANELA_I
   read
   set( _SET_CONFIRM, .F. )              // set confirm OFF

   if lastkey() == 27 .or. M->TCOD = 0
      exit
   endif

   //  if F_seek(str(M->TCOD,7,0),"NETASSOC")
   if NETASSOC->( dbSeek(str(M->TCOD,7,0)))
      tone()
      FCD1130()                      && display de campo "say"s"
      do case
         case XOPCAO_T = "1"
            inkey(30)
            exit
         case XOPCAO_T = "3"
            FCD1140("CD1")         && display de campo "say"s"
            exit
      endcase
   else
      if XOPCAO_T = "3"
         tone()
         @ 01,00 say M->MSG2 color M->W_MSG
         inkey(10)
         @ 01,00
         exit
      endif
      if XOPCAO_T = "2"
         exit
      endif
   endif

   do case
      case XOPCAO_T = "1"
         if FCD1110("1") = .T.   && entrada de dados "GET"s"
            FCD1111("1")         && replace de dados
         endif
      case XOPCAO_T = "2"
         if FCD1110("2") = .T.   && entrada de dados "GET"s"
            FCD1111("2")         && replace de dados
         endif
   endcase
   exit
enddo
setcolor(M->W_NORMAL)
@ 04,11 clear to 22,65
close database

return NIL
*-----------------------------------------------------------------------------
* CD1110...... sub-modulo INCLUSAO
*
function FCD1110(XOPCAO_G)

local GetList := {}

while .T.
   @ 03,69 say M->WCADASTRO   pict "@!"                color M->W_JANELA_I
   @ 05,39 get M->WNOME       pict "@n"                color M->W_JANELA_I
   @ 06,39 get M->WDT_NASC    pict "@!"                color M->W_JANELA_I

   @ 07,39 get M->WRAZAO      pict "@n"                color M->W_JANELA_I
   @ 08,39 get M->WDOCUMENTO  pict "@N"                color M->W_JANELA_I

   @ 09,39 get M->WEND_RUA    pict "@n"                color M->W_JANELA_I
   @ 10,39 get M->WEND_BAIRRO pict "@n"                color M->W_JANELA_I
   @ 11,39 get M->WEND_CIDADE pict "@n"                color M->W_JANELA_I
   @ 12,39 get M->WEND_CEP    pict "!!!!!!!!!"         color M->W_JANELA_I
   @ 12,57 get M->WEND_UF     pict "@!"                color M->W_JANELA_I

   @ 13,39 get M->WFONE_RES   pict "@n"                color M->W_JANELA_I
   @ 14,39 get M->WFONE_CEL   pict "@n"                color M->W_JANELA_I

   @ 15,34 get M->WEND_EMAIL  pict "@n"                color M->W_JANELA_I
   @ 16,34 get M->WWEB_SITE   pict "@n"                color M->W_JANELA_I
   @ 17,34 get M->WNUM_ICQ    pict "@n"                color M->W_JANELA_I

   if XOPCAO_G = "1"
      @ 19,34 get M->WOBS1       pict "@n"             color M->W_JANELA_I
      @ 20,34 get M->WOBS2       pict "@n"             color M->W_JANELA_I
      @ 21,34 get M->WOBS3       pict "@n"             color M->W_JANELA_I
   endif
   read

   setcolor(M->W_NORMAL)
   @ 01,00
   exit
enddo
set( _SET_CONFIRM, .T. )              // set confirm ON
return .T.

*...........................................................................
* CD1111...... sub-modulo REPLACE
*
function FCD1111(XOPCAO_G)

local W_NUMERO
local W_ROMARC
local GTENTA

dbSelectArea( "NETASSOC" )
W_NUMERO := reccount() + 1
W_ROMARC := mod(W_NUMERO , 2)

if XOPCAO_G = "2"
   NETASSOC->( dbSeek( str(M->TCOD,7,0) ))
endif
for GTENTA := 1 to 5
    if NETASSOC->( flock() )
       if XOPCAO_G = "1"
		  NETASSOC->( dbappend() )
          NETASSOC->IDCHAVE  := str(M->TCOD,7,0)
          NETASSOC->CADASTRO := dtoc(M->WCADASTRO)
          NETASSOC->DETALHE  := dtoc(M->WCADASTRO)+"..."+alltrim(M->WOBS1)+" "+alltrim(M->WOBS2)+" "+alltrim(M->WOBS3)
       endif
       NETASSOC->NOME         := M->WNOME
       NETASSOC->RAZAO        := M->WRAZAO
       NETASSOC->DOCUMENTO    := M->WDOCUMENTO
       NETASSOC->DT_NASC      := M->WDT_NASC
       NETASSOC->END_RUA      := M->WEND_RUA
       NETASSOC->END_BAIRRO   := M->WEND_BAIRRO
       NETASSOC->END_CIDADE   := M->WEND_CIDADE
       NETASSOC->END_CEP      := M->WEND_CEP
       NETASSOC->END_UF       := M->WEND_UF
       NETASSOC->FONE_RES     := M->WFONE_RES
       NETASSOC->FONE_CEL     := M->WFONE_CEL
       NETASSOC->END_EMAIL    := M->WEND_EMAIL
       NETASSOC->WEB_SITE     := M->WWEB_SITE
       NETASSOC->NUM_ICQ      := M->WNUM_ICQ
       NETASSOC->( dbCommit() )
       NETASSOC->( dbUnlock() )
       M->TCOD := 0
       exit
    else
       tone()
       @ 01,00 say M->MSG2 color M->W_LINHA0123
       inkey(4)
       GTENTA := 0
    endif
next

return NIL
*...........................................................................
* CD1130...... sub-modulo SAY"S
*
function FCD1130()

M->WIDCHAVE     :=  val(NETASSOC->IDCHAVE)
M->WCADASTRO    :=  ctod(NETASSOC->CADASTRO)
M->WRAZAO       :=  NETASSOC->RAZAO
M->WNOME        :=  NETASSOC->NOME
M->WDT_NASC     :=  NETASSOC->DT_NASC
M->WDOCUMENTO   :=  NETASSOC->DOCUMENTO

M->WEND_RUA     :=  NETASSOC->END_RUA
M->WEND_BAIRRO  :=  NETASSOC->END_BAIRRO
M->WEND_CIDADE  :=  NETASSOC->END_CIDADE
M->WEND_CEP     :=  NETASSOC->END_CEP
M->WEND_UF      :=  NETASSOC->END_UF

M->WFONE_RES    :=  NETASSOC->FONE_RES
M->WFONE_CEL    :=  NETASSOC->FONE_CEL

M->WEND_EMAIL   :=  NETASSOC->END_EMAIL
M->WWEB_SITE    :=  NETASSOC->WEB_SITE
M->WNUM_ICQ     :=  NETASSOC->NUM_ICQ

@ 03,39 say M->WIDCHAVE    pict "@E 9,999,999"         color M->W_JANELA_I

@ 03,69 say M->WCADASTRO   pict "@!"                color M->W_JANELA_I
@ 05,39 say M->WNOME       pict "@n"                color M->W_JANELA_I
@ 06,39 say M->WDT_NASC    pict "@!"                color M->W_JANELA_I

@ 07,39 say M->WRAZAO      pict "@n"                color M->W_JANELA_I
@ 08,39 say M->WDOCUMENTO  pict "@!"                color M->W_JANELA_I

@ 09,39 say M->WEND_RUA    pict "@n"                color M->W_JANELA_I
@ 10,39 say M->WEND_BAIRRO pict "@n"                color M->W_JANELA_I
@ 11,39 say M->WEND_CIDADE pict "@n"                color M->W_JANELA_I
@ 12,39 say M->WEND_CEP    pict "!!!!!!!!!"         color M->W_JANELA_I
@ 12,57 say M->WEND_UF     pict "@n"                color M->W_JANELA_I

@ 13,39 say M->WFONE_RES   pict "@n"                color M->W_JANELA_I
@ 14,39 say M->WFONE_CEL   pict "@n"                color M->W_JANELA_I

@ 15,34 say M->WEND_EMAIL  pict "@n"                color M->W_JANELA_I
@ 16,34 say M->WWEB_SITE   pict "@n"                color M->W_JANELA_I
@ 17,34 say M->WNUM_ICQ    pict "@n"                color M->W_JANELA_I

return NIL
*...........................................................................
* CD1140...... sub-modulo SAY"S de  tela #1 consulta + AVANCA , - RETROCEDE
*
function FCD1140(X_TIPO_CADASTRO)

local X_TECLA

while .t.
    @ 01,00 say pad(" Navegar Pagina : Anterior [-]  Posterior [+]  Sair Consulta [ESC]",80) color M->W_MSG
    X_TECLA = lastkey()
    do case
       case X_TECLA == 27                   && teclou ESC
            exit
       case X_TECLA == 43                   && Caso a opcao teclada for o operdador [+]
           NETASSOC->( dbSkip() )           && Move o ponteiro do arquivo um registro a frente
           if eof()                         && Se for fim de arquivo
               F_Mensagem( "Ultimo Registro alcancado")          && Exibe mensagem
               set( _SET_CONFIRM, .F. )     // set confirm off - Desliga o estado do CONFIRM
               NETASSOC->( dbGoBottom() )   && Move o ponteiro
               loop                         && Retorna o processamento
           endif                            && Fim do IF
       case X_TECLA == 45                   && Caso a opcao teclada for o operdador [-]
           NETASSOC->( dbSkip(-1) )         && Move o ponteiro do arquivo um registro para traz
           if NETASSOC->( bof() )           && Se for inicio de arquivo
                F_Mensagem( "Primeiro Registro alcancado" )  && Exibe mensagem
                set( _SET_CONFIRM, .F. )    // set confirm off - Desliga o estado do CONFIRM
                NETASSOC->( dbGoTop() )     && Move o ponteiro
                loop                        && Retorna o processamento
           endif                            && Fim do IF
    endcase
    do case
       case X_TIPO_CADASTRO = "CD1"
            FCD1130()            && display de campo "say"s" - cliente
    endcase
    inkey(30)
enddo
@ 01,00

return NIL
