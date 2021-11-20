
_Escrever:

;Projeto.c,27 :: 		void Escrever(int disp1, int disp2, int disp3, int disp4){
;Projeto.c,28 :: 		Controle = 0b1110; // display 1 (2)
	MOVLW       14
	MOVWF       PORTB+0 
;Projeto.c,29 :: 		DISPLAY = disp1;
	MOVF        FARG_Escrever_disp1+0, 0 
	MOVWF       PORTD+0 
;Projeto.c,30 :: 		delay_ms(5);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_Escrever0:
	DECFSZ      R13, 1, 1
	BRA         L_Escrever0
	DECFSZ      R12, 1, 1
	BRA         L_Escrever0
	NOP
	NOP
;Projeto.c,31 :: 		Controle = 0b1101; // display 2(0)
	MOVLW       13
	MOVWF       PORTB+0 
;Projeto.c,32 :: 		DISPLAY = disp2;
	MOVF        FARG_Escrever_disp2+0, 0 
	MOVWF       PORTD+0 
;Projeto.c,33 :: 		delay_ms(5);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_Escrever1:
	DECFSZ      R13, 1, 1
	BRA         L_Escrever1
	DECFSZ      R12, 1, 1
	BRA         L_Escrever1
	NOP
	NOP
;Projeto.c,34 :: 		Controle = 0b1011; // display 3 (2)
	MOVLW       11
	MOVWF       PORTB+0 
;Projeto.c,35 :: 		DISPLAY = disp3;
	MOVF        FARG_Escrever_disp3+0, 0 
	MOVWF       PORTD+0 
;Projeto.c,36 :: 		delay_ms(5);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_Escrever2:
	DECFSZ      R13, 1, 1
	BRA         L_Escrever2
	DECFSZ      R12, 1, 1
	BRA         L_Escrever2
	NOP
	NOP
;Projeto.c,37 :: 		Controle = 0b0111; // display 4 (1)
	MOVLW       7
	MOVWF       PORTB+0 
;Projeto.c,38 :: 		DISPLAY = disp4;
	MOVF        FARG_Escrever_disp4+0, 0 
	MOVWF       PORTD+0 
;Projeto.c,39 :: 		delay_ms(5);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_Escrever3:
	DECFSZ      R13, 1, 1
	BRA         L_Escrever3
	DECFSZ      R12, 1, 1
	BRA         L_Escrever3
	NOP
	NOP
;Projeto.c,40 :: 		}
L_end_Escrever:
	RETURN      0
; end of _Escrever

_ConfigPIc:

;Projeto.c,42 :: 		void ConfigPIc()
;Projeto.c,44 :: 		TRISD = 0B00000000;// PORTD SAIDA
	CLRF        TRISD+0 
;Projeto.c,45 :: 		PORTD = 0B00000000;// RESET PORTD
	CLRF        PORTD+0 
;Projeto.c,46 :: 		TRISC0_bit = 1;
	BSF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;Projeto.c,47 :: 		TRISC1_bit = 1;
	BSF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;Projeto.c,49 :: 		GIEH_bit = 1;// chave geral e alta prioridade
	BSF         GIEH_bit+0, BitPos(GIEH_bit+0) 
;Projeto.c,50 :: 		PEIE_bit = 1;// Periféricos e baixa prioridade
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Projeto.c,51 :: 		IPEN_bit = 1;// familia PIC18
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;Projeto.c,53 :: 		INT1IE_bit = 1;// habilita interrupção B1 INTCON3.INT1IE
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;Projeto.c,54 :: 		INT1IP_bit = 1;// alta prioridade
	BSF         INT1IP_bit+0, BitPos(INT1IP_bit+0) 
;Projeto.c,55 :: 		INTEDG1_bit = 1;// borda de decida
	BSF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
;Projeto.c,56 :: 		INT1IF_bit = 0;// reset flag interrupção
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;Projeto.c,57 :: 		}
L_end_ConfigPIc:
	RETURN      0
; end of _ConfigPIc

_Unidade:

