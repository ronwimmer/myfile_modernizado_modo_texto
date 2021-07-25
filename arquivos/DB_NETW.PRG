*----------------------------------------------------------------------------------
* DB_NETW .... sistema de cadastros-- dbedit
* autor ...... Roberto Cezar
* data ....... 30.11.2001
*----------------------------------------------------------------------------
*
//static CAMPOS_M, MASCAR_M, NO_ALT_M, CABECA_M, EDITANDO

function FDB_CLIENTES()

local MARCOU
local CAMPO
local TELA_BROWSE
local READ_ONLY
local NO_CAMPOS

set( _SET_WRAP, .T. )                 // set wrap ON
set( _SET_DELETED, .F. )              // set deleted off
set( _SET_CURSOR, 1 )                 // set cursor ON == setcursor(1) full
msg("Browse => [F3] Visualiza Historico [ESC] Sair")
MARCOU := .F.   && Controlar  o PACK
CAMPO := 1

if NETASSOC->( reccount() ) = 0
   @ 01,00
   return NIL
endif

TELA_BROWSE := SaveScreen()

M->CAMPOS_M := { "NOME" }
M->MASCAR_M := { "@N" }
M->NO_ALT_M := { .F. }
M->CABECA_M := { "Nome" }

setcolor(M->W_NORMAL)
@ 01,00 say space(80)

M->EDITANDO = .F.              && Flag de controle de edicao de linha e coluna
READ_ONLY := ReadOnly("NETASSOC.DBF")
NO_CAMPOS := NETASSOC->( fcount() )

Fexplode(02,00,22,26,"S",M->W_BROWSE)

setcolor(M->W_BROWSE)

DBEDIT(03,01,21,25,M->CAMPOS_M,"F_AuxCLIENTES",M->MASCAR_M,M->CABECA_M)

    SetKey( 28, { || AJUDA() })
    SetKey( -1, { || .T. })
    if MARCOU
        if sn("Voce marcou registros para eliminacao, quer elimina-los ?",7,.T.)
            if neterr()
                msg("O arquivo esta sendo usado por outro usuario.")
            else
                msg("Aguarde, eliminando os registros ...")
                pack
                msg("Registros Eliminados !")
            end
        end
    end

RestScreen( 0,0,MaxRow(),MaxCol(), TELA_BROWSE)
setcolor(M->W_NORMAL)
@ 24,00

return NIL
*----------------------------------------------------------------------------
* DB_DETALHE   browse -- lista de historicos
*
function FDB_DETALHE()

local MARCOU
local CAMPO
local TELA_BROWSE
local READ_ONLY
local NO_CAMPOS

set( _SET_WRAP, .T. )                 // set wrap ON
set( _SET_DELETED, .F. )              // set deleted off
set( _SET_CURSOR, 1 )                 // set cursor ON == setcursor(1) full
msg("Browse => [F3] Visualiza e Edita Historico [ESC] Sair")
MARCOU := .F.   && Controlar  o PACK
CAMPO  := 1

if NETASSOC->( reccount() ) = 0
   @ 01,00
   return NIL
endif
TELA_BROWSE := SaveScreen()

M->CAMPOS_M := { "IDCHAVE",;
              "NOME",;
              "RAZAO",;
              "END_RUA",;
              "END_BAIRRO",;
              "END_CIDADE",;
              "END_CEP",;
              "END_UF",;
              "FONE_RES",;
              "FONE_CEL",;
              "END_EMAIL",;
              "WEB_SITE",;
              "NUM_ICQ",;
              "CADASTRO",;
              "DOCUMENTO";
            }

M->MASCAR_M := { "!!!!!!!",;
              "@N",;
              "@N",;
              "@N",;
              "@N",;
              "@N",;
              "!!!!!!!!!",;
              "@n",;
              "@N",;
              "@N",;
              "@N",;
              "@N",;
              "@N",;
              "!!/!!/!!!!",;
              "@!";
            }

M->NO_ALT_M := { .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.,;
              .F.;
            }

M->CABECA_M := { "ChaveID",;
              "Contato",;
              "Empresa",;
              "Endereco",;
              "Bairro",;
              "Cidade",;
              "CEP",;
              "UF",;
              "Telefone1",;
              "Telefone2",;
              "email",;
              "site",;
              "skype",;
              "Criado",;
              "Documento";
            }

setcolor(M->W_NORMAL)
@ 01,00 say space(80)

M->EDITANDO = .F.              && Flag de controle de edicao de linha e coluna
READ_ONLY := ReadOnly("NETASSOC.DBF")
NO_CAMPOS := NETASSOC->( fcount() )

Fexplode(02,00,22,79,"S",M->W_BROWSE)

setcolor(M->W_BROWSE)

DBEDIT(03,01,21,78,M->CAMPOS_M,"BrowseAuxiliar",M->MASCAR_M,M->CABECA_M)

    SetKey( 28, { || AJUDA() })
    SetKey( -1, { || .T. })
    if MARCOU
        if sn("Voce marcou registros para eliminacao, quer elimina-los ?",7,.T.)
            if neterr()
                msg("O arquivo esta sendo usado por outro usuario.")
            else
                msg("Aguarde, eliminando os registros ...")
                pack
                msg("Registros Eliminados !")
            end
        end
    end

RestScreen( 0,0,MaxRow(),MaxCol(), TELA_BROWSE)
setcolor(M->W_NORMAL)
@ 24,00

return NIL
