*
* FARQUIVOS - Abre arquivo em rede - versao 2
*
function FARQUIVOS( XARQUIVO, XINDICE, XSET, XAREA1 )

local WTENTA

set( _SET_EXCLUSIVE, XSET )            // set exclusive &XSET

if XAREA1 # " "
   dbSelectArea( val( XAREA1 ) )
endif

for WTENTA := 1 to 7
    dbUseArea(.T.,,XARQUIVO,XARQUIVO)
    //use &XARQUIVO alias &XARQUIVO
    if neterr()
       @ 01,00 say pad(XARQUIVO+" REDE -> Arquivo nao esta disponivel no momento <- REDE",80) color M->W_MSG
       inkey(4)
       WTENTA := 0
    else
       exit
    endif
next
if XINDICE # " "
   do case
      case XINDICE = "MK_ASS"       && associado
            index on NETASSOC->IDCHAVE to MK_ASS
      case XINDICE = "NK_ASS"       && associado
            index on NETASSOC->RAZAO to NK_ASS
   endcase
endif

dbUnlock()

return NIL
*----------------------------------------------------------------------------
* DELETE - elimina fisicamente registros dos arquivos em rede
*
function FDELETE(XARQUIVO,XINDICE)

local WTENTA

set( _SET_EXCLUSIVE, .T. )            // set exclusive ON

for WTENTA := 1 to 7
   dbUseArea(.T.,,XARQUIVO,XARQUIVO)
   //use &XARQUIVO alias &XARQUIVO
    if neterr()
       @ 01,00 say pad("REDE -> Arquivo n�o est� disponivel no momento <- REDE",80) color M->W_MSG
       inkey(4)
       WTENTA = 0
    else
       pack
       exit
    endif
next
if XINDICE # " "
   do case
      case XINDICE = "MK_ASS"
          index on NETASSOC->IDCHAVE to MK_ASS
      case XINDICE = "NK_ASS"
          index on NETASSOC->NOME to MK_ASS
   endcase
endif
dbUnlock()
close data

return NIL
