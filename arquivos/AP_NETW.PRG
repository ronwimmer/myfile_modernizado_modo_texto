* FAP_NETW .... sistema de aplicativos
*
function FAP_NETW()

local TELA_AP    

set( _SET_EXCLUSIVE, M->WARQ_T )    // set exclusive &WARQ_T
set( _SET_DATEFORMAT, "dd/mm/yy" )  // set date british
TELA_AP := SaveScreen()

Fexplode(02,49,06,77,"S",M->W_JANELA_T)

@ 03,50 say  "RAM livre:          BYTE   "   color M->W_JANELA_T
@ 04,50 say  "**** Arquivo Ordenando ****"   color M->W_JANELA_T
@ 03,61 say memory() pict "@B 9999,999"      color M->W_JANELA_I
@ 05,50 say  "Contatos: MK_ASS           "   color M->W_JANELA_T
FDELETE("NETASSOC","MK_ASS")
@ 05,75 say "ok"                          color M->W_JANELA_I
@ 05,50 say  "Contatos: NK_ASS           "   color M->W_JANELA_T
FDELETE("NETASSOC","NK_ASS")
@ 05,75 say "ok"                          color M->W_JANELA_I
@ 03,61 say memory() pict "@B 9999,999"      color M->W_JANELA_I

@ 01,00 say M->MSG4  color M->W_MSG
inkey(10)
RestScreen( 00, 00, MaxRow(), MaxCol(), TELA_AP )
setcolor(M->W_NORMAL)

return NIL