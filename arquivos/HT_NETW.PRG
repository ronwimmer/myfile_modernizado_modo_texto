*****************************************************************************
* FHT_NETW .... sistema de impressao
*
static TNOM

function FHT_NETW()

local OPC
local TELA0

@ 24,00 say space(80) color M->W_LINHA0024

while .T.
   OPC := 0
   TELA0 := SaveScreen()
*    0.........1.........2.........3........
*    0123456789012345678901234567890123456789
   @ 14,12 say    chr(179) + "-- Impressao TXT ------"                                                                     color M->W_MENU
   @ 15,12 prompt chr(179) + "a.TXT Lista Total     " + chr(16) message "Imprime Lista TOTAL de Empresa no Formato TXT e HTML"      // 1
   @ 16,12 prompt chr(179) + "b.TXT Lista Registro  " + chr(16) message "Imprime Lista INDIVIDUAL de Empresa no Formato TXT e HTML" // 2
   @ 17,12 prompt chr(179) + "c.TXT Aniversariantes " + chr(16) message "Imprime Lista TOTAL de Aniversariantes em TXT e HTML"      // 3
   @ 18,12 say    chr(179) + "-- Visualizar ---------"                                                                     color M->W_MENU
   @ 19,12 prompt chr(179) + "d.Listagem em TXT     " + chr(16) message "Visualiza Listagem TXT  usando Bloco de Notas"             // 4
   @ 20,12 prompt chr(179) + "e.Listagem em HTML    " + chr(16) message "Visualiza Listagem HTML usando o Navegador Web"            // 5
   @ 21,12 prompt chr(179) + "f.Voltar               " message "Volta ao menu anterior"                                    // 6

   menu to OPC

   do case
      case OPC = 1
           FIP1000()       && impressao total TXT
      case OPC = 2
           FIP2000()       && impressao individual TXT
      case OPC = 3
           FIP3000()       && impressao total TXT
      case OPC = 4
           FI_FILES_TXT()
      case OPC = 5
           FI_FILES_HTM()
      case OPC = 6 .or. OPC = 0
           RestScreen( 0,0,MaxRow(),MaxCol(), TELA0 )
           exit
   endcase
   RestScreen( 0,0,MaxRow(),MaxCol(), TELA0 )
   @ 24,00 say space(79) color M->W_LINHA0024
enddo
RestScreen( 0,0,MaxRow(),MaxCol(), TELA0 )
setcolor(M->W_NORMAL)

return NIL
*---------------------------------------------------[ ** L.CLIENTE ]--------
* IP1000  ...... menu de listagem de associado ordem alfabetica
*
function FIP1000()

FARQUIVOS("NETASSOC","NK_ASS",M->WARQ_F,"1")
NETASSOC->( dbGoTop() )

FIP1100()  && impressao HTML

FIP1200()  && impressao TXT

setcolor(M->W_NORMAL)
close database

return NIL
*---------------------------------------------------[ ** L.CLIENTE ]--------
* IP1100  ...... impressao total em HTML
*
function FIP1100()

FIMPRS("IP1000","HTM")

FCABEC()

M->ct := 11
NETASSOC->( dbGoTop() )

