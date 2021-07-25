***********************
function BrowseAuxiliar()
***********************

parameters MODO, COLUNA
local TELA_BW0
private TECLA, TELA

M->TECLA := lastkey()   && Obtem o codigo da ultima tecla pressionada
if M->MODO == 0         && Posicionamento do cursor
    return 1
elseif M->MODO == 1     && Nao ham ais registros acima
    keyboard 30         && Ctrl-PgDn
    return 1            && Continua normalmente
elseif M->MODO == 2        && Nao ha mais registros abaixo
    keyboard 31         && Ctrl-PgUp
    return 1            && Continua normalmente
elseif M->MODO == 3     && O arquivo est  vazio
    if sn("O arquivo esta vazio !!! ...tecle qualquer TECLA") .and. !M->READ_ONLY
        return 0        && Continua normalmente
    else
        return 0        && Encerra o BROWSE
    end
elseif M->MODO == 4
    if M->TECLA == 27      && Escape
        if M->EDITANDO
            return 1
        else
            SetKey( 28, { || AJUDA() })
            M->TECLA := if( sn("Voce realmente quer sair ?",7,.T.), 0, 1)
            return M->TECLA
        end
    elseif M->TECLA== -2   && tecla [F3]
           do case
              case M->CAMPOS_M[1] = "IDCHAVE"
                   TELA_BW0 := SaveScreen()
                   FCR1100()
                   RestScreen( 0,0,MaxRow(),MaxCol(), TELA_BW0 )
                   return 10
              case M->CAMPOS_M[1] = "RAZAO"
                   TELA_BW0 := SaveScreen()
                   FCR1100()
                   RestScreen( 0,0,MaxRow(),MaxCol(), TELA_BW0 )
                   return 10
            endcase
    elseif M->TECLA== 22  && tecla [INSERT]
    else
        return 1
    end
end

return NIL
*---------------------------------------------------------------------------
**************************
function F_AuxCLIENTES()
**************************

parameters MODO, COLUNA
local TELA_BW1
private TECLA, TELA

M->TECLA := lastkey()   && Obtem o codigo da ultima tecla pressionada
FPC2100()
if M->MODO == 0         && Posicionamento do cursor
    return 1
elseif M->MODO == 1     && Nao ham ais registros acima
    keyboard 30         && Ctrl-PgDn
    return 1            && Continua normalmente
elseif M->MODO == 2     && Nao ha mais registros abaixo
    keyboard 31         && Ctrl-PgUp
    return 1            && Continua normalmente
elseif M->MODO == 3     && O arquivo est  vazio
    if sn("O arquivo esta vazio !!! ...tecle qualquer TECLA") .and. !M->READ_ONLY
        return 0        && Continua normalmente
    else
        return 0        && Encerra o BROWSE
    end
elseif M->MODO == 4
    if M->TECLA == 27   && Escape
        if M->EDITANDO
            return 1
        else
            SetKey( 28, { || AJUDA() })
            M->TECLA := if( sn("Voce realmente quer sair ?",7,.T.), 0, 1)
            return M->TECLA
        end
    elseif M->TECLA== -2   && tecla [F3]
           TELA_BW1 := SaveScreen()
           FCR2000()
           RestScreen( 0,0,MaxRow(),MaxCol(), TELA_BW1 )
        return 10
    else
        return 1
    end
end

return NIL