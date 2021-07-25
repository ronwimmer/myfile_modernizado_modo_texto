*------------------------------------------------------------------
* PC1000..... menu procura de PROCURA DE NETASSOC
* data ...... 02.12.2001 ultima revisao
*
function FPC1000()

local OPC
local TELA_ARQ
local GetList := {}
local TNOM

set( _SET_WRAP, .T. )                 // set wrap ON
set( _SET_DATEFORMAT, "dd/mm/yy" )    // set date british
OPC := 0

FARQUIVOS("NETASSOC","MK_ASS",M->WARQ_F,"1")

TNOM = space(25)

F_VAR_PSQ_GERAL()   && start variavel de pesquisa

while .T.
   OPC := 0
   TELA_ARQ := SaveScreen()
   @ 14,12 prompt chr(179) + "a.Nome        " + chr(16) // 1
   @ 15,12 prompt chr(179) + "b.Empresa     " + chr(16) // 2
   @ 16,12 prompt chr(179) + "c.Endereco    " + chr(16) // 3
   @ 17,12 prompt chr(179) + "d.Cidade      " + chr(16) // 4
   @ 18,12 prompt chr(179) + "e.Estado      " + chr(16) // 5
   @ 19,12 prompt chr(179) + "f.Doucmento   " + chr(16) // 6
   @ 20,12 prompt chr(179) + "g.Aniversario " + chr(16) // 7
   @ 21,12 prompt chr(179) + "h.Sem e-mail  " + chr(16) // 8
   @ 22,12 prompt chr(179) + "i.Voltar       " // 9
   menu to OPC

   do case
      case OPC = 1
           Fexplode(02,00,04,79,"D",M->W_MENU)
           @ 03,02 say "Nome" color M->W_MENU
           NETASSOC->( dbGoTop() )
           TNOM := space(25)
           clear gets
           set( _SET_CONFIRM, .F. )              // set confirm OFF
           @ 03,20 get TNOM pict "@n"   color M->W_MENU
           read
           if TNOM <> space(25)
              FPC1100(str(OPC,2,0),TNOM)
           endif
      case OPC = 2
           Fexplode(02,00,04,79,"D",M->W_MENU)
           @ 03,02 say "Empresa" color M->W_MENU
           NETASSOC->( dbGoTop() )
           TNOM := space(25)
           clear gets
           set( _SET_CONFIRM, .F. )              // set confirm OFF
           @ 03,20 get TNOM pict "@n"   color M->W_MENU
           read
           if TNOM <> space(25)
              FPC1100(str(OPC,2,0),TNOM)
           endif
      case OPC = 3
           Fexplode(02,00,04,79,"D",M->W_MENU)
           @ 03,02 say "Endereco" color M->W_MENU
           NETASSOC->( dbGoTop() )
           TNOM := space(25)
           clear gets
           set( _SET_CONFIRM, .F. )              // set confirm OFF
           @ 03,20 get TNOM pict "@n"   color M->W_MENU
           read
           if TNOM <> space(25)
              FPC1100(str(OPC,2,0),TNOM)
           endif
      case OPC = 4
           Fexplode(02,00,04,79,"D",M->W_MENU)
           @ 03,02 say "Cidade" color M->W_MENU
           NETASSOC->( dbGoTop() )
           TNOM := space(25)
           clear gets
           set( _SET_CONFIRM, .F. )              // set confirm OFF
           @ 03,20 get TNOM pict "@n"   color M->W_MENU
           read
           if TNOM <> space(25)
              FPC1100(str(OPC,2,0),TNOM)
           endif
      case OPC = 5
           Fexplode(02,00,04,79,"D",M->W_MENU)
           @ 03,02 say "Estado" color M->W_MENU
           NETASSOC->( dbGoTop() )
           TNOM := space(25)
           clear gets
           set( _SET_CONFIRM, .F. )              // set confirm OFF
           @ 03,20 get TNOM pict "@n"   color M->W_MENU
           read
           if TNOM <> space(25)
              FPC1100(str(OPC,2,0),TNOM)
           endif
      case OPC = 6
           Fexplode(02,00,04,79,"D",M->W_MENU)
           @ 03,02 say "Documento" color M->W_MENU
           NETASSOC->( dbGoTop() )
           TNOM := space(19)
           clear gets
           set( _SET_CONFIRM, .F. )              // set confirm OFF
           @ 03,20 get TNOM pict "@!"   color M->W_MENU
           read
           if TNOM <> space(19)
              FPC1100(str(OPC,2,0),TNOM)
           endif
      case OPC = 7
           NETASSOC->( dbGoTop() )
           TNOM := 00
           @ 11,28 prompt chr(179) + " 1 Janeiro  " 
           @ 12,28 prompt chr(179) + " 2 Fevereiro" 
           @ 13,28 prompt chr(179) + " 3 Marco    " 
           @ 14,28 prompt chr(179) + " 4 Abril    " 
           @ 15,28 prompt chr(179) + " 5 Maio     " 
           @ 16,28 prompt chr(179) + " 6 Junho    " 
           @ 17,28 prompt chr(179) + " 7 Julho    " 
           @ 18,28 prompt chr(179) + " 8 Augosto  " 
           @ 19,28 prompt chr(179) + " 9 Setembro " 
           @ 20,28 prompt chr(179) + "10 Outubro  " 
           @ 21,28 prompt chr(179) + "11 Novembro " 
           @ 22,28 prompt chr(179) + "12 Dezembro " 
           menu to TNOM
           @ 05,52 clear to 17,64
           if TNOM > 0 .and. TNOM < 13
              FPC1100(str(OPC,2,0),str(TNOM,2,0))
           endif
      case OPC = 8
           NETASSOC->( dbGoTop() )
           FPC1100(str(OPC,2,0),TNOM)
      case OPC = 0 .or. OPC = 9
           exit
   endcase
   restore screen from TELA_ARQ
