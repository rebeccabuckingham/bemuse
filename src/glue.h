#ifndef GLUE_H
#define GLUE_H

#include <stdint.h>
#include "main.h"

#define WINDOW_TITLE "Emulator"
#define MOUSE_GRAB_MSG "Mouse grab message goes here"


#ifdef __cplusplus
extern "C" {
#endif

extern uint8_t activity_led;
extern bool debugger_enabled;
extern bool grab_mouse;
extern bool warp_mode;
extern uint8_t MHZ;

void machine_dump(const char* reason);
void machine_reset();
Byte real_getByte(Addr ea);
void real_setByte(Addr ea, Byte value);

#ifdef __cplusplus
}
#endif

#endif