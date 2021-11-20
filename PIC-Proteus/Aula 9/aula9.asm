
_interrupt:

;aula9.c,4 :: 		void interrupt() //0008h
;aula9.c,6 :: 		if(INT1IF_bit == 1)
	BTFSS       INT1IF_bit+0, BitPos(INT1IF_bit+0) 
	GOTO        L_interrupt0
;aula9.c,8 :: 		Motor1 = 0;
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
;aula9.c,9 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;aula9.c,10 :: 		}
L_interrupt0:
;aula9.c,11 :: 		}
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

;aula9.c,13 :: 		void interrupt_low() //0018h  vetor baixa
;aula9.c,15 :: 		if(INT2IF_bit == 1)
	BTFSS       INT2IF_bit+0, BitPos(INT2IF_bit+0) 
	GOTO        L_interrupt_low1
;aula9.c,17 :: 		Motor1 = 1;
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
;aula9.c,18 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;aula9.c,19 :: 		}
L_interrupt_low1:
;aula9.c,20 :: 		}
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

_ConfigPIC:

;aula9.c,22 :: 		void ConfigPIC()
;aula9.c,24 :: 		TRISD0_bit = 0;// rd0 saida (motor1)
	BCF         TRISD0_bit+0, BitPos(TRISD0_bit+0) 
;aula9.c,25 :: 		TRISB0_bit = 1;// rb0 entrada (b0)
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;aula9.c,26 :: 		ADCON1 = 0x0F;// configura os pinos do PORTB como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;aula9.c,27 :: 		TRISB1_bit = 1;// rb1 entrada (int1)
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;aula9.c,28 :: 		Motor1 = 0;
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
;aula9.c,29 :: 		GIEH_bit = 1;// chave geral e alta prioridade
	BSF         GIEH_bit+0, BitPos(GIEH_bit+0) 
;aula9.c,30 :: 		PEIE_bit = 1;// Periféricos e baixa prioridade
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;aula9.c,31 :: 		IPEN_bit = 1;// familia PIC18
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;aula9.c,32 :: 		INT1IE_bit = 1;// habilita interrupção int1
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;aula9.c,33 :: 		INT1IP_bit = 1;// alta prioridade
	BSF         INT1IP_bit+0, BitPos(INT1IP_bit+0) 
;aula9.c,34 :: 		INTEDG1_bit = 1;// borda de subida
	BSF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
;aula9.c,35 :: 		INT1IF_bit = 0;// reset flag interrupção
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;aula9.c,37 :: 		INT2IE_bit = 1;// habilita interrupção B2 INTCON3.INT2IE
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;aula9.c,38 :: 		INT2IP_bit = 0;// baixa prioridade
	BCF         INT2IP_bit+0, BitPos(INT2IP_bit+0) 
;aula9.c,39 :: 		INTEDG2_bit = 1;// borda de subida
	BSF         INTEDG2_bit+0, BitPos(INTEDG2_bit+0) 
;aula9.c,40 :: 		INT2IF_bit = 0;// reset flag interrupção
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;aula9.c,42 :: 		}
L_end_ConfigPIC:
	RETURN      0
; end of _ConfigPIC

_ligaMotor1:

;aula9.c,43 :: 		void ligaMotor1()
;aula9.c,45 :: 		if(B0 == 1)
	BTFSS       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_ligaMotor12
;aula9.c,47 :: 		Motor1 = 1;
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
;aula9.c,48 :: 		}
L_ligaMotor12:
;aula9.c,49 :: 		}
L_end_ligaMotor1:
	RETURN      0
; end of _ligaMotor1

_main:

;aula9.c,50 :: 		void main()
;aula9.c,52 :: 		ConfigPIC();
	CALL        _ConfigPIC+0, 0
;aula9.c,53 :: 		while(1)
L_main3:
;aula9.c,55 :: 		ligaMotor1();
	CALL        _ligaMotor1+0, 0
;aula9.c,56 :: 		}
	GOTO        L_main3
;aula9.c,57 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