enddo
RestScreen( 0,0,MaxRow(),MaxCol(), TELA_ARQ )
setcolor(M->W_NORMAL)
close database

return NIL

*............................................................................
* PC_QUEST_PC1 ...... modulo QUESTIONAMENTO DE VARIAVEL X CAMPO
*
function FPC_QUEST_PC1(PQUEST,PNOM)

do case
   case val(PQUEST)= 1
        if upper(alltrim(PNOM)) $ upper(NETASSOC->NOME)
           return .t.
        else
           return .f.
        endif
   case val(PQUEST)= 2
        if upper(alltrim(PNOM)) $ upper(NETASSOC->RAZAO)
           return .t.
        else
           return .f.
        endif
   case val(PQUEST)= 3
        if upper(alltrim(PNOM)) $ upper(NETASSOC->END_RUA)
           return .t.
        else
           return .f.
        endif
   case val(PQUEST)= 4
        if upper(alltrim(PNOM)) $ upper(NETASSOC->END_CIDADE)
           return .t.
        else
           return .f.
        endif
   case val(PQUEST)= 5
        if upper(alltrim(PNOM)) $ upper(NETASSOC->END_UF)
           return .t.
        else
           return .f.
        endif
   case val(PQUEST)= 6
        if upper(alltrim(PNOM)) $ upper(NETASSOC->DOCUMENTO)
           return .t.
        else
           return .f.
        endif
   case val(PQUEST)= 7
        if val(PNOM) = month(ctod(NETASSOC->DT_NASC))
           return .t.
        else
           return .f.
        endif
   case val(PQUEST)= 8
        if NETASSOC->END_EMAIL = space(45)
           return .t.
        else
           return .f.
        endif
endcase

return .F.

*............................................................................
* PC1100 ...... modulo PROCURA
*
function FPC1100(XQUEST,XNOM)

local TEC, WFONE

