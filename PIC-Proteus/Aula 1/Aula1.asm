
_setup:

;Aula1.c,3 :: 		void setup() {
;Aula1.c,4 :: 		TRISD = 0b00000000;
	CLRF       TRISD+0
;Aula1.c,5 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;Aula1.c,6 :: 		TRISC = 1;
	MOVLW      1
	MOVWF      TRISC+0
;Aula1.c,7 :: 		PORTC.RC2 = 1;
	BSF        PORTC+0, 2
;Aula1.c,8 :: 		}
L_end_setup:
	RETURN
; end of _setup

_turnOnLED:

;Aula1.c,10 :: 		void turnOnLED(unsigned short num) {
;Aula1.c,11 :: 		switch(num%8) {
	MOVLW      7
	ANDWF      FARG_turnOnLED_num+0, 0
	MOVWF      R1+0
	GOTO       L_turnOnLED0
;Aula1.c,12 :: 		case 1: PORTD = 0b00000001; break;
L_turnOnLED2:
	MOVLW      1
	MOVWF      PORTD+0
	GOTO       L_turnOnLED1
;Aula1.c,13 :: 		case 2: PORTD = 0b00000010; break;
L_turnOnLED3:
	MOVLW      2
	MOVWF      PORTD+0
	GOTO       L_turnOnLED1
;Aula1.c,14 :: 		case 3: PORTD = 0b00000100; break;
L_turnOnLED4:
	MOVLW      4
	MOVWF      PORTD+0
	GOTO       L_turnOnLED1
;Aula1.c,15 :: 		case 4: PORTD = 0b00001000; break;
L_turnOnLED5:
	MOVLW      8
	MOVWF      PORTD+0
	GOTO       L_turnOnLED1
;Aula1.c,16 :: 		case 5: PORTD = 0b00010000; break;
L_turnOnLED6:
	MOVLW      16
	MOVWF      PORTD+0
	GOTO       L_turnOnLED1
;Aula1.c,17 :: 		case 6: PORTD = 0b00100000; break;
L_turnOnLED7:
	MOVLW      32
	MOVWF      PORTD+0
	GOTO       L_turnOnLED1
;Aula1.c,18 :: 		case 7: PORTD = 0b01000000; break;
L_turnOnLED8:
	MOVLW      64
	MOVWF      PORTD+0
	GOTO       L_turnOnLED1
;Aula1.c,19 :: 		default: PORTD = 0b10000000; break;
L_turnOnLED9:
	MOVLW      128
	MOVWF      PORTD+0
	GOTO       L_turnOnLED1
;Aula1.c,20 :: 		}
L_turnOnLED0:
	MOVF       R1+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_turnOnLED2
	MOVF       R1+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_turnOnLED3
	MOVF       R1+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_turnOnLED4
	MOVF       R1+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_turnOnLED5
	MOVF       R1+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_turnOnLED6
	MOVF       R1+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_turnOnLED7
	MOVF       R1+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_turnOnLED8
	GOTO       L_turnOnLED9
L_turnOnLED1:
;Aula1.c,21 :: 		}
L_end_turnOnLED:
	RETURN
; end of _turnOnLED

_main:

;Aula1.c,23 :: 		void main() {
;Aula1.c,24 :: 		setup();
	CALL       _setup+0
;Aula1.c,26 :: 		while(1) {
L_main10:
;Aula1.c,27 :: 		for (num = 0; num <= 8; num++){
	CLRF       _num+0
	CLRF       _num+1
L_main12:
	MOVF       _num+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVF       _num+0, 0
	SUBLW      8
L__main23:
	BTFSS      STATUS+0, 0
	GOTO       L_main13
;Aula1.c,28 :: 		turnOnLED(num);
	MOVF       _num+0, 0
	MOVWF      FARG_turnOnLED_num+0
	CALL       _turnOnLED+0
;Aula1.c,29 :: 		delay_ms(900);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      37
	MOVWF      R12+0
	MOVLW      49
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;Aula1.c,27 :: 		for (num = 0; num <= 8; num++){
	INCF       _num+0, 1
	BTFSC      STATUS+0, 2
	INCF       _num+1, 1
;Aula1.c,30 :: 		}
	GOTO       L_main12
L_main13:
;Aula1.c,32 :: 		for (num = 8; num > 0; num--){
	MOVLW      8
	MOVWF      _num+0
	MOVLW      0
	MOVWF      _num+1
L_main16:
	MOVF       _num+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVF       _num+0, 0
	SUBLW      0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
;Aula1.c,33 :: 		turnOnLED(num);
	MOVF       _num+0, 0
	MOVWF      FARG_turnOnLED_num+0
	CALL       _turnOnLED+0
;Aula1.c,34 :: 		delay_ms(900);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      37
	MOVWF      R12+0
	MOVLW      49
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;Aula1.c,32 :: 		for (num = 8; num > 0; num--){
	MOVLW      1
	SUBWF      _num+0, 1
	BTFSS      STATUS+0, 0
	DECF       _num+1, 1
;Aula1.c,35 :: 		}
	GOTO       L_main16
L_main17:
;Aula1.c,36 :: 		}
	GOTO       L_main10
;Aula1.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
