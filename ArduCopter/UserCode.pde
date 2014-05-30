/// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-

#ifdef USERHOOK_INIT
void userhook_init()
{
    // put your initialisation code here
    // this will be called once at start-up
    hal.uartC->begin(9600);
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
    uint8_t packet[6];
    packet[0] = 0x81;
    packet[1] = 0x01;
    packet[2] = 0x04;
    packet[3] = 0x07;
    packet[4] = 0x00;
    packet[5] = 0xff;
          
    if (g.rc_7.radio_in < 1400) {
    	packet[4] = 0x20 | ((unsigned char)((1500 - g.rc_7.radio_in) / 100));
        hal.uartC->write(packet, 6);
    } else if (g.rc_7.radio_in > 1600) {
    	packet[4] = 0x30 | ((unsigned char)((g.rc_7.radio_in - 1500) / 100));
    	hal.uartC->write(packet, 6);
    } else {
    	hal.uartC->write(packet, 6);
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