M->CT := 1
M->LL := 06
FPC_T_GERAL()  && start tela de pesquisa
dbSelectArea( "NETASSOC" )
while .T.
   TEC := inkey()
   if NETASSOC->(eof()) .or. TEC == 27
      FPC1110()
      tone()
      @ 01,00 say M->MSG5 color M->W_MSG
      inkey(15)
      @ 01,00
      exit
   endif

   @ 01,00 say " Record -->"         color M->W_MSG
   @ 01,14 say NETASSOC->(RECNO())    pict "99999" color M->W_MSG
   @ 01,21 say NETASSOC->(reccount()) pict "99999" color M->W_MSG
   WFONE := space(15)
   if substr(NETASSOC->FONE_CEL,1,15) <> space(22)
      WFONE := substr(NETASSOC->FONE_CEL,1,15)
   else
      if substr(NETASSOC->FONE_RES,1,15) <> space(22)
         WFONE := substr(NETASSOC->FONE_RES,1,15)
      else
         WFONE := "Sem Telefone."
      endif
   endif
   if FPC_QUEST_PC1(XQUEST,XNOM) = .T.
      M->WREG[ M->CT ] := RECNO()
      M->WCOD[ M->CT ] := "=>"
      M->WDET[ M->CT ] := substr(NETASSOC->NOME,1,20)       +" "+ ;
                 WFONE                             +" "+ ;
                 substr(NETASSOC->END_CIDADE,1,18) +" "+ ;
                 substr(NETASSOC->END_UF,1,20)

      @ M->LL,01 say M->WCOD[ M->CT ]             color M->W_BROWSE
      @ M->LL,03 say M->WDET[ M->CT ] pict "@N"   color M->W_BROWSE
      M->CT += 1
      M->LL += 1
      if M->CT = 17
         if FPC1110() = .F.
            exit
         endif
         M->LL = 06
         M->CT = 1
         FPC_T_GERAL()
      endif
   endif
   NETASSOC->( dbSkip() )
enddo
setcolor(M->W_NORMAL)
F_VAR_PSQ_GERAL()   && start variavel de pesquisa

return NIL
*............................................................................
* modulo de impressao em tela de procura
*
function FPC1110()

local RES1
local NUM
local TELA

RES1 := 0
NUM  := 0
while .T.
   res1 := 0
   setcolor(M->W_NORMAL)
   @ 01,00 say M->MSG9      color M->W_MSG_OPC
   @ 01,02 prompt "NAO"  
   @ 01,06 prompt "SIM"  
   @ 01,10 prompt "SAIR" 
   menu to RES1
   do case
      case RES1 = 1
           @ 01,00 say space(80) color M->W_NORMAL
           exit
      case RES1 = 3 .or. RES1 = 0
           return .F.
      case RES1 = 2
           @ 01,00 say M->MSG10       color M->W_MSG
           @ 06,01 prompt M->WCOD[1]  
           @ 07,01 prompt M->WCOD[2] 
           @ 08,01 prompt M->WCOD[3] 
           @ 09,01 prompt M->WCOD[4]
           @ 10,01 prompt M->WCOD[5] 
           @ 11,01 prompt M->WCOD[6]
           @ 12,01 prompt M->WCOD[7] 
           @ 13,01 prompt M->WCOD[8] 
           @ 14,01 prompt M->WCOD[9] 
           @ 15,01 prompt M->WCOD[10]
           @ 16,01 prompt M->WCOD[11]
           @ 17,01 prompt M->WCOD[12]
           @ 18,01 prompt M->WCOD[13] 
           @ 19,01 prompt M->WCOD[14] 
           @ 20,01 prompt M->WCOD[15] 
           @ 21,01 prompt M->WCOD[16] 
           menu to NUM
           do case
              case NUM = 0 .or. M->WCOD[ NUM ] <> "=>"
                   return .F.
              case NUM > 0 .or. NUM < 17 .and. M->WCOD[ NUM ] = "=>"
                   @ 01,00
                   TELA := SaveScreen()
                   FPC1120( M->WREG[NUM] )
                   RestScreen( 0,0,MaxRow(),MaxCol(), TELA )
                   RES1 := 0
                   NUM := 0
           endcase
   endcase
enddo
RES1 := 0
NUM := 0
F_VAR_PSQ_GERAL()   && start variavel de pesquisa
setcolor(M->W_NORMAL)

return .T.

*............................................................................
* modulo de impressao em tela
*
function FPC1120( PCLIENTE )

local RESP1, WCODIGO

FBW_T_DISTRIB()           && start tela de cadastro
NETASSOC->( dbGoto( PCLIENTE ))
WCODIGO := NETASSOC->IDCHAVE
FCD1130()

RESP1 := 0
@ 01,00 say M->MSG26      color M->W_MSG_OPC
@ 01,02 prompt "NAO"   
@ 01,06 prompt "SIM"   
menu to RESP1

if RESP1 = 2
   FCR3000()   && visualiza e edita Historico
endif

inkey(120)

return NIL