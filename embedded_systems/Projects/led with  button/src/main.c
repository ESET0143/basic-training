// Arduino Uno Rev-3
#include<avr/io.h>                // To Include AVR IO Libraries
#include<util/delay.h>            // To Include delay functions

#define led_pin PB0                // Define LED pin as PB0( Pin 8)
#define button PD1                 // Define button pin as PD1 (Pin 1)

int main(void){
    DDRB |= (1<<led_pin);         // Set PB0 as output for LED
    DDRD &= ~(1<<button);         // Set PD1 as input for button
    PORTD |= (1<<button);         

    while(1){
        // Check if button is pressed 
        if(!(PIND & (1<<button))){
            // Purpose : It should blink when pressed continously!
            PORTB |= (1<<led_pin);    // Turn LED ON
            _delay_ms(250);           // Wait for 250 ms
            PORTB &= ~(1<<led_pin);   // Turn LED OFF
            _delay_ms(250);           // Wait for 250 ms
        } else {
            PORTB &= ~(1<<led_pin);   // It Ensure LED is OFF when button not pressed
        }
        // Optional: Debounce delay
        // _delay_ms(1000);
    }
}