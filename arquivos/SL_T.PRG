*---------------------------------------------------------------------------------
* Fexplode ... substitui a funcao explode() do joiner para o clipper
*
function Fexplode(x_Li,x_Ci,x_Lf,x_Cf,x_Borda,x_Cor)

setcolor(X_COR)

@ X_LI,X_CI clear to X_LF,X_CF

if x_Borda = "S" .or. x_borda = " "
   @ X_LI,X_CI to X_LF,X_CF
else
   @ X_LI,X_CI to X_LF,X_CF Double
endif

return NIL

*--------------------------------------------------------------------------
* FSL_T .... pano de fundo menu principal

function FSL_T()

local W_DIA_SEMANA

W_DIA_SEMANA := upper(cdow(DATE()))

@ 00,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 01,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 02,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 03,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 04,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 05,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 06,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 07,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 08,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 09,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 10,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 11,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 12,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 13,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 14,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 15,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 16,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 17,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 18,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 19,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 20,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 21,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS  color M->W_FUNDO
@ 22,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS               color M->W_FUNDO
@ 23,00 say substr(M->WFUNDOS,3,18)+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+substr(M->WFUNDOS,1,2)  color M->W_FUNDO
@ 24,00 say M->WFUNDOS+M->WFUNDOS+M->WFUNDOS+M->WFUNDOS                       color M->W_FUNDO

@ 00,00 say space(80)                color M->W_LINHA0024
@ 01,00 say space(80)                color M->W_LINHA0123
@ 23,00 say space(80)                color M->W_LINHA0123
@ 24,00 say space(80)                color M->W_LINHA0024

@ 00,01 say "Versao (pt) "+ M->WVER  color M->W_LINHA0024
@ 00,18 say curdir()                 color M->W_LINHA0024
@ 00,51 say W_DIA_SEMANA pict "@n"   color M->W_LINHA0024
@ 00,60 say DATE() pict "!!/!!/!!!!" color M->W_LINHA0024
setcolor(M->W_NORMAL)

return NIL
*------------------------------------------------[ SLOC-2 ]-----------------------
* FSL_T_MENU0.... caixa/moldura menu principal

function FSL_T_MENU0()

FSL_T()
setcolor(M->W_NORMAL)

@ 15,48 clear to 20,75
@ 15,48 to 20,75

@ 16,50 say chr(201)+chr(187)+chr(201)+chr(187)+" "+chr(203)+" "     +chr(203)+"   "+chr(203)+chr(205)+chr(187)+" "+chr(001)+" "+chr(203)+"  "             +" "+chr(203)+chr(205)+chr(187)
@ 17,50 say chr(186)+chr(186)+chr(186)+chr(186)+" "+chr(200)+chr(205)+chr(185)+"   "+chr(204)+chr(185)+" "     +" "+chr(203)+" "+chr(186)+"  "             +" "+chr(204)+chr(185)+" "
@ 18,50 say chr(202)+chr(200)+chr(188)+chr(202)+" "+" "+     chr(200)+chr(188)+"   "+chr(202)+"  "             +" "+chr(202)+" "+chr(200)+chr(205)+chr(188)+" "+chr(202)+chr(205)+chr(188)
@ 19,50 say "Administracao de Contato"

return NIL
*...........................................................................
* tela de geral de pesquisa e consultas
*
function FPC_T_GERAL()

setcolor(M->W_BROWSE)
Fexplode(05,00,22,79,"D")
setcolor(M->W_NORMAL)

return NIL
*---------------------------------------------------------------------------------
* FCD_T_DISTRIB ... tela de cadastro de DISTRIBUIDORES
*
function FCD_T_DISTRIB()

setcolor(M->W_JANELA_T)
Fexplode(02,27,22,79,"D")
@ 03,28 say " Chave ID:                     Cadastro:"
Fexplode(04,28,04,78,"S")
@ 05,28 say "     Nome:"
@ 06,28 say "Data Aniv:"
@ 07,28 say "  Empresa:"
@ 08,28 say "Documento:"
@ 09,28 say " Endereco:"
@ 10,28 say "   Bairro:"
@ 11,28 say "   Cidade:"
@ 12,28 say "      CEP:               UF:"
@ 13,28 say "   Fone_1:"
@ 14,28 say "   Fone_2:"
@ 15,28 say "EMail:"
@ 16,28 say " Site:"
@ 17,28 say "Skype:"
Fexplode(18,28,18,78,"S")
@ 19,28 say "  Obs:"
setcolor(M->W_NORMAL)

return NIL
*---------------------------------------------------------------------------------
* FCD_T_DETALHE ... tela de cadastro de DISTRIBUIDORES
*
function FCD_T_DETALHE()

setcolor(M->W_JANELA_T)
Fexplode(02,00,22,79,"D")
@ 03,01 say " Chave ID:                                                Cadastro:"
@ 04,01 say "     Nome:"
@ 05,01 say "  Empresa:"
@ 06,01 say "    Local:"
@ 07,01 say "Telefones:"
Fexplode(08,01,08,78,"S")
@ 21,01 say "                        [ESC] = Sair sem gravar    [CRTL+W] = Grava Historico"
setcolor(M->W_NORMAL)

return NIL
*---------------------------------------------------------------------------------
* FBW_T_DISTRIB ... tela de cadastro de DISTRIBUIDORES (BROWSE)
*
function FBW_T_DISTRIB()

setcolor(M->W_JANELA_T)
Fexplode(02,27,18,79,"D")
@ 03,28 say " Chave ID:                     Cadastro:"
Fexplode(04,28,04,78,"S")
@ 05,28 say "     Nome:"
@ 06,28 say "Data Aniv:"
@ 07,28 say "  Empresa:"
@ 08,28 say "Documento:"
@ 09,28 say " Endereco:"
@ 10,28 say "   Bairro:"
@ 11,28 say "   Cidade:"
@ 12,28 say "      CEP:               UF:"
@ 13,28 say "   Fone_1:"
@ 14,28 say "   Fone_2:"
@ 15,28 say "EMail:"
@ 16,28 say " Site:"
@ 17,28 say "Skype:"
setcolor(M->W_NORMAL)

return NIL
