; ========[ README ]====================================================
; 19.02.2024 \ ***** \ KIT-23V \ 
; Task 28 - "Управление игрой червя с помощью виртуальной клавиатуры"
; Control the Snake from Virtual KeyPad:
; 2 - up
; 4 - left
; 6 - right
; 8 - down
; Enter - close the game
; Other's keys 0 - stop the snake 
;
; P.S: if you need, you can define snake step, in [07] memory cell
; ======================================================================

jmp init

db 10 		; Hardware Timer Int. Vector
db 00 		; Keyboard Int. Vector (not used)
db 30 		; Keypad Int. Vector
db FF 		; Variable for Snake Direction ( 2,4,6,8 . Default "FF" - for reset )
db 02 		; Variable for Snake Step ( 00..0F , Default - 2 )
db 00 		; Flag for "End of Game" ( 00 - Start ; 01..FF - End )

;========================================================================
;========================================================================
;======================== Hardware Timer ================================
org 10 			
	nop
	iret
;========================================================================
;========================================================================
;======================== Entry Point and Idle loop =====================
init:
	clo
	STI
	out 08

start:
	mov al,[05]	; Read the snake direction and snake step from variable
	out 04
	mov al,[07]	
	cmp al,00	; Close the snake app ?
	jz start

	clo
	halt
;========================================================================
;========================================================================
;======================== Key Pad Handler ===============================
org 30
	CLI
	pushf
	push al
	push bl

	in 08	
	call 60

	mov bl,[06] 	; Read the Snake Step Variable
	or al,bl 	; Snake Direction + Snake Step
	mov [05],al

	pop bl
	pop al
	popf
	STI
	iret
;========================================================================
;========================================================================
;======================== Procedure for set Snake Direction =============

org 60 
	cmp al,32 	; it's "2" key ?
	jz KeyUp
	cmp al,34 	; it's "4" key ?
	jz KeyLeft
	cmp al,38 	; it's "8" key ?
	jz KeyDown
	cmp al,36 	; it's "6" key ?
	jz KeyRight
	cmp al,0D 	; it's "Enter" key ?
	jz KeyEnter

	mov al,0 	; else put the "Stop" Direction ;
	ret

KeyUp:
	mov al,80
	ret
KeyLeft:
	mov al,20
	ret
KeyDown:
	mov al,40
	ret
KeyRight:
	mov al,10
	ret
KeyEnter:
	mov al,DE
	mov [07],al       ; Put the flag to Close Game
	ret
;========================================================================

end