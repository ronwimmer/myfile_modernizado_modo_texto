*---------------------------------------------------------------------------
* FTECLAS ..... funcao LIGA acentuacao de teclado
*
function FTECLAS 

if getenv("TECLADO") == "MICROTEC"
    set key  39 to AcentoAgudo()                 && ' - acento agudo
    set key  94 to AcentoCircunflexo()           && ^ - acento circunflexo
    set key  34 to trema()                       && " - trema
else
    set key  91 to CedilhaMinusculo()            && [ - c com cedilha
    set key 123 to CedilhaMaiusculo()            && { - C com cedilha
    set key  93 to AcentoAgudo()                 && ] - acento agudo
    set key 125 to AcentoCircunflexo()           && } - acento circunflexo
    set key 124 to trema()                       && | - trema
end
set key  96 to AcentoGrave()                     && ` - acento grave
set key 126 to til()                             && ~ - til
set key  95 to hifen()                           && _ - h�fen

*---------------------------------------------------------------------------
function CedilhaMinusculo 

keyboard "�"

*---------------------------------------------------------------------------
function CedilhaMaiusculo 

keyboard "�"

*---------------------------------------------------------------------------
function AcentoAgudo 

private LETRA

LETRA = chr( abs( inkey(0) ) )
if LETRA == "a"
      keyboard "�"
 elseif  LETRA == "e"
      keyboard "�"
 elseif  LETRA == "i"
      keyboard "�"
 elseif  LETRA == "o"
      keyboard "�"
 elseif  LETRA == "u"
      keyboard "�"
 elseif  LETRA == "A"
      keyboard "�"
 elseif  LETRA == "E"
      keyboard "�"
 elseif  LETRA == "I"
      keyboard "�"
 elseif  LETRA == "O"
      keyboard "�"
 elseif  LETRA == "U"
      keyboard "�"
 else
      tone()
      keyboard LETRA
end

*---------------------------------------------------------------------------
function AcentoGrave 

private LETRA

LETRA = chr( abs( inkey(0) ) )
if      LETRA == "a"
    keyboard "�"
elseif  LETRA == "i"
    keyboard "�"
elseif  LETRA == "o"
    keyboard "�"
elseif  LETRA == "u"
    keyboard "�"
elseif LETRA == "A"
    keyboard "�"
elseif  LETRA == "I"
    keyboard "�"
elseif  LETRA == "O"
    keyboard "�"
elseif  LETRA == "U"
    keyboard "�"
else
    tone()
    keyboard LETRA
end

*---------------------------------------------------------------------------
function AcentoCircunflexo 

private LETRA

LETRA = chr( abs( inkey(0) ) )
if      LETRA == "a"
    keyboard "�"
elseif  LETRA == "e"
    keyboard "�"
elseif  LETRA == "o"
    keyboard "�"
elseif  LETRA == "A"
    keyboard "�"
elseif  LETRA == "E"
    keyboard "�"
elseif  LETRA == "O"
    keyboard "�"
else
    tone()
    keyboard LETRA
end

*---------------------------------------------------------------------------
function Til 

private LETRA

LETRA = chr( abs( inkey(0) ) )
if      LETRA == "a"
    keyboard "�"
elseif  LETRA == "n"
    keyboard "�"
elseif  LETRA == "o"
    keyboard "�"
elseif  LETRA == "A"
    keyboard "�"
elseif  LETRA == "N"
    keyboard "�"
elseif  LETRA == "O"
    keyboard "�"
else
    tone()
    keyboard LETRA
end

*---------------------------------------------------------------------------
function Trema 

private LETRA

LETRA = chr( abs( inkey(0) ) )
if      LETRA == "u"
    keyboard "�"
elseif  LETRA == "U"
    keyboard "�"
else
    tone()
    keyboard LETRA
end

*---------------------------------------------------------------------------
function Hifen 

private LETRA

LETRA = chr( abs( inkey(0) ) )
if      LETRA $ "aA"
    keyboard "�"
elseif  LETRA $ "oO"
    keyboard "�"
else
    tone()
    keyboard LETRA
end

*---------------------------------------------------------------------------
* FTECLA ..... funcao DESLIGA acentuacao de teclado
*
function FTECLA 

set key  34 to
set key  39 to
set key  91 to
set key  93 to
set key  94 to
set key  95 to
set key  96 to
set key 123 to
set key 124 to
set key 125 to
set key 126 to

*---------------------------------------------------------------------------

*****************
function MENSAGEM 
*****************

parameter TEXTO, TEMPO
private LARGURA, ALTURA, LINHA, COLUNA, TELA_ORIG, CURSOR_ORG, I, TECLA, TEXTO_TMP
largura = 0
if pcount() == 1
    TEMPO = 0
end
if type(TEXTO) == "C"
    TEXTO_TMP = TEXTO
    declare TEXTO[1]
    TEXTO[1]  = TEXTO_TMP
end

LARGURA    = len(TEXTO[1])
ALTURA     = len(TEXTO)
LINHA      = 12-ALTURA/2
COLUNA     = 40-LARGURA/2

TELA_ORIG  = savescreen(LINHA-3, COLUNA-8, LINHA+ALTURA+3, COLUNA+LARGURA+7)
CURSOR_ORG = setcursor("CURSOR_ORG") == "ON"
set cursor off
setcolor(M->W_MSG)
@ LINHA-3, COLUNA-6 clear to LINHA+ALTURA+2,COLUNA+LARGURA+5
@ LINHA-2, COLUNA-3 to LINHA+ALTURA+1,COLUNA+LARGURA+2 double
for I = 1 to ALTURA
    @ LINHA+I-1, COLUNA say TEXTO[I]
next
clear typeahead
TECLA=inkey(TEMPO)
restscreen(LINHA-3, COLUNA-8, LINHA+ALTURA+3, COLUNA+LARGURA+7, TELA_ORIG)
setcolor(M->W_NORMAL)
set cursor &CURSOR_ORG
return TECLA


***********
function SN
***********

parameters PERGUNTA, LINHA, ALERTA
private PARAMETROS, TAMANHO, COLUNA, TELA_ORIG, RESPOSTA
PARAMETROS = pcount()
if PARAMETROS < 2
    ALERTA  =   .F.
    LINHA   =    5
end
if PARAMETROS < 3
    ALERTA  =   .F.
end
TAMANHO   =    len(PERGUNTA)
COLUNA    =    40-TAMANHO/2
TELA_ORIG =    savescreen(LINHA, COLUNA-6, LINHA+9, COLUNA+TAMANHO+7)
setcolor( if( ALERTA, M->W_MSG, M->W_NORMAL) )
@ LINHA  , COLUNA-6 clear to LINHA+8,COLUNA+TAMANHO+5
@ LINHA+1, COLUNA-3 to LINHA+7,COLUNA+TAMANHO+2 double
@ LINHA+2, COLUNA say PERGUNTA
@ LINHA+3, COLUNA-3 say chr(186) + replicate(" ",TAMANHO+4) + chr(186)
setcolor( if( ALERTA, M->W_NORMAL,M->W_NORMAL) )
@ LINHA+5,33 prompt " nao "
@ LINHA+5,40 prompt " sim "
menu to RESPOSTA
restscreen(LINHA, COLUNA-6, LINHA+9, COLUNA+TAMANHO+7, TELA_ORIG)
setcolor(M->W_NORMAL)
return RESPOSTA == 1

*****************
function BeepErro 
*****************

tone(3500,2)
inkey(0.1)
tone(3500,2)

************
function MSG 
************

parameters MENSAGEM
if  pcount() == 0
*   MENSAGEM = "Browse => [F3] Profile content [INSERT] Transfers information [ESC] Exit"
    MENSAGEM = "Browse => [F3] Ficha Conte�do  [INSERT] Transfere Informa��o  [ESC] Sair"
*   MENSAGEM = "[F1] Help [ESC] Sair"
*   MENSAGEM = "Browse de Arquivo  [F3] Ficha Conteudo  [INSERT] Tranfere Informa��o  [ESC] Sair"
end
@ 24,00 say space(80) color M->W_NORMAL
@ 24,00 say pad(MENSAGEM,80) color M->W_LINHA0024

*****************
function ReadOnly 
*****************

parameter ARQUIVO
private R
R = "R"
*return R $ attrib(ARQUIVO)
return R


*******************
function AJUDA 
*******************

set key 28 to AJUDA()
declare TEXTO[09]

TEXTO[01] = "       Page_UP   --> Teclas de Sentido e    "
TEXTO[02] = "  * �  TAB       --> Deslocamento de Campos "
TEXTO[03] = "       Page_Down --> em Menus e Browse      "
TEXTO[04] = "���������������������������������������������"
TEXTO[05] = " [ENTER] --> Imput Dados / Ativa Op��o Menus "
TEXTO[06] = "���������������������������������������������"
TEXTO[07] = " [F3]    --> Edita Historico do Registro     "
TEXTO[08] = "���������������������������������������������"
TEXTO[09] = " [F10]   --> Informa��o sobre Autor/Criador  "
*TEXTO[10] = "���������������������������������������������"
*TEXTO[11] = " ************ Para Usar em Janelas BROWSE's  "
*TEXTO[12] = "                                             "
*TEXTO[13] = " [F4]    --> Edita coluna de data Confima��o "
*TEXTO[14] = " [F3]    --> Confirma Resgistro em Browse    "
*TEXTO[15] = " [INSERT]--> Transfere Informa��o em Browse  "
mensagem(TEXTO)
set key 28 to ajuda()

*****************
function F_MENSAGEM(TEXTO, TEMPO)
*****************

private LARGURA, ALTURA, LINHA, COLUNA, TELA_ORIG, CURSOR_ORG, TECLA, TEXTO_TMP

LARGURA    = len(TEXTO)
ALTURA     = 1

LINHA      = 12-ALTURA/2
COLUNA     = 40-LARGURA/2

TELA_ORIG  = savescreen(LINHA-3, COLUNA-8, LINHA+ALTURA+3, COLUNA+LARGURA+7)

set cursor off

setcolor(M->W_MSG)
@ LINHA-3, COLUNA-6 clear to LINHA+ALTURA+2,COLUNA+LARGURA+5
@ LINHA-2, COLUNA-3 to LINHA+ALTURA+1,COLUNA+LARGURA+2 double
@ LINHA+1-1, COLUNA say TEXTO
inkey(1000)

clear typeahead
restscreen(LINHA-3, COLUNA-8, LINHA+ALTURA+3, COLUNA+LARGURA+7, TELA_ORIG)

setcolor(M->W_NORMAL)

return




