*------------------------------------------------------------------
* SISTEMA .... Sistema Gerenciamento Cadastro de Empresa
* autor ...... Roberto Cezar
* data ....... 26.04.2004
* cliente .... webParceiro
* arqcomuns .. netassoc.dbf,netuf.dbf
*
#include "SET.CH"

function Main()

local GetList := {}

// Configurações gerais               // no formato de comando (em desuso)

set( _SET_CONFIRM, .T. )              // set confirm ON
set( _SET_CURSOR, 0 )                 // set cursor OFF == setcursor(0)
set( _SET_DATEFORMAT, "dd/mm/yy" )    // set date british
set( _SET_DELETED, .T. )              // set deleted ON
set( _SET_EXCLUSIVE, .F. )            // set exclusive OFF
set( _SET_INTENSITY, .T. )            // set intensity ON
set( _SET_MESSAGE, 24 )               // set message to 24 center
set( _SET_MCENTER, .T. )
set( _SET_SOFTSEEK, .F. )             // set softseek OFF
set( _SET_WRAP, .T. )                 // set wrap ON
set( _SET_EPOCH, 1980 )               // set epoch to 1980
setmode( 25, 80 )
setkey( 28, { || ajuda() } )          // set key 28 to ajuda() && tecla [F1]

set century ON

*------ definir idioma portugues
REQUEST HB_LANG_PT
HB_LangSelect("PT")

// declaração de variáveis públicas
FCOLOR()                              // SL_S.PRG ... definição de cores
F_VAR_AMBIENTE()                      // SL_V.PRG ... variáveis relativas ao ambiente
FMENSA()                              // SL_S.PRG ... mensagens

FMEUMENU()                            // MENU.PRG ... menu principal

clear screen

@ 01,00 say pad('Fim do Programa-> MyFILE.EXE { (C)2000-2014 http://romarc.webs.com }',80) color "w+/b+"
@ 05,00

return NIL