while .t.
   if NETASSOC->( eof() )
      exit
   endif

   ? [<table width='90%' border='0' cellspacing='0'><tr><td>KeyID:</td><td><b><font color='#0000FF'>]
   ? NETASSOC->IDCHAVE
   ? [</font></b></td></tr><tr><td>Nome:</td><td><b><font color='#0000FF'>]
   ? alltrim(NETASSOC->NOME)
   ? [</font></b></td></tr><tr><td>Documento:</td><td><b><font color='#0000FF'>]
   ? alltrim(NETASSOC->DOCUMENTO)
   ? [</font></b></td></tr><tr><td>Aniversario:</td><td><font color='#0000FF'><b>]
   ? NETASSOC->DT_NASC
   ? [</b></font></td></tr><tr><td width='15%'>Empresa:</td><td width='85%'><b><font color='#0000FF'>]
   ? alltrim(NETASSOC->RAZAO)
   ? [</font></b></td></tr><tr></tr><tr><td width='15%'>Endereco:</td><td width='85%'><b><font color='#0000FF'>]
   ? alltrim(NETASSOC->END_RUA)
   ? [</font></b></td></td></tr><tr><td width='15%'>&nbsp;</td><td width='85%'><b><font color='#0000FF'>]
   ? alltrim(NETASSOC->END_BAIRRO)
   ? [</font></b></td></tr><tr><td width='15%'>&nbsp;</td><td width='85%'><b><font color='#0000FF'>]
   ? alltrim(NETASSOC->END_CIDADE)
   ? [&nbsp;/&nbsp;]
   ? alltrim(NETASSOC->END_UF)
   ? [</font></b></td></tr><tr><td width='15%'>&nbsp;</td><td width='85%'><b><font color='#0000FF'>]
   ? NETASSOC->END_CEP
   ? [</font></b></td></tr><tr><td width='15%'>Fone_1:</td><td width='85%'><b><font color='#0000FF'>]
   ? alltrim(NETASSOC->FONE_RES)
   ? [</font></b></td></tr><tr><td width='15%'>Fone_2:</td><td width='85%'><b><font color='#0000FF'>]
   ? alltrim(NETASSOC->FONE_CEL)
   ? [</font></b></td></tr><tr><td width='15%'>E-mail:</td><td width='85%'><b><font color='#0000FF'><a href='mailto:]
   ? alltrim(NETASSOC->END_EMAIL)
   ? ['>]
   ? alltrim(NETASSOC->END_EMAIL)
   ? [</a></font></b></td></tr><tr><td width='15%'>Site:</td><td width='85%'><b><font color='#0000FF'><a href='http://]
   ? alltrim(NETASSOC->WEB_SITE)
   ? ['>]
   ? alltrim(NETASSOC->WEB_SITE)
   ? [</a></font></b></td></tr><tr><td width='15%'>Skype:</td><td width='85%'><b><font color='#0000FF'>]
   ? alltrim(NETASSOC->NUM_ICQ)
   ? [</font></b></td></tr></table><BR>]
   ? [<hr width='90%' align="left">]

   NETASSOC->( dbSkip() )
enddo
FRODAPE()
FDEIMP()

return NIL
*---------------------------------------------------------------------------
* IP1200  ...... impressao total em TXT
*
function FIP1200()

NETASSOC->( dbGoTop() )

M->ct := 1
FIMPRS("IP1000","TXT")

FCABEC_PRINT()

@ 02,00 say "===> Listagem por Ordem Alfabetica"
M->LL := 3
M->CT := 1
NETASSOC->( dbGoTop() )

while .t.
   if NETASSOC->( eof() )
      exit
   endif

   if M->CT > 6
      //eject
      FCABEC_PRINT()
      @ 02,00 say "===> Listagem por Ordem Alfabetica"
      M->LL := 3
      M->CT := 1
   endif

   M->LL += 1
   @ M->LL,000 say replicate("=",78)
   M->LL += 1
   @ M->LL,000 say " Chave ID: "+ NETASSOC->IDCHAVE + " Documento: "+ alltrim(NETASSOC->DOCUMENTO)
   M->LL += 1
   @ M->LL,000 say "Data Aniv: "+ NETASSOC->DT_NASC
   M->LL += 1
   @ M->LL,000 say "  Contato: "+ alltrim(NETASSOC->NOME)
   M->LL += 1
   @ M->LL,000 say "  Empresa: "+ alltrim(NETASSOC->RAZAO)
   M->LL += 1
   @ M->LL,000 say " Endereco: "+ alltrim(NETASSOC->END_RUA)
   M->LL += 1
   @ M->LL,011 say alltrim(NETASSOC->END_BAIRRO) +" "+  alltrim(NETASSOC->END_CIDADE)
   M->LL += 1
   @ M->LL,011 say alltrim(NETASSOC->END_UF) +" "+NETASSOC->END_CEP
   M->LL += 1
   @ M->LL,000 say "  Fone_1: " + alltrim(NETASSOC->FONE_RES)
   M->LL += 1
   @ M->LL,000 say "  Fone_2: " + alltrim(NETASSOC->FONE_CEL)
   M->LL += 1
   @ M->LL,000 say "   e-mail: " + alltrim(NETASSOC->END_EMAIL)
   M->LL += 1
   @ M->LL,000 say "    Skype: " + alltrim(NETASSOC->NUM_ICQ)
   M->LL += 1
   @ M->LL,000 say "     Site: " + alltrim(NETASSOC->WEB_SITE)
   M->CT += 1

   NETASSOC->( dbSkip() )
enddo
FDEIMP()

return NIL
*---------------------------------------------------------------------------
* IP2000  ...... menu de listagem de associado
*
function FIP2000()

local TCOD, WDETALHE, OPC
local GetList := {}

FARQUIVOS("NETASSOC","MK_ASS",M->WARQ_F,"1")
NETASSOC->( dbGoTop() )

setcolor(M->W_JANELA_T)
Fexplode(02,27,08,79,"D")
@ 03,28 say " Chave ID:                     Cadastro:"
Fexplode(04,28,04,78,"S")
@ 05,28 say "     Nome:"
Fexplode(06,28,06,78,"S")
@ 07,28 say "Deseja Imprimir este Registro ? [NAO] [SIM]"
setcolor(M->W_NORMAL)

F_VAR_DISTRIB()           && start variaveis de clientes
TCOD := 0

clear gets
@ 03,39 get TCOD  pict "9,999,999"   color M->W_JANELA_I
read
set( _SET_CONFIRM, .F. )              // set confirm OFF

if NETASSOC->( dbSeek( str(TCOD,7,0) ))
   tone()
   M->WIDCHAVE     :=  val(NETASSOC->IDCHAVE)
   M->WDT_NASC     :=  NETASSOC->DT_NASC
   M->WRAZAO       :=  alltrim(NETASSOC->RAZAO)
   M->WNOME        :=  alltrim(NETASSOC->NOME)

   M->WDOCUMENTO   :=  alltrim(NETASSOC->DOCUMENTO)

   M->WEND_RUA     :=  alltrim(NETASSOC->END_RUA)
   M->WEND_BAIRRO  :=  alltrim(NETASSOC->END_BAIRRO)
   M->WEND_CIDADE  :=  alltrim(NETASSOC->END_CIDADE)
   M->WEND_CEP     :=  alltrim(NETASSOC->END_CEP)
   M->WEND_UF      :=  alltrim(NETASSOC->END_UF)

   M->WFONE_RES    :=  alltrim(NETASSOC->FONE_RES)
   M->WFONE_CEL    :=  alltrim(NETASSOC->FONE_CEL)

   M->WEND_EMAIL   :=  alltrim(NETASSOC->END_EMAIL)
   M->WWEB_SITE    :=  alltrim(NETASSOC->WEB_SITE)
   M->WNUM_ICQ     :=  alltrim(NETASSOC->NUM_ICQ)
   M->WDETALHE     :=  NETASSOC->DETALHE

   @ 03,39 say M->WIDCHAVE   pict "9,999,999"         color M->W_JANELA_I
   @ 03,69 say M->WCADASTRO  pict "@d"                color M->W_JANELA_I
   @ 05,39 say M->WNOME      pict "@n"                color M->W_JANELA_I
endif

OPC := 0
@ 07,60 prompt "[NAO]" //color W_JANELA_I
@ 07,66 prompt "[SIM]" //color W_JANELA_I
menu to OPC

if OPC = 1 .or. OPC = 0
   setcolor(M->W_NORMAL)
   close database
   return .t.
endif

FIP2100()  && impressao HTML

FIP2200()  && impressao TXT

setcolor(M->W_NORMAL)
close database

return NIL
*---------------------------------------------------------------------------
* IP2100  ...... impressao total em HTML
*
function FIP2100()

FIMPRS("IP2000","HTM")

FCABEC()

NETASSOC->( dbGoTop() )
while .t.
   ? [<table width='90%' border='0' cellspacing='0'><tr><td>KeyID:</td><td><b><font color='#0000FF'>]
   ? M->WIDCHAVE
   ? [</font></b></td></tr><tr><td>Contato:</td><td><b><font color='#0000FF'>]
   ? M->WNOME
   ? [</font></b></td></tr><tr><td>Documento:</td><td><b><font color='#0000FF'>]
   ? M->WDOCUMENTO
   ? [</font></b></td></tr><tr><td>Aniversario:</td><td><font color='#0000FF'><b>]
   ? M->WDT_NASC
   ? [</b></font></td></tr><tr><td width='15%'>Empresa:</td><td width='85%'><b><font color='#0000FF'>]
   ? M->WRAZAO
   ? [</font></b></td></tr><tr></tr><tr><td width='15%'>Endereco:</td><td width='85%'><b><font color='#0000FF'>]
   ? M->WEND_RUA
   ? [</font></b></td></td></tr><tr><td width='15%'>&nbsp;</td><td width='85%'><b><font color='#0000FF'>]
   ? M->WEND_BAIRRO
   ? [</font></b></td></tr><tr><td width='15%'>&nbsp;</td><td width='85%'><b><font color='#0000FF'>]
   ? M->WEND_CIDADE
   ? [&nbsp;/&nbsp;]
   ? M->WEND_UF
   ? [</font></b></td></tr><tr><td width='15%'>&nbsp;</td><td width='85%'><b><font color='#0000FF'>]
   ? M->WEND_CEP
   ? [</font></b></td></tr><tr><td width='15%'>Fone_1:</td><td width='85%'><b><font color='#0000FF'>]
   ? M->WFONE_RES
   ? [</font></b></td></tr><tr><td width='15%'>Fone_2:</td><td width='85%'><b><font color='#0000FF'>]
   ? M->WFONE_CEL
   ? [</font></b></td></tr><tr><td width='15%'>E-mail:</td><td width='85%'><b><font color='#0000FF'><a href='mailto:]
   ? M->WEND_EMAIL
   ? ['>]
   ? M->WEND_EMAIL
   ? [</a></font></b></td></tr><tr><td width='15%'>Site:</td><td width='85%'><b><font color='#0000FF'><a href='http://]
   ? M->WWEB_SITE
   ? ['>]
   ? M->WWEB_SITE
   ? [</a></font></b></td></tr><tr><td width='15%'>Skype:</td><td width='85%'><b><font color='#0000FF'>]
   ? M->WNUM_ICQ
   ? [</font></b></td></tr></table>]
   ? [<br>]
   ? [<hr width='90%' align="left">]
   ? [<br>]
   ? [<table width="50%" border="0" cellspacing="0">]
   ? [<tr>]
   ? [<td align="center" valign="top">]
   ? [<font face="Arial, Helvetica, sans-serif" size="2">]
   ? [Historico do Contato]
   ? [</font>]
   ? [</td>]
   ? [</tr>]
   ? [<tr>]
   ? [<td valign="top">]
   ? [<div align="justify">]
   ? [<b>]
   ? [<font color="#0000FF" size="2" face="Arial, Helvetica, sans-serif">]
   ? M->WDETALHE 
   ? [</b>]
   ? [</div>]
   ? [</font>]
   ? [</td>]
   ? [</tr>]
   ? [</table>]

   exit
enddo
FRODAPE()
FDEIMP()

return NIL
*---------------------------------------------------------------------------
* IP2200  ...... impressao total em TXT
*
function FIP2200()

FIMPRS("IP2000","TXT")

FCABEC_PRINT()

M->LL := 4
@ M->LL,000 say replicate("=",78)
M->LL += 1
@ M->LL,000 say "   Chave ID: "+ NETASSOC->IDCHAVE
M->LL += 1
@ M->LL,000 say "    Contato: "+ M->WNOME
M->LL += 1
@ M->LL,000 say "Aniversario: "+ NETASSOC->DT_NASC
M->LL += 1
@ M->LL,000 say "  Documento: "+ M->WDOCUMENTO
M->LL += 1
@ M->LL,000 say "    Empresa: "+ M->WRAZAO
M->LL += 1
@ M->LL,000 say "   Endereco: "+ M->WEND_RUA
M->LL += 1
@ M->LL,000 say "     Bairro: "+ M->WEND_BAIRRO
M->LL += 1
@ M->LL,000 say "     Cidade: "+ M->WEND_CIDADE
M->LL += 1
@ M->LL,000 say "         UF: "+ M->WEND_UF +" CEP: "+M->WEND_CEP
M->LL += 1
@ M->LL,000 say " Telefone_1: "+ M->WFONE_RES
M->LL += 1
@ M->LL,000 say " Telefone_2: "+ M->WFONE_CEL
M->LL += 1
@ M->LL,000 say "     e-mail: "+ M->WEND_EMAIL
M->LL += 1
@ M->LL,000 say "      Skype: "+ M->WNUM_ICQ
M->LL += 1
@ M->LL,000 say "       Site: "+ M->WWEB_SITE
M->LL += 2
@ M->LL,000 say "------------[ historico do Contato ]---------------------------"
M->LL += 2
@ M->LL,000 say M->WDETALHE

FDEIMP()

return NIL
*---------------------------------------------------[ ** L.CLIENTE ]--------
* IP3000  ...... menu de listagem de associado ordem alfabetica
*
function FIP3000()

local TELA03

FARQUIVOS("NETASSOC","NK_ASS",M->WARQ_F,"1")
NETASSOC->( dbGoTop() )

@ 24,00 say space(80) color M->W_LINHA0024
TELA03 := SaveScreen()
NETASSOC->( dbGoTop() )
TNOM := 00

@ 11,37 prompt chr(179) + " 1 Janeiro  " 
@ 12,37 prompt chr(179) + " 2 Fevereiro" 
@ 13,37 prompt chr(179) + " 3 Marco    " 
@ 14,37 prompt chr(179) + " 4 Abril    " 
@ 15,37 prompt chr(179) + " 5 Maio     " 
@ 16,37 prompt chr(179) + " 6 Junho    " 
@ 17,37 prompt chr(179) + " 7 Julho    " 
@ 18,37 prompt chr(179) + " 8 Augosto  " 
@ 19,37 prompt chr(179) + " 9 Setembro " 
@ 20,37 prompt chr(179) + "10 Outubro  " 
@ 21,37 prompt chr(179) + "11 Novembro " 
@ 22,37 prompt chr(179) + "12 Dezembro " 
menu to TNOM

if TNOM < 1 .or. TNOM > 12
   RestScreen( 0,0,MaxRow(),MaxCol(), TELA03 )
   @ 24,00 say space(79) color M->W_LINHA0024
   setcolor(M->W_NORMAL)
   close database
   return NIL
endif

RestScreen( 0,0,MaxRow(),MaxCol(), TELA03 )
@ 24,00 say space(79) color M->W_LINHA0024
setcolor(M->W_NORMAL)

* FIP3100()  && impressao HTML

FIP3200()  && impressao TXT

setcolor(M->W_NORMAL)
close database

return NIL
*---------------------------------------------------[ ** L.CLIENTE ]--------
* IP3100  ...... impressao total em HTML
*
function FIP3100()

FIMPRS("IP3000","HTM")

FCABEC()

M->ct := 11
NETASSOC->( dbGoTop() )
while .t.
   if NETASSOC->( eof() )
      exit
   endif

   if TNOM = month(ctod(NETASSOC->DT_NASC))

      ? [<table width="90%" border="1" cellspacing="0">]
      ? [<tr valign="top" align="left">]
      ? [<td width="33%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [ChaveID:]
      ? [<b>]
      ? [<font color="#0000FF">]
      ? NETASSOC->IDCHAVE
      ? [</font>]
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [<td width="39%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [Documento:]
      ? [<b>]
      ? [<font color="#0000FF">]
      ? alltrim(NETASSOC->DOCUMENTO)
      ? [</font>]
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [<td width="28%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [Aniversario:]
      ? [<font color="#0000FF">]
      ? [<b>]
      ? NETASSOC->DT_NASC
      ? [</b>]
      ? [</font>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [<tr valign="top" align="left">]
      ? [<td colspan="3">]
      ? [<table width="90%" border="0" cellspacing="0">]
      ? [<tr>]
      ? [<td width="19%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [Empresa:]
      ? [</font>]
      ? [</td>]
      ? [<td width="81%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [<b>]
      ? [<font color="#0000FF">]
      ? alltrim(NETASSOC->RAZAO)
      ? [</font>]
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [<tr>]
      ? [<td>]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [Nome:]
      ? [</font>]
      ? [</td>]
      ? [<td>]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [<b>]
      ? [<font color="#0000FF">]
      ? alltrim(NETASSOC->NOME)
      ? [</font>]
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [</table>]
      ? [<BR>]
      ? [<table width="90%" border="0" cellspacing="0">]
      ? [<tr>]
      ? [<td width="19%"><font face="Arial, Helvetica, sans-serif" size="2">]
      ? [Endereco:]
      ? [</font>]
      ? [</td>]
      ? [<td width="81%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2" color="#0000FF">]
      ? [<b>]
      ? alltrim(NETASSOC->END_RUA)
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [<tr>]
      ? [<td width="19%">]
      ? [&nbsp;]
      ? [</td>]
      ? [<td width="81%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2" color="#0000FF">]
      ? [<b>]
      ? alltrim(NETASSOC->END_BAIRRO)
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [<tr>]
      ? [<td width="19%">]
      ? [&nbsp;]
      ? [</td>]
      ? [<td width="81%"><font face="Arial, Helvetica, sans-serif" size="2">]
      ? [<b>]
      ? [<font color="#0000FF">]
      ? alltrim(NETASSOC->END_CIDADE)
      ? [</font>]
      ? [</b>]
      ? [&nbsp;/&nbsp;]
      ? [<b>]
      ? [<font color="#0000FF">]
      ? NETASSOC->END_UF
      ? [</font>]
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [<tr>]
      ? [<td width="19%">]
      ? [&nbsp;]
      ? [</td>]
      ? [<td width="81%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2" color="#0000FF">]
      ? [<b>]
      ? NETASSOC->END_CEP
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [</table>]
      ? [<BR>]
      ? [<table width="90%" border="0" cellspacing="0">]
      ? [<tr>]
      ? [<td width="19%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [Fone_1:]
      ? [</font>]
      ? [</td>]
      ? [<td width="81%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [<b>]
      ? [<font color="#0000FF">]
      ? alltrim(NETASSOC->FONE_RES)
      ? [</font>]
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [<tr>]
      ? [<td width="19%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [Fone_2:]
      ? [</font>]
      ? [</td>]
      ? [<td width="81%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2" color="#0000FF">]
      ? [<b>]
      ? alltrim(NETASSOC->FONE_CEL)
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [</table>]
      ? [<BR>]
      ? [<table width="90%" border="0" cellspacing="0">]
      ? [<tr>]
      ? [<td width="19%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [E-mail:]
      ? [</font>]
      ? [</td>]
      ? [<td width="81%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [<b>]
      ? [<font color="#0000FF">]
      ? [<a href="mailto:]
      ? alltrim(NETASSOC->END_EMAIL)
      ? ['>]
      ? alltrim(NETASSOC->END_EMAIL)
      ? [</a>]
      ? [</font>]
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [<tr>]
      ? [<td width="19%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [Site:]
      ? [</font>]
      ? [</td>]
      ? [<td width="81%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2" color="#0000FF">]
      ? [<b>]
      ? [<a href="]
      ? alltrim(NETASSOC->WEB_SITE)
      ? ['>]
      ? alltrim(NETASSOC->WEB_SITE)
      ? [</a>]
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [<tr>]
      ? [<td width="19%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2">]
      ? [Skype:]
      ? [</font>]
      ? [</td>]
      ? [<td width="81%">]
      ? [<font face="Arial, Helvetica, sans-serif" size="2" color="#0000FF">]
      ? [<b>]
      ? alltrim(NETASSOC->NUM_ICQ)
      ? [</b>]
      ? [</font>]
      ? [</td>]
      ? [</tr>]
      ? [</table>]
      ? [</td>]
      ? [</tr>]
      ? [</table>]

   endif

   NETASSOC->( dbSkip() )
enddo
FRODAPE()
FDEIMP()

return NIL
*---------------------------------------------------------------------------
* IP3200  ...... impressao total em TXT
*
function FIP3200()

NETASSOC->( dbGoTop() )

M->ct := 1
FIMPRS("IP3000","TXT")

FCABEC_PRINT()

@ 02,00 say "===> Lista por Mes de Aniversario"
M->LL := 3
M->CT := 1
NETASSOC->( dbGoTop() )
while .t.
   if NETASSOC->( eof() )
      exit
   endif

   if M->CT > 6
      //eject
      FCABEC_PRINT()
      @ 02,00 say "===> Lista por Mes de Aniversario"
      M->LL := 3
      M->CT := 1
   endif

   if TNOM = month(ctod(NETASSOC->DT_NASC))

      M->LL += 1
      @ M->LL,000 say replicate("=",78)
      M->LL += 1
      @ M->LL,000 say "  ChaveID: "+ NETASSOC->IDCHAVE
      M->LL += 1
      @ M->LL,000 say "Aniversario: "+ NETASSOC->DT_NASC
      M->LL += 1
      @ M->LL,000 say "  Contato: "+ alltrim(NETASSOC->NOME)
      M->LL += 1
      @ M->LL,000 say " Endereco: "+ alltrim(NETASSOC->END_RUA)
      M->LL += 1
      @ M->LL,011 say alltrim(NETASSOC->END_BAIRRO) +" " +alltrim(NETASSOC->END_CIDADE)
      M->LL += 1
      @ M->LL,011 say alltrim(NETASSOC->END_UF) +" "+ alltrim(NETASSOC->END_CEP)
      M->LL += 1
      @ M->LL,000 say "   Fone_1: " + alltrim(NETASSOC->FONE_RES)
      M->LL += 1
      @ M->LL,000 say "   Fone_2: " + alltrim(NETASSOC->FONE_CEL)
      M->LL += 1
      @ M->LL,000 say "   e-mail: " + alltrim(NETASSOC->END_EMAIL)
      M->LL += 1
      @ M->LL,000 say "    Skype: " + alltrim(NETASSOC->NUM_ICQ)
      M->LL += 1
      @ M->LL,000 say "     Site: " + alltrim(NETASSOC->WEB_SITE)
      M->CT += 1

   endif

   NETASSOC->( dbSkip() )
enddo
FDEIMP()

return NIL