;Projeto.c,59 :: 		void Unidade(short num1, short num2, short num3, short num4)
;Projeto.c,61 :: 		U0 = num1;
	BTFSC       FARG_Unidade_num1+0, 0 
	GOTO        L__Unidade47
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
	GOTO        L__Unidade48
L__Unidade47:
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
L__Unidade48:
;Projeto.c,62 :: 		U1 = num2;
	BTFSC       FARG_Unidade_num2+0, 0 
	GOTO        L__Unidade49
	BCF         RD1_bit+0, BitPos(RD1_bit+0) 
	GOTO        L__Unidade50
L__Unidade49:
	BSF         RD1_bit+0, BitPos(RD1_bit+0) 
L__Unidade50:
;Projeto.c,63 :: 		U2 = num3;
	BTFSC       FARG_Unidade_num3+0, 0 
	GOTO        L__Unidade51
	BCF         RD2_bit+0, BitPos(RD2_bit+0) 
	GOTO        L__Unidade52
L__Unidade51:
	BSF         RD2_bit+0, BitPos(RD2_bit+0) 
L__Unidade52:
;Projeto.c,64 :: 		U3 = num4;
	BTFSC       FARG_Unidade_num4+0, 0 
	GOTO        L__Unidade53
	BCF         RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L__Unidade54
L__Unidade53:
	BSF         RD3_bit+0, BitPos(RD3_bit+0) 
L__Unidade54:
;Projeto.c,66 :: 		}
L_end_Unidade:
	RETURN      0
; end of _Unidade

_Dezena:

;Projeto.c,68 :: 		void Dezena(short num1, short num2, short num3, short num4)
;Projeto.c,70 :: 		D0 = num1;
	BTFSC       FARG_Dezena_num1+0, 0 
	GOTO        L__Dezena56
	BCF         RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L__Dezena57
L__Dezena56:
	BSF         RD4_bit+0, BitPos(RD4_bit+0) 
L__Dezena57:
;Projeto.c,71 :: 		D1 = num2;
	BTFSC       FARG_Dezena_num2+0, 0 
	GOTO        L__Dezena58
	BCF         RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L__Dezena59
L__Dezena58:
	BSF         RD5_bit+0, BitPos(RD5_bit+0) 
L__Dezena59:
;Projeto.c,72 :: 		D2 = num3;
	BTFSC       FARG_Dezena_num3+0, 0 
	GOTO        L__Dezena60
	BCF         RD6_bit+0, BitPos(RD6_bit+0) 
	GOTO        L__Dezena61
L__Dezena60:
	BSF         RD6_bit+0, BitPos(RD6_bit+0) 
L__Dezena61:
;Projeto.c,73 :: 		D3 = num4;
	BTFSC       FARG_Dezena_num4+0, 0 
	GOTO        L__Dezena62
	BCF         RD7_bit+0, BitPos(RD7_bit+0) 
	GOTO        L__Dezena63
L__Dezena62:
	BSF         RD7_bit+0, BitPos(RD7_bit+0) 
L__Dezena63:
;Projeto.c,74 :: 		}
L_end_Dezena:
	RETURN      0
; end of _Dezena

_Converter:

