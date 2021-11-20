// Fusíveis de configuração do microcontrolador
 
#FUSES NOWDT                    //Watch Dog Timer desabilitado
#FUSES HS                       //oscilador cristal
#FUSES PUT                      //Power Up Timer
#FUSES NOPROTECT                //sem proteção para leitura da eprom
#FUSES BROWNOUT                 //Resetar quando detectar brownout
#FUSES NOMCLR                   //Reset desabilitado
#FUSES NOLVP                    //prog. baixa voltagem desabilitado
#FUSES NOCPD                    //Sem travar o chip
 
#use delay(clock=16000000)      //Define o cristal utilizado
 
 
//Definição de entradas e saídas
//Cada bit representa um pino físico de I/O
// 0 significa que o pino será uma saída
// 1 significa que o pino será uma entrada
#define trisa 0b00000000
#define trisb 0b00000000
 
// Estas são as definições dos pinos que o LCD utiliza.
// Definem quais pinos do PIC controlarão os pinos do LCD
 
#define lcd_enable pin_a1       // pino enable do LCD
#define lcd_rs     pin_a0       // pino rs (register select)do LCD
                                // (0) para comandos    (1) para dados
 
#define lcd_db4    pin_b4       // pino de dados d4 do LCD
#define lcd_db5    pin_b5       // pino de dados d5 do LCD
#define lcd_db6    pin_b6       // pino de dados d6 do LCD
#define lcd_db7    pin_b7       // pino de dados d7 do LCD
#include <lcd.h>                //declaração da biblioteca do LCD
 
//Programa principal
void main(){
 
    inicializa_lcd();               //Inicializa o LCD
 
while(1){
        //limpa_lcd();            //Limpa o display do LCD
        caracter_inicio(2,6);
        printf(escreve_lcd,"                ");
        delay_ms(500);
        caracter_inicio(1,4);   //Define o caracter de inicio da escrita
        printf(escreve_lcd,"FILIPEFLOP");  //Escreve no LCD
        delay_ms(2000);
                
        caracter_inicio(1,4);
        printf(escreve_lcd,"           ");
        delay_ms(500);
        caracter_inicio(2,6);
        printf(escreve_lcd,"P I C");
        delay_ms(2000);         
        }
} //fecha void main