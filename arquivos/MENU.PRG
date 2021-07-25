*------------------------------------------------------------------
* MEUMENU .... Sistema
* autor ...... Roberto Cezar
* data ....... 22.12.2000
*
function FMEUMENU()

static OPC := 0

do while .t.
   FSL_T_MENU0()
   OPC := 0
   @ 23,01 prompt chr(1) + " INICIAR"
   menu to OPC
   do case
      case OPC = 1
         if ! FSUB_MENU()
            exit
         endif
   endcase
enddo
setcolor(M->W_NORMAL)
close data

return NIL

*==============================================================================
* FSUB_MENU - sub-sistema marketing de rede ( segunta tela )
*
function FSUB_MENU()

static OPC := 0
local OPCAO

while .t.
   setcolor(M->W_NORMAL)
   @ 24,00 say space(80) color M->W_LINHA0024
   OPC := 0
   *               0123456789012
   @ 14,00 prompt chr(179) + "Arquivo   " + chr(16) message "Manutencao de Registro de Contatos"                    // 1
   @ 15,00 prompt chr(179) + "Historico " + chr(16) message "CRM e Registro do Historico e informacoes do Contato"  // 2
   @ 16,00 prompt chr(179) + "Consulta  " + chr(16) message "Busca de Registro filtrado por varios campos"          // 3
   @ 17,00 prompt chr(179) + "Browse    " + chr(16) message "Lista Contato ordenado por ID ou Nome"                 // 4
   @ 18,00 prompt chr(179) + "Impressao " + chr(16) message "Imprime Listagem em formato HTLM e TXT"                // 5
   @ 19,00 prompt chr(179) + "Ordenar   " + chr(16) message "Ordena o arquivo de dados"                             // 6
   @ 20,00 say    chr(192) + replicate( chr(196), 9 ) + chr(191) + " "          color M->W_MENU
   @ 21,00 prompt "  Exit    " + chr(179) + " " message "Sair do Sistema"                                    // 7
   @ 22,00 say    chr(192) + replicate( chr(196), 9 ) + chr(217) + " "          color M->W_MENU

   menu to OPCAO
   do case
      case OPCAO = 0
           exit
      case OPCAO = 1
           FCD1000()       && manutencao de cadastros
      case OPCAO = 2
           FCR1000()       && historicos de cadastros
      case OPCAO = 3
           FPC1000()       && consultas de cadastros
      case OPCAO = 4
           FPC2000()       && browse de cadastros
      case OPCAO = 5
           FHT_NETW()      && impressao de HTML e TXT
      case OPCAO = 6
           FAP_NETW()      && indecaxao, ordenacao, configuracao
      case OPCAO = 7
           return .F.
   endcase
enddo
setcolor(M->W_NORMAL)
close data

return .T.
