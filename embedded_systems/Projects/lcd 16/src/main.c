#include<Arduino.h>
#include <avr/io.h>
#include <util/delay.h>

#define LCD_PIND7 PD7
#define LCD_PIND6 PB0
#define LCD_PIND5 PB1
#define LCD_PIND4 PB2
#define ENABLE PB3
#define LCD_RS PB4

// Helper to pulse the Enable pin
void lcd_enable_pulse() {
    PORTB |= (1 << ENABLE);
    _delay_us(1);
    PORTB &= ~(1 << ENABLE);
    _delay_us(100);
}

// Send 4 bits to LCD
void lcd_send_nibble(unsigned char nibble) {
    // Clear data pins
    PORTD &= ~(1 << LCD_PIND7);
    PORTB &= ~((1 << LCD_PIND6) | (1 << LCD_PIND5) | (1 << LCD_PIND4));
    // Set data pins according to nibble
    if (nibble & 0x08) PORTD |= (1 << LCD_PIND7);
    if (nibble & 0x04) PORTB |= (1 << LCD_PIND6);
    if (nibble & 0x02) PORTB |= (1 << LCD_PIND5);
    if (nibble & 0x01) PORTB |= (1 << LCD_PIND4);
    lcd_enable_pulse();
}

void lcd_command(unsigned char cmd){
    PORTB &= ~(1 << LCD_RS); // RS low for command
    lcd_send_nibble(cmd >> 4); // Send high nibble
    lcd_send_nibble(cmd & 0x0F); // Send low nibble
    _delay_ms(2);
}

void lcd_data(unsigned char data){
    PORTB |= (1 << LCD_RS); // RS high for data
    lcd_send_nibble(data >> 4); // Send high nibble
    lcd_send_nibble(data & 0x0F); // Send low nibble
    _delay_ms(2);
}

void lcd_init(){
    // Set pins as output
    DDRD |= (1 << LCD_PIND7);
    DDRB |= (1 << LCD_PIND6) | (1 << LCD_PIND5) | (1 << LCD_PIND4) | (1 << ENABLE) | (1 << LCD_RS);

    _delay_ms(2000);
    lcd_command(0x02); // 4-bit mode
    lcd_command(0x28); // 2 line, 5x7 matrix
    lcd_command(0x0C); // Display ON, cursor off
    lcd_command(0x06); // Increment cursor
    lcd_command(0x01); // Clear screen
    _delay_ms(2);
}

int main(void) {
    lcd_init();
    lcd_data('H');
    lcd_data('e');
    lcd_data('l');
    lcd_data('l');
    lcd_data('o');
    lcd_data('w');
    lcd_data('o');
    lcd_data('r');
    lcd_data('l');
    lcd_data('d');
    while (1) {
        // Main loop
    }
}