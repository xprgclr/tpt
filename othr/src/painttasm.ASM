CSEG segment
assume cs:CSEG, ds:CSEG, ss:CSEG, es:CSEG
org 100h

Begin:

        call    Gmode
        mov     ax,0B800h
        mov     es,ax
        mov     di,1000d
        mov     si,offset titl
        call    MyProc
        mov     di,1330d
        mov     ah,00000111b
        mov     si,offset mess
l2:     mov     cx,28
l:      lodsb
        cmp     al,'$'
        je      Exte
        stosw
        loop    l
        add     di,104d
        jmp     l2
exte:   mov     di,3280d
        mov     si,offset wkey
        call    MyProc
        mov     ah,01h
        mov     cx,200Eh
        int     10h

        mov     ah,10h
        int     16h

        mov     Symb,'*'
        mov     Colr,00000111b
        call    Gmode

        mov     ax,0500h
        int     10h

        mov     ah,02
        xor     bh,bh
        mov     dh,10d
        mov     dl,10d
        int     10h

; Go Go Go
Looper:
        mov     ah,03
        xor     bh,bh               ;Get Cursor
        int     10h

        mov     ah,10h
        int     16h

        cmp     ah,48h
        je      Up
        cmp     ah,50h
        je      Down
        cmp     ah,4Bh
        je      Left
        cmp     ah,4Dh
        je      Right
        cmp     ah,3Bh
        je      Red
        cmp     ah,3Ch
        je      Blue
        cmp     ah,3Dh
        je      Green
        cmp     ah,3Eh
        je      White
        cmp     ah,3Fh
        je      Hide
        cmp     ah,40h
        je      ClrScr
        cmp     al,1Bh
        je      Exit
        mov     symb,al
        jmp     Pnt

Up:     cmp     dh,1
        je      looper
        dec     dh
        jmp     Pnt
Down:   cmp     dh,23
        je      looper
        inc     dh
        jmp     Pnt
Left:   cmp     dl,1
        je      looper
        dec     dl
        jmp     Pnt
Right:  cmp     dl,78
        je      looper
        inc     dl
        jmp     Pnt
Red:    mov     Colr,00000100b
        jmp     Pnt
Blue:   mov     Colr,00000001b
        jmp     Pnt
Green:  mov     Colr,00000010b
        jmp     Pnt
White:  mov     Colr,00001111b
        jmp     Pnt
Hide:   call    Hcur
        jmp     Pnt
ClrScr: call    Gmode
        jmp     Pnt
Exit:   ret
Pnt:
        mov  ah,02h
        xor  bh,bh
        int  10h

        mov  ah,09h
        mov  al,Symb
        mov  bl,Colr
        xor  bh,bh
        mov  cx,1
        int  10h
        jmp  looper

Gmode   proc

        push    ax
        push    bx
        push    cx
        push    es
        push    di

        mov     ax,3h
        int     10h

        push    0B800h
        pop     es
        xor     di,di
        mov     ah,00000110b
        mov     al,35
        mov     cx,2
K:      push    cx
Lav:    mov     cx,80d
        rep     stosw
        pop     cx
        mov     di,3840
        loop    k
        mov     cx,2
        mov     di,160
huy:    push    cx
        mov     cx,23
lala:   mov     es:[di],ax
        add     di,160d
        loop    lala
        mov     di,318
        pop     cx
        loop    huy

        pop     di
        pop     es
        pop     cx
        pop     bx
        pop     ax
        ret
Gmode   endp

Hcur    proc
        cmp  TstC,0
        je  Clear
        mov  ch,0Dh
        mov  TstC,0
        jmp  Fin
Clear:  mov  ch,20h
        mov  TstC,1
Fin:
        mov  ah,01h
        mov  cl,0Eh
        int  10h
        ret
Hcur    endp

MyProc  proc
go:     lodsb
        cmp     al,'$'
        jz      Exit_p
        cmp     di,1000
        jnz     C1
        mov     ah,00001001b
C1:     cmp     di,1032
        jnz     C2
        mov     ah,00001100b
C2:     cmp     di,1056
        jnz     Cv
        mov     ah,00001010b
Cv:
        stosw
        jmp     go
Exit_p:
        ret
MyProc  endp


Colr    db      ?
Symb    db      ?
TstC    db      ?
titl    db      'C o n t r o l   C o l o r   P o i n t$'
;                1234567890123456789012345678
mess    db      'Any Key: Choice output symb '
        db      'F1: Red Color               '
        db      'F2: Blue Color              '
        db      'F3: Green Color             '
        db      'F4: White Color             '
        db      'F5: Show/Hide Cursor        '
        db      'F6: Clear Screen            '
        db      'Esc: Exit                  $'
wkey    db      'Press any key to continue..$'


CSEG ends
end Begin