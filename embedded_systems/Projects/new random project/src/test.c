#include <avr/io.h>
#include <util/delay.h>
#define LED_PIN PD3 // port D pin set to 9

int main (void ){

DDRD |=(1<<LED_PIN);

while(1){



    PORTD |= (1<<LED_PIN);     //LED ON
    _delay_ms(500);     //delay 500ms



   PORTD &= ~(1<<LED_PIN); // LED OFF
    _delay_ms(500); //delay 500ms

}

return 0;
}