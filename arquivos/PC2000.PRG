* PC2000..... browse de PROCURA DE NETASSOC
* data ...... 02.12.2001 ultima revisao
*
function FPC2000()

local OPC := 0
local TELA_ARQ

set( _SET_WRAP, .T. )                 // set wrap ON
set( _SET_DATEFORMAT, "dd/mm/yy" )    // set date british

TELA_ARQ := SaveScreen()
@ 14,12 prompt chr(179) + "a.Ordenado por ChaveID " + chr(16) // 1
@ 15,12 prompt chr(179) + "b.Ordenado por Nome    " + chr(16) // 2
@ 16,12 prompt chr(179) + "c.Voltar                " // 3
menu to OPC

do case
   case OPC = 1
        FARQUIVOS("NETASSOC","MK_ASS",M->WARQ_F,"1")
   case OPC = 2
        FARQUIVOS("NETASSOC","NK_ASS",M->WARQ_F,"1")
   case OPC = 3
        RestScreen( 0,0,MaxRow(),MaxCol(), TELA_ARQ )
        return .t.
   case OPC = 0
        RestScreen( 0,0,MaxRow(),MaxCol(), TELA_ARQ )
        return .t.
  endcase

FBW_T_DISTRIB()           && start tela de cadastro

* FBW_CLIENTES()            && abre browse

FDB_CLIENTES()            && abre browse

setcolor(M->W_NORMAL)

RestScreen( 0,0,MaxRow(),MaxCol(), TELA_ARQ )

close database

return NIL
*...........................................................................
* PC2100...... sub-modulo SAY"S
*
function FPC2100()

@ 03,39 say val(NETASSOC->IDCHAVE) pict "9,999,999"       color M->W_JANELA_I

@ 03,69 say NETASSOC->CADASTRO   pict "@d"                color M->W_JANELA_I
@ 05,39 say NETASSOC->NOME       pict "@n"                color M->W_JANELA_I
@ 06,39 say NETASSOC->DT_NASC    pict "@d"                color M->W_JANELA_I

@ 07,39 say NETASSOC->RAZAO      pict "@n"                color M->W_JANELA_I
@ 08,39 say NETASSOC->DOCUMENTO  pict "@!"                color M->W_JANELA_I

@ 09,39 say NETASSOC->END_RUA    pict "@n"                color M->W_JANELA_I
@ 10,39 say NETASSOC->END_BAIRRO pict "@n"                color M->W_JANELA_I
@ 11,39 say NETASSOC->END_CIDADE pict "@n"                color M->W_JANELA_I
@ 12,39 say NETASSOC->END_CEP    pict "!!!!!!!!!"         color M->W_JANELA_I
@ 12,57 say NETASSOC->END_UF     pict "@n"                color M->W_JANELA_I

@ 13,39 say NETASSOC->FONE_RES   pict "@n"                color M->W_JANELA_I
@ 14,39 say NETASSOC->FONE_CEL   pict "@n"                color M->W_JANELA_I

@ 15,34 say NETASSOC->END_EMAIL  pict "@n"                color M->W_JANELA_I
@ 16,34 say NETASSOC->WEB_SITE   pict "@n"                color M->W_JANELA_I
@ 17,34 say NETASSOC->NUM_ICQ    pict "@n"                color M->W_JANELA_I

return NIL