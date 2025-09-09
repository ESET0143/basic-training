#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    // Set Pin 5 of Port B as an OUTPUT
    // The Data Direction Register for Port B is 'DDRB'
    // Writing a '1' to a bit sets that pin as output.
    DDRB |= (1 << DDB5); // Same as: DDRB = DDRB | 0b00100000;

    while(1) {
        // Turn LED ON (Set Pin 5 of Port B HIGH)
        PORTB |= (1 << PORTB5); // Set bit 5 to 1

        _delay_ms(500); // Wait 500 ms

        // Turn LED OFF (Set Pin 5 of Port B LOW)
        PORTB &= ~(1 << PORTB5); // Set bit 5 to 0

        _delay_ms(500); // Wait 500 ms
    }
}