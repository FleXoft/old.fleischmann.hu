;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; File Name    : tweak.asm
; Purpose      : tweak Application 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;DO NOT MODIFY THE FOLLOWING SUBROUTINE DEFINITION;;;;;;;;;;;;;;;;;

        IF @DEF('SUBROUTINE')
            UNDEF SUBROUTINE
        ENDIF
        DEFINE SUBROUTINE "'tweak'"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	ld	A, [COREPTZIndex]
	ld	IY, #localtimebuffer
        KTOD_COPY_TIME_MIN_TO_DOW_FROM_RESOURCE

	ld	A, [dow]

test0:	cp	A, #00
	jr	NZ, test1
        ld	IX, #00
	ld	L, #SEG_S
	LCD_DISP_SEG_CHAR

        ld	IX, #02
	ld	L, #SEG_U
        LCD_DISP_SEG_CHAR

        jr  exit
            
test1:  cp	A, #01
        jr	NZ, test2
        ld	IX, #00
	ld	L, #SEG_M
        LCD_DISP_SEG_CHAR

        ld	IX, #02
	ld	L, #SEG_O
        LCD_DISP_SEG_CHAR

        jr  exit
        
test2:  cp	A, #02
        jr	NZ, test3
        ld	IX, #00
	ld	L, #SEG_T
        LCD_DISP_SEG_CHAR

        ld	IX, #02
	ld	L, #SEG_U
        LCD_DISP_SEG_CHAR

        jr  exit
        
test3:  cp	A, #03
        jr	NZ, test4
        ld	IX, #00
	ld	L, #SEG_W
        LCD_DISP_SEG_CHAR

        ld IX, #02
	ld L, #SEG_E
        LCD_DISP_SEG_CHAR
        
	jr  exit
        
test4:  cp	A, #04
        jr	NZ, test5
        ld	IX, #00
	ld	L, #SEG_T
        LCD_DISP_SEG_CHAR

        ld IX, #02
	ld L, #SEG_H
        LCD_DISP_SEG_CHAR
        
	jr  exit
        
test5:  cp	A, #05
        jr	NZ, test6
        ld 	IX, #00
	ld	L, #SEG_F
        LCD_DISP_SEG_CHAR

        ld	IX, #02
   	ld	L, #SEG_R
        LCD_DISP_SEG_CHAR

        jr  exit
        
test6:  cp	A, #06
        jr	NZ, exit
        ld	IX, #00
	ld	L, #SEG_S
	LCD_DISP_SEG_CHAR

        ld IX, #02
	ld L, #SEG_A
        LCD_DISP_SEG_CHAR
        
	jr  exit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DATA AREA ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

localtimebuffer:
	db 00 ;minute
        db 00 ;hour
        db 00 ;date
        db 00 ;month
        db 00 ;year lo
        db 00 ;year hi
dow:	db 00 ;dow
        
exit:
	;F
	ld	A, #31
	ld	B, #1
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #31
	ld	B, #2
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #31
	ld	B, #3
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #31
	ld	B, #4
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #31
	ld	B, #5
	LCD_DISPLAY_MAIN_DM_PIXEL
	;
	ld	A, #32
	ld	B, #1
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #32
	ld	B, #3
	LCD_DISPLAY_MAIN_DM_PIXEL

	;L
	ld	A, #34
	ld	B, #1
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #34
	ld	B, #2
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #34
	ld	B, #3
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #34
	ld	B, #4
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #34
	ld	B, #5
	LCD_DISPLAY_MAIN_DM_PIXEL
	;
	ld	A, #35
	ld	B, #5
	LCD_DISPLAY_MAIN_DM_PIXEL

	;E

	ld	A, #37
	ld	B, #1
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #37
	ld	B, #2
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #37
	ld	B, #3
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #37
	ld	B, #4
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #37
	ld	B, #5
	LCD_DISPLAY_MAIN_DM_PIXEL
	;
	ld	A, #38
	ld	B, #1
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #38
	ld	B, #3
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #38
	ld	B, #5
	LCD_DISPLAY_MAIN_DM_PIXEL

	;x
	ld	A, #40
	ld	B, #1
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #40
	ld	B, #2
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #40
	ld	B, #4
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #40
	ld	B, #5
	LCD_DISPLAY_MAIN_DM_PIXEL
	;
	ld	A, #41
	ld	B, #3
	LCD_DISPLAY_MAIN_DM_PIXEL
	;
	ld	A, #42
	ld	B, #1
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #42
	ld	B, #2
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #42
	ld	B, #4
	LCD_DISPLAY_MAIN_DM_PIXEL
	ld	A, #42
	ld	B, #5
	LCD_DISPLAY_MAIN_DM_PIXEL
	
;# BATTERY CHECK based on Philip Hamer's sourcecode
;# ================================================
 
	; Turn on 1/4 HZ sampling
	ld            HL, #SVDReg
	and           [HL], #~bSVDON
	or            [HL], #bSVDSP
	; We need to wait 16 clock cycles for reading of battery power
	; 1 bus cycle = 2 clock cycles
	; nop = 2 bus cycles = 4 clock cycles
	nop
	nop
	nop
	nop
	; Mask out top 4 bits to get voltage level
	ld            A, [HL]
	and           A, #(bSVD0|bSVD1|bSVD2|bSVD3)
	; Turn off 1/4 HZ sampling
	and           [HL], #~bSVDSP
 
	; Check voltage
	;cp            A, #HW_SVD_LEVEL_1p83_VOLTS
	;jr            Z, bat1p83
 
	;cp            A, #HW_SVD_LEVEL_2p00_VOLTS
	;jr            Z, bat2p00
	 
	;cp            A, #HW_SVD_LEVEL_2p17_VOLTS
	;jr            Z, bat2p17
 
	cp            A, #HW_SVD_LEVEL_2p33_VOLTS
	jr            Z, bat2p33
 
	cp            A, #HW_SVD_LEVEL_2p50_VOLTS
	jr            Z, bat2p50
 
	cp            A, #HW_SVD_LEVEL_2p67_VOLTS
	jr            Z, bat2p67
 
	cp            A, #HW_SVD_LEVEL_2p83_VOLTS
	jr            Z, bat2p83
 
	cp            A, #HW_SVD_LEVEL_3p00_VOLTS
	jr            Z, bat3p00
 
	;cp            A, #HW_SVD_LEVEL_3p17_VOLTS
	;jr            Z, bat3p17
 
	;cp            A, #HW_SVD_LEVEL_3p33_VOLTS
	;jr            Z, bat3p33
 
	;cp            A, #HW_SVD_LEVEL_3p50_VOLTS
	;jr            Z, bat3p50
 
	;cp            A, #HW_SVD_LEVEL_3p67_VOLTS
	;jr            Z, bat3p67
 
	;cp            A, #HW_SVD_LEVEL_3p83_VOLTS
	;jr            Z, bat3p83
 
	;cp            A, #HW_SVD_LEVEL_4p00_VOLTS
	;jr            Z, bat4p00
 
	;cp            A, #HW_SVD_LEVEL_4p17_VOLTS
	;jr            Z, bat4p17
 
bat3p00:
	ld	A, #42
	ld	B, #7
	LCD_DISPLAY_MAIN_DM_PIXEL
 
bat2p83:
	ld	A, #42
	ld	B, #8
	LCD_DISPLAY_MAIN_DM_PIXEL
 
bat2p67:
	ld	A, #42
	ld	B, #9
	LCD_DISPLAY_MAIN_DM_PIXEL
 
bat2p50:
	ld	A, #42
	ld	B, #10
	LCD_DISPLAY_MAIN_DM_PIXEL
 
bat2p33:
	ld	A, #42
	ld	B, #11
	LCD_DISPLAY_MAIN_DM_PIXEL

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; All periodic task must exit through this section.
; The periodic task builder will insert code to complete task.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;