/// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-

#ifdef USERHOOK_INIT
void userhook_init()
{
    // put your initialisation code here
    // this will be called once at start-up
    hal.uartC->begin(map_baudrate(9, 9600));
}
#endif

#ifdef USERHOOK_FASTLOOP
void userhook_FastLoop()
{
    // put your 100Hz code here
}
#endif

#ifdef USERHOOK_50HZLOOP
void userhook_50Hz()
{
    // put your 50Hz code here
    if (g.rc_7.radio_in < 1400) {
    	//unsigned char i = 0x20 | ((unsigned char)((1500 - g.rc_7.radio_in) / 100) + 1);
        hal.uartC->write((const uint8_t[]){0x81, 0x01, 0x04, 0x07, 0x24, 0xff}, 6);
    } 

    if (g.rc_7.radio_in > 1600) {
    	//char i = (char)((g.rc_7.radio_in - 1500) / 100) + 1;
    	hal.uartC->write((const uint8_t[]){0x81, 0x01, 0x04, 0x07, 0x34, 0xff}, 6);
    }
}
#endif

#ifdef USERHOOK_MEDIUMLOOP
void userhook_MediumLoop()
{
    // put your 10Hz code here
}
#endif

#ifdef USERHOOK_SLOWLOOP
void userhook_SlowLoop()
{
    // put your 3.3Hz code here
}
#endif

#ifdef USERHOOK_SUPERSLOWLOOP
void userhook_SuperSlowLoop()
{
    // put your 1Hz code here
}
#endif