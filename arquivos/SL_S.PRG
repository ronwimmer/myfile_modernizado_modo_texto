*------------------------------------------------------------------
* FMENSA ... acesso a variavies de mensagens do sistema
*
function FMENSA()

public MSG0,MSG1,MSG2,MSG3,MSG4,MSG5,MSG6,MSG7,MSG8,MSG9
public MSG10,MSG11,MSG12,MSG13,MSG14,MSG15,MSG16,MSG17,MSG18,MSG19
public MSG20,MSG21,MSG22,MSG23,MSG24,MSG25,MSG26,MSG27,MSG28,MSG29
public MSG30,MSG31,MSG_TITULO_I,MSG_LOGO_I

M->MSG0  := pad("Associado esta inativo ",80)
M->MSG1  := pad("REDE -> Arquivo nao esta disponivel no momento <- REDE",80)
M->MSG2  := pad("Registro nao encotrado !... ",80)
M->MSG3  := pad("( SIM NAO ) Apagar Registro ? ",80)
M->MSG4  := pad("Tarefa Completa ! ... tecle <ENTER>",80)
M->MSG5  := pad("Fim da Consulta ...",80)
M->MSG6  := pad("Aguarde Atualizando ...",80)
M->MSG7  := pad("Tecle <ENTER> para continuar ... ",80)
M->MSG8  := pad("Aguarde -> Indexando Arquivo ...",80)
M->MSG9  := pad("( SIM NAO SAIR ) Achou Registro ?",80)
M->MSG10 := pad("Use <- ou -> ate o codigo desejado mudar de cor ... tecle [ENTER]",80)
M->MSG11 := pad("( SIM NAO ) Deseja ver Compras Associadas ?",80)
M->MSG12 := pad("Aguarde -> Ordenando Arquivo ...",80)
M->MSG13 := pad("Impressao Completa ... ",80)
M->MSG14 := pad("Verifique a Impressora !!! .. tecle { I }",80)
M->MSG15 := pad("Impressora Nao esta OK para imprimir , Verifique ... tecle { I }",79)
M->MSG16 := pad("Aguarde Fim de Impressao...",80)
M->MSG17 := pad("Gerar Relatorio/Listagem na IMPRESSORA ou DISCO_RIGIDO ?",80)
M->MSG18 := pad("Nome do Arquivo Documento ?",80)
M->MSG19 := pad("Senha nao cadastrado ... Operacao Interrompida...",80)
M->MSG20 := pad("Acesso nao Autorizado !!",80)
M->MSG21 := pad("Produto nao Encontrado ou Cadastrado !!",80)
M->MSG22 := pad("( VENDAS COMPRAS VER_FOTO SAIR ) Desejo Ver!!",80)
M->MSG23 := "Venda ja tinha sido ESTONADA"
M->MSG24 := pad("ERRO -> Valor Parcelas nao e igual ao Valor Total da Venda",80)
M->MSG25 := pad("( NAO SIM ) Dados Lancados estao Corretos ?",80)
M->MSG26 := pad("( NAO SIM ) Deseja Visualizar Historico ?",80)
M->MSG27 := pad("Registro Nao encontrado !",80)
M->MSG28 := "Opcao do Sistema Nao Disponivel !"
M->MSG29 := "AREA RESTRITA ... Acesso nao autorizado !"
M->MSG30 := pad("( NAO SIM ) Aceita o CPF mesmo errado?",80)
M->MSG31 := pad("( NAO SIM ) Deseja Editar Historico ?",80)

M->MSG_TITULO_I := "MYFILE-Systema de Administracao de Contatos"
M->MSG_LOGO_I   := "LOGO_MYFILE.JPG"

return NIL

*==============================================================================
* FCOLOR ... acesso a variaveis de cores
*
function FCOLOR()

public W_NORMAL,W_JANELA_I,W_FUNDO,WFUNDOS
public W_LINHA0024,W_LINHA0123,W_BROWSE
public W_MENU,W_SOMBRA,W_MSG,W_MSG_OPC,W_JANELA_T

* ROSA

*WFUNDOS     := "                    "
*W_NORMAL    := "W+/BG,B+/W+,N,G+/N"
*W_LINHA0024 := "W+/BG,W+/B,N,B+/W+"
*W_LINHA0123 := "N/W,W+/N,N,G+/N"
*W_BROWSE    := "B+/N,W+/G,GR+/N,BG+/N"
*W_MENU      := "W+/BG,W+/GR,GR+/BG,W+/BG"
*W_SOMBRA    := "N+/N"
*W_MSG       := "N/W,R+/W,N,B+/W"
*W_MSG_OPC   := "GR+/R+,N+/W+,N,GR+/R+"
*W_JANELA_T  := "GR+/RB,W+/RB,N,B+/W+"
*W_JANELA_I  := "W+/RB,GR+/R+,N,W+/RB"
*W_FUNDO     := "W+/B+"

* VERDE

M->WFUNDOS     := "                    "
*W_NORMAL    := "GR+/W,B+/W+,N,G+/N"
M->W_NORMAL    := "W+/BG,B+/W+,N,G+/N"
M->W_LINHA0024 := "W+/BG,W+/B,N,B+/W+"
M->W_LINHA0123 := "N/W,W+/N,N,G+/N"
*W_BROWSE    := "GR+/N,W+/G,B+/N,BG+/N"
*W_BROWSE    := "B+/N,W+/G,GR+/N,BG+/N"
M->W_BROWSE    := "W+/N,N/W,GR+/N,BG+/N"
M->W_MENU      := "W+/BG,W+/GR,GR+/BG,W+/BG"
M->W_SOMBRA    := "N+/N"
M->W_MSG       := "N/W,R+/W,N,B+/W"
M->W_MSG_OPC   := "GR+/R+,N+/W+,N,GR+/R+"
M->W_JANELA_T  := "GR+/G,W/G,N,N/W"
M->W_JANELA_I  := "W+/G,W+/GR,N,N/G"
M->W_FUNDO     := "W+/B+"

return NIL
