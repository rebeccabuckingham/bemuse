#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include "main.h"
#include "glue.h"

uint8_t activity_led = 0;
bool debugger_enabled = false;  // todo: not used yet
bool grab_mouse = false;
bool warp_mode = false;
uint8_t MHZ = 8;

void machine_reset() {
  
}

Byte real_getByte(Addr ea) {
  return 0;
}

void real_setByte(Addr ea, Byte value) {
}

void machine_dump(const char *reason) {
  puts("machine_dump() not implemented yet.");
}

int main() {
  puts("hello, world!");
  return 0;
}