;Projeto.c,76 :: 		void Converter(short number){
;Projeto.c,77 :: 		switch(number) {
	GOTO        L_Converter4
;Projeto.c,78 :: 		case 1:
L_Converter6:
;Projeto.c,79 :: 		num1 = 1;
	MOVLW       1
	MOVWF       _num1+0 
;Projeto.c,80 :: 		num2 = 0;
	CLRF        _num2+0 
;Projeto.c,81 :: 		num3 = 0;
	CLRF        _num3+0 
;Projeto.c,82 :: 		num4 = 0;
	CLRF        _num4+0 
;Projeto.c,83 :: 		break;
	GOTO        L_Converter5
;Projeto.c,84 :: 		case 2:
L_Converter7:
;Projeto.c,85 :: 		num1 = 0;
	CLRF        _num1+0 
;Projeto.c,86 :: 		num2 = 1;
	MOVLW       1
	MOVWF       _num2+0 
;Projeto.c,87 :: 		num3 = 0;
	CLRF        _num3+0 
;Projeto.c,88 :: 		num4 = 0;
	CLRF        _num4+0 
;Projeto.c,89 :: 		break;
	GOTO        L_Converter5
;Projeto.c,90 :: 		case 3:
L_Converter8:
;Projeto.c,91 :: 		num1 = 1;
	MOVLW       1
	MOVWF       _num1+0 
;Projeto.c,92 :: 		num2 = 1;
	MOVLW       1
	MOVWF       _num2+0 
;Projeto.c,93 :: 		num3 = 0;
	CLRF        _num3+0 
;Projeto.c,94 :: 		num4 = 0;
	CLRF        _num4+0 
;Projeto.c,95 :: 		break;
	GOTO        L_Converter5
;Projeto.c,96 :: 		case 4:
L_Converter9:
;Projeto.c,97 :: 		num1 = 0;
	CLRF        _num1+0 
;Projeto.c,98 :: 		num2 = 0;
	CLRF        _num2+0 
;Projeto.c,99 :: 		num3 = 1;
	MOVLW       1
	MOVWF       _num3+0 
;Projeto.c,100 :: 		num4 = 0;
	CLRF        _num4+0 
;Projeto.c,101 :: 		break;
	GOTO        L_Converter5
;Projeto.c,102 :: 		case 5:
L_Converter10:
;Projeto.c,103 :: 		num1 = 1;
	MOVLW       1
	MOVWF       _num1+0 
;Projeto.c,104 :: 		num2 = 0;
	CLRF        _num2+0 
;Projeto.c,105 :: 		num3 = 1;
	MOVLW       1
	MOVWF       _num3+0 
;Projeto.c,106 :: 		num4 = 0;
	CLRF        _num4+0 
;Projeto.c,107 :: 		break;
	GOTO        L_Converter5
;Projeto.c,108 :: 		case 6:
L_Converter11:
;Projeto.c,109 :: 		num1 = 0;
	CLRF        _num1+0 
;Projeto.c,110 :: 		num2 = 1;
	MOVLW       1
	MOVWF       _num2+0 
;Projeto.c,111 :: 		num3 = 1;
	MOVLW       1
	MOVWF       _num3+0 
;Projeto.c,112 :: 		num4 = 0;
	CLRF        _num4+0 
;Projeto.c,113 :: 		break;
	GOTO        L_Converter5
;Projeto.c,114 :: 		case 7:
L_Converter12:
;Projeto.c,115 :: 		num1 = 1;
	MOVLW       1
	MOVWF       _num1+0 
;Projeto.c,116 :: 		num2 = 1;
	MOVLW       1
	MOVWF       _num2+0 
;Projeto.c,117 :: 		num3 = 1;
	MOVLW       1
	MOVWF       _num3+0 
;Projeto.c,118 :: 		num4 = 0;
	CLRF        _num4+0 
;Projeto.c,119 :: 		break;
	GOTO        L_Converter5
;Projeto.c,120 :: 		case 8:
L_Converter13:
;Projeto.c,121 :: 		num1 = 0;
	CLRF        _num1+0 
;Projeto.c,122 :: 		num2 = 0;
	CLRF        _num2+0 
;Projeto.c,123 :: 		num3 = 0;
	CLRF        _num3+0 
;Projeto.c,124 :: 		num4 = 1;
	MOVLW       1
	MOVWF       _num4+0 
;Projeto.c,125 :: 		break;
	GOTO        L_Converter5
;Projeto.c,126 :: 		case 9:
L_Converter14:
;Projeto.c,127 :: 		num1 = 1;
	MOVLW       1
	MOVWF       _num1+0 
;Projeto.c,128 :: 		num2 = 0;
	CLRF        _num2+0 
;Projeto.c,129 :: 		num3 = 0;
	CLRF        _num3+0 
;Projeto.c,130 :: 		num4 = 1;
	MOVLW       1
	MOVWF       _num4+0 
;Projeto.c,131 :: 		break;
	GOTO        L_Converter5
;Projeto.c,132 :: 		case 0:
L_Converter15:
;Projeto.c,133 :: 		num1 = 0;
	CLRF        _num1+0 
;Projeto.c,134 :: 		num2 = 0;
	CLRF        _num2+0 
;Projeto.c,135 :: 		num3 = 0;
	CLRF        _num3+0 
;Projeto.c,136 :: 		num4 = 0;
	CLRF        _num4+0 
;Projeto.c,137 :: 		break;
	GOTO        L_Converter5
;Projeto.c,138 :: 		}
L_Converter4:
	MOVF        FARG_Converter_number+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter6
	MOVF        FARG_Converter_number+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter7
	MOVF        FARG_Converter_number+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter8
	MOVF        FARG_Converter_number+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter9
	MOVF        FARG_Converter_number+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter10
	MOVF        FARG_Converter_number+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter11
	MOVF        FARG_Converter_number+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter12
	MOVF        FARG_Converter_number+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter13
	MOVF        FARG_Converter_number+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter14
	MOVF        FARG_Converter_number+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Converter15
L_Converter5:
;Projeto.c,139 :: 		}
L_end_Converter:
	RETURN      0
; end of _Converter

_main:

;Projeto.c,142 :: 		void main(){
;Projeto.c,143 :: 		ConfigPIC();
	CALL        _ConfigPIc+0, 0
;Projeto.c,144 :: 		while(1){ // loop infinito
L_main16:
;Projeto.c,149 :: 		if(!but0 && but1){
	BTFSC       RC0_bit+0, BitPos(RC0_bit+0) 
	GOTO        L_main20
	BTFSS       RC1_bit+0, BitPos(RC1_bit+0) 
	GOTO        L_main20
L__main43:
;Projeto.c,150 :: 		for (i = 0; i <= 9; i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_main21:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _i+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main66
	MOVF        _i+0, 0 
	SUBLW       9
L__main66:
	BTFSS       STATUS+0, 0 
	GOTO        L_main22
;Projeto.c,151 :: 		Converter(i);
	MOVF        _i+0, 0 
	MOVWF       FARG_Converter_number+0 
	CALL        _Converter+0, 0
;Projeto.c,152 :: 		Dezena(num1, num2, num3, num4);
	MOVF        _num1+0, 0 
	MOVWF       FARG_Dezena_num1+0 
	MOVF        _num2+0, 0 
	MOVWF       FARG_Dezena_num2+0 
	MOVF        _num3+0, 0 
	MOVWF       FARG_Dezena_num3+0 
	MOVF        _num4+0, 0 
	MOVWF       FARG_Dezena_num4+0 
	CALL        _Dezena+0, 0
;Projeto.c,153 :: 		if (!but0) break;
	BTFSC       RC0_bit+0, BitPos(RC0_bit+0) 
	GOTO        L_main24
	GOTO        L_main22
L_main24:
;Projeto.c,154 :: 		for (j = 0; j <= 9; j++){
	CLRF        _j+0 
	CLRF        _j+1 
L_main25:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _j+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main67
	MOVF        _j+0, 0 
	SUBLW       9
L__main67:
	BTFSS       STATUS+0, 0 
	GOTO        L_main26
;Projeto.c,155 :: 		Converter(j);
	MOVF        _j+0, 0 
	MOVWF       FARG_Converter_number+0 
	CALL        _Converter+0, 0
;Projeto.c,156 :: 		Unidade(num1, num2, num3, num4);
	MOVF        _num1+0, 0 
	MOVWF       FARG_Unidade_num1+0 
	MOVF        _num2+0, 0 
	MOVWF       FARG_Unidade_num2+0 
	MOVF        _num3+0, 0 
	MOVWF       FARG_Unidade_num3+0 
	MOVF        _num4+0, 0 
	MOVWF       FARG_Unidade_num4+0 
	CALL        _Unidade+0, 0
;Projeto.c,157 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main28:
	DECFSZ      R13, 1, 1
	BRA         L_main28
	DECFSZ      R12, 1, 1
	BRA         L_main28
	DECFSZ      R11, 1, 1
	BRA         L_main28
;Projeto.c,158 :: 		if (!but0) break;
	BTFSC       RC0_bit+0, BitPos(RC0_bit+0) 
	GOTO        L_main29
	GOTO        L_main26
L_main29:
;Projeto.c,154 :: 		for (j = 0; j <= 9; j++){
	INFSNZ      _j+0, 1 
	INCF        _j+1, 1 
;Projeto.c,159 :: 		}
	GOTO        L_main25
L_main26:
;Projeto.c,150 :: 		for (i = 0; i <= 9; i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Projeto.c,160 :: 		}
	GOTO        L_main21
L_main22:
;Projeto.c,161 :: 		}
L_main20:
;Projeto.c,163 :: 		if(!but0 && !but1){
	BTFSC       RC0_bit+0, BitPos(RC0_bit+0) 
	GOTO        L_main32
	BTFSC       RC1_bit+0, BitPos(RC1_bit+0) 
	GOTO        L_main32
L__main42:
;Projeto.c,164 :: 		for (i = 9; i >= 0; i--){
	MOVLW       9
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_main33:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main68
	MOVLW       0
	SUBWF       _i+0, 0 
L__main68:
	BTFSS       STATUS+0, 0 
	GOTO        L_main34
;Projeto.c,165 :: 		Converter(i);
	MOVF        _i+0, 0 
	MOVWF       FARG_Converter_number+0 
	CALL        _Converter+0, 0
;Projeto.c,166 :: 		Dezena(num1, num2, num3, num4);
	MOVF        _num1+0, 0 
	MOVWF       FARG_Dezena_num1+0 
	MOVF        _num2+0, 0 
	MOVWF       FARG_Dezena_num2+0 
	MOVF        _num3+0, 0 
	MOVWF       FARG_Dezena_num3+0 
	MOVF        _num4+0, 0 
	MOVWF       FARG_Dezena_num4+0 
	CALL        _Dezena+0, 0
;Projeto.c,167 :: 		if (!but0) break;
	BTFSC       RC0_bit+0, BitPos(RC0_bit+0) 
	GOTO        L_main36
	GOTO        L_main34
L_main36:
;Projeto.c,168 :: 		for (j = 9; j >= 0; j--){
	MOVLW       9
	MOVWF       _j+0 
	MOVLW       0
	MOVWF       _j+1 
L_main37:
	MOVLW       128
	XORWF       _j+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main69
	MOVLW       0
	SUBWF       _j+0, 0 
L__main69:
	BTFSS       STATUS+0, 0 
	GOTO        L_main38
;Projeto.c,169 :: 		Converter(j);
	MOVF        _j+0, 0 
	MOVWF       FARG_Converter_number+0 
	CALL        _Converter+0, 0
;Projeto.c,170 :: 		Unidade(num1, num2, num3, num4);
	MOVF        _num1+0, 0 
	MOVWF       FARG_Unidade_num1+0 
	MOVF        _num2+0, 0 
	MOVWF       FARG_Unidade_num2+0 
	MOVF        _num3+0, 0 
	MOVWF       FARG_Unidade_num3+0 
	MOVF        _num4+0, 0 
	MOVWF       FARG_Unidade_num4+0 
	CALL        _Unidade+0, 0
;Projeto.c,171 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main40:
	DECFSZ      R13, 1, 1
	BRA         L_main40
	DECFSZ      R12, 1, 1
	BRA         L_main40
	DECFSZ      R11, 1, 1
	BRA         L_main40
;Projeto.c,172 :: 		if (!but0) break;
	BTFSC       RC0_bit+0, BitPos(RC0_bit+0) 
	GOTO        L_main41
	GOTO        L_main38
L_main41:
;Projeto.c,168 :: 		for (j = 9; j >= 0; j--){
	MOVLW       1
	SUBWF       _j+0, 1 
	MOVLW       0
	SUBWFB      _j+1, 1 
;Projeto.c,173 :: 		}
	GOTO        L_main37
L_main38:
;Projeto.c,164 :: 		for (i = 9; i >= 0; i--){
	MOVLW       1
	SUBWF       _i+0, 1 
	MOVLW       0
	SUBWFB      _i+1, 1 
;Projeto.c,174 :: 		}
	GOTO        L_main33
L_main34:
;Projeto.c,175 :: 		}
L_main32:
;Projeto.c,178 :: 		}
	GOTO        L_main16
;Projeto.c,180 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
