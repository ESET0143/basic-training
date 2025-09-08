//write a program to connect 3 led
//1 to pin 2 -on
//2 to pin 5 off
//3 to pin 7 on/off
#include<avr/io.h>
#include<util/delay.h>

#define led1 PD2
#define led2 PD5
#define led3 PD7


int main(void){
    DDRD |= (1<<led1);
    DDRD |= (1<<led2);
    DDRD |= (1<<led3);

    //FOR LED-ON
    PORTD |= (1<<led1);
    //FOR LED-OFF after 100ms
    PORTD |=(1<<led2);
    _delay_ms(1000);
    PORTD &=~(1<<led2);
         
    while(1){
        //FOR LED-Toggle
        PORTD ^=(1<<led3);
        _delay_ms(500);
    }
}