jmp start
db 50 ; interrupt vector
;-- Variables for state lights
db 48 ; Y Y lights
db 84 ; R G lights
db 48 ; Y Y lights
db 30 ; G R lights

db 03 ; Addres of current state

;-----------------
start:
	sti
	nop
	jmp start
	halt

;---------------
org 50
	cli
	pushf		; Save registers
	push cl
	push al

	mov cl,[07]	; [03]-[06] states. [07] - pointer to current state
	cmp cl,07	; Check it's was a last state ?
	jz  reset

show:
	mov al,[cl]
	out 01		; Show and change state.
	inc cl
	mov [07],cl


	pop al
	pop cl		; Restore registers and go back
	popf
	iret

reset:
	mov cl,03	; Put the pointer to [03] state.
	jmp show

end