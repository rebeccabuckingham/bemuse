#ifndef GLUE_H
#define GLUE_H

#include <stdint.h>
#include "main.h"

#define WINDOW_TITLE "Emulator"
#define MOUSE_GRAB_MSG "Mouse grab message goes here"

extern uint8_t activity_led;
extern bool debugger_enabled;
extern bool grab_mouse;
extern void machine_dump(const char* reason);
extern bool warp_mode;
extern uint8_t MHZ;
extern void machine_reset();
extern Byte real_getByte(Addr ea);
extern void real_setByte(Addr ea, Byte value);

#endif