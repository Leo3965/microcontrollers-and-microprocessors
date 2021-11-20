
_interrupt:

;desafio_9.c,31 :: 		void interrupt() //0008h   vetor de alta
;desafio_9.c,33 :: 		if(INT1IF_bit == 1) //INTCON3.INT1IF
	BTFSS       INT1IF_bit+0, BitPos(INT1IF_bit+0) 
	GOTO        L_interrupt0
;desafio_9.c,35 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;desafio_9.c,36 :: 		contador++;
	INFSNZ      _contador+0, 1 
	INCF        _contador+1, 1 
;desafio_9.c,37 :: 		}
L_interrupt0:
;desafio_9.c,38 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;desafio_9.c,40 :: 		void interrupt_low() //0018h  vetor baixa
;desafio_9.c,42 :: 		if(INT2IF_bit == 1)
	BTFSS       INT2IF_bit+0, BitPos(INT2IF_bit+0) 
	GOTO        L_interrupt_low1
;desafio_9.c,44 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;desafio_9.c,45 :: 		contador = 0;
	CLRF        _contador+0 
	CLRF        _contador+1 
;desafio_9.c,46 :: 		}
L_interrupt_low1:
;desafio_9.c,47 :: 		}
L_end_interrupt_low:
L__interrupt_low8:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low

_setup:

;desafio_9.c,49 :: 		void setup () {
;desafio_9.c,51 :: 		TRISA0_bit = 1;  // CONFIGURA O PINO EM QUE SE ENCONTRA A PORTA ANALÓGICA AN0 COMO ENTRADA
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;desafio_9.c,52 :: 		TRISA1_bit = 1;  // CONFIGURA O PINO EM QUE SE ENCONTRA A PORTA ANALÓGICA AN1 COMO ENTRADA
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;desafio_9.c,53 :: 		TRISA2_bit = 1;  // CONFIGURA O PINO EM QUE SE ENCONTRA A PORTA ANALÓGICA AN2 COMO ENTRADA
	BSF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;desafio_9.c,55 :: 		ADCON1 = 0b00001100;//SELECIONA OS PINOS 2, 3, 4 DO PORTA COMO ENTRADAS ANALÓGICAS (AN0, AN1, AN2)
	MOVLW       12
	MOVWF       ADCON1+0 
;desafio_9.c,56 :: 		ADC_Init();//INICIALIZA MÓDULO ANALGÓGICO
	CALL        _ADC_Init+0, 0
;desafio_9.c,57 :: 		CMCON = 0b00000111;//DESABILITA COMPARADORES INTERNOS
	MOVLW       7
	MOVWF       CMCON+0 
;desafio_9.c,59 :: 		Lcd_Init();//INICIALIZA DISPLAY LCD
	CALL        _Lcd_Init+0, 0
;desafio_9.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);//ENVIA O COMANDO DE LIMPAR TELA PARA O DISPLAY LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;desafio_9.c,61 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);// ENVIA O COMANDO DE DESLIGAR CURSOR PARA O DISPLAY LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;desafio_9.c,63 :: 		GIEH_bit = 1;// chave geral e alta prioridade
	BSF         GIEH_bit+0, BitPos(GIEH_bit+0) 
;desafio_9.c,64 :: 		PEIE_bit = 1;// Periféricos e baixa prioridade
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;desafio_9.c,65 :: 		IPEN_bit = 1;// familia PIC18
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;desafio_9.c,67 :: 		INT1IE_bit = 1;// habilita interrupção B1 INTCON3.INT1IE
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;desafio_9.c,68 :: 		INT1IP_bit = 1;// alta prioridade
	BSF         INT1IP_bit+0, BitPos(INT1IP_bit+0) 
;desafio_9.c,69 :: 		INTEDG1_bit = 1;// borda de subida
	BSF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
;desafio_9.c,70 :: 		INT1IF_bit = 0;// reset flag interrupção
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;desafio_9.c,72 :: 		INT2IE_bit = 1;// habilita interrupção B2 INTCON3.INT2IE
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;desafio_9.c,73 :: 		INT2IP_bit = 0;// baixa prioridade
	BCF         INT2IP_bit+0, BitPos(INT2IP_bit+0) 
;desafio_9.c,74 :: 		INTEDG2_bit = 1;// borda de subida
	BSF         INTEDG2_bit+0, BitPos(INTEDG2_bit+0) 
;desafio_9.c,75 :: 		INT2IF_bit = 0;// reset flag interrupção
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;desafio_9.c,77 :: 		}
L_end_setup:
	RETURN      0
; end of _setup

_main:

;desafio_9.c,79 :: 		void main() {
;desafio_9.c,80 :: 		setup();
	CALL        _setup+0, 0
;desafio_9.c,82 :: 		while(1) {
L_main2:
;desafio_9.c,83 :: 		Lcd_Out(1,2,"Contagem: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_desafio_9+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_desafio_9+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;desafio_9.c,84 :: 		IntToStr(contador, pot1_string);
	MOVF        _contador+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _contador+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _pot1_string+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_pot1_string+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;desafio_9.c,85 :: 		Lcd_Out(2, 2,pot1_string);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _pot1_string+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_pot1_string+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;desafio_9.c,86 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;desafio_9.c,87 :: 		}
	GOTO        L_main2
;desafio_9.c,88 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
