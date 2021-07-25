*----------------------------------------------------------------------------------
* CR1000 ..... programa menu cadastro
* data ....... 26.10.96  ultima revisao
*       ...... sub-modulo EDITA CAMPO MEMO
*----------------------------------------------------------------------------------
static TCOD

function FCR1000()

local OPC
local TELA_BWX

set( _SET_WRAP, .T. )                 // set wrap ON
set( _SET_DATEFORMAT, "dd/mm/yy" )    // set date british
OPC := 0

FARQUIVOS("NETASSOC","MK_ASS",M->WARQ_F,"1")

TELA_BWX := SaveScreen()

FDB_DETALHE()            && abre browse

setcolor(M->W_NORMAL)

RestScreen( 0,0,MaxRow(),MaxCol(), TELA_BWX )

close database

return NIL
*...........................................................................
* CR1100...... sub-modulo EDITA CAMPO MEMO
*
function FCR1100()

local WDETALHE, GTENTA

FCD_T_DETALHE()           && start tela de cadastro de cliente

TCOD := val(NETASSOC->IDCHAVE)

if NETASSOC->( dbSeek(str(TCOD,7,0)) )
   tone()
   WDETALHE :=  NETASSOC->DETALHE

   @ 03,12 say val(NETASSOC->IDCHAVE)   pict "9,999,999"         color M->W_JANELA_I
   @ 03,69 say ctod(NETASSOC->CADASTRO) pict "@d"                color M->W_JANELA_I

   @ 04,12 say NETASSOC->RAZAO          pict "@n"                color M->W_JANELA_I
   @ 05,12 say NETASSOC->NOME           pict "@n"                color M->W_JANELA_I

   @ 06,12 say NETASSOC->END_CIDADE     pict "@n"                color M->W_JANELA_I
   @ 06,46 say NETASSOC->END_UF         pict "@n"                color M->W_JANELA_I
   @ 06,67 say NETASSOC->END_CEP        pict "!!!!!!!!!"         color M->W_JANELA_I

   @ 07,12 say NETASSOC->FONE_RES       pict "@n"                color M->W_JANELA_I
   @ 07,48 say NETASSOC->FONE_CEL       pict "@n"                color M->W_JANELA_I


   setcolor(M->W_JANELA_I)
   WDETALHE := memoedit( NETASSOC->DETALHE,09,01,20,78,.T.)
   setcolor(M->W_NORMAL)

   for GTENTA := 1 to 5
       if NETASSOC->(flock())
          NETASSOC->DETALHE := WDETALHE
          NETASSOC->(dbCommit())
          NETASSOC->(dbUnlock())
          exit
       else
          tone()
          @ 01,00 say M->MSG2 color M->W_LINHA0123
          inkey(4)
          GTENTA := 0
       endif
   next

endif
setcolor(M->W_NORMAL)

return NIL
*...........................................................................
* CR2000...... sub-modulo EDITA CAMPO MEMO
*
function FCR2000()

local WDETALHEX

FCD_T_DETALHE()           && start tela de cadastro de cliente

tone()
WDETALHEX :=  NETASSOC->DETALHE

@ 03,12 say val(NETASSOC->IDCHAVE)   pict "9,999,999"         color M->W_JANELA_I
@ 03,69 say ctod(NETASSOC->CADASTRO) pict "@d"                color M->W_JANELA_I

@ 04,12 say NETASSOC->RAZAO          pict "@n"                color M->W_JANELA_I
@ 05,12 say NETASSOC->NOME           pict "@n"                color M->W_JANELA_I

@ 06,12 say NETASSOC->END_CIDADE     pict "@n"                color M->W_JANELA_I
@ 06,46 say NETASSOC->END_UF         pict "@n"                color M->W_JANELA_I
@ 06,67 say NETASSOC->END_CEP        pict "!!!!!!!!!"         color M->W_JANELA_I

@ 07,12 say NETASSOC->FONE_RES       pict "@n"                color M->W_JANELA_I
@ 07,48 say NETASSOC->FONE_CEL       pict "@n"                color M->W_JANELA_I

setcolor(M->W_JANELA_I)
WDETALHEX := memoedit( NETASSOC->DETALHE,09,01,20,78,.F.)

setcolor(M->W_NORMAL)

return NIL
*...........................................................................
* CR3000...... sub-modulo EDITA CAMPO MEMO
*
function FCR3000()

local WDETALHEX, RESH1, WDETALHE, GTENTA

FCD_T_DETALHE()           && start tela de cadastro de cliente

@ 01,00 say space(80)                           color M->W_LINHA0123

tone()
WDETALHEX    :=  NETASSOC->DETALHE

@ 03,12 say val(NETASSOC->IDCHAVE)   pict "9,999,999"         color M->W_JANELA_I
@ 03,69 say ctod(NETASSOC->CADASTRO) pict "@d"                color M->W_JANELA_I

@ 04,12 say NETASSOC->RAZAO          pict "@n"                color M->W_JANELA_I
@ 05,12 say NETASSOC->NOME           pict "@n"                color M->W_JANELA_I

@ 06,12 say NETASSOC->END_CIDADE     pict "@n"                color M->W_JANELA_I
@ 06,46 say NETASSOC->END_UF         pict "@n"                color M->W_JANELA_I
@ 06,67 say NETASSOC->END_CEP        pict "!!!!!!!!!"         color M->W_JANELA_I

@ 07,12 say NETASSOC->FONE_RES       pict "@n"                color M->W_JANELA_I
@ 07,48 say NETASSOC->FONE_CEL       pict "@n"                color M->W_JANELA_I

setcolor(M->W_JANELA_T)
WDETALHEX := memoedit( NETASSOC->DETALHE,09,01,20,78,.F.)

RESH1 := 0
setcolor(M->W_NORMAL)
@ 01,00 say M->MSG31     color M->W_MSG_OPC
@ 01,02 prompt "NAO"  
@ 01,06 prompt "SIM"  
menu to RESH1
do case
   case RESH1 = 2

   setcolor(M->W_JANELA_I)
   WDETALHE := memoedit( NETASSOC->DETALHE,09,01,20,78,.T.)
   setcolor(M->W_NORMAL)

   for GTENTA := 1 to 5
       if NETASSOC->(flock())
          NETASSOC->DETALHE := WDETALHE
          NETASSOC->( dbCommit() )
          NETASSOC->( dbUnlock() )
          exit
       else
          tone()
          @ 01,00 say M->MSG2 color M->W_LINHA0123
          inkey(4)
          GTENTA := 0
       endif
   next
endcase

setcolor(M->W_NORMAL)

return NIL
