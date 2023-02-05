PROCESSOR   18F57Q43
#include    <xc.inc>
    
PSECT resetVec, class=CODE, reloc=2
PSECT absdata, abs, ovrld
 
absdata:    org	    0x1000
resetVec:   goto    main

PSECT code
main:
    ; To configure the CPU clock to 1 MHz using the HFINTOSC, we can assign 
    ; NOSC/COSC = b110 to select HFINTOSC as the clock source,
    ; FRQ = b10 to give HFINTOSC 4 MHz of frequency, and 
    ; NDIV/CDIV = b10 to divide the frequency by 4
    
    BANKSEL OSCCON1	    ; select bank where OSCCON1 belongs to
    movlw   0x62	    ; move value 0x62 to WREG
    movwf   OSCCON1, 1	    ; move WREG to OSCCON1
    movlw   0x02	    ; move value 0x02 to WREG
    movwf   OSCFRQ, 1	    ; move WREG to OSCFRQ   
END