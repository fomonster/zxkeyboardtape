;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Busy soft ;; 26.11.2018 ;; Tape generating library usage example    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	org	#9000
start
	CALL MAKEFONT
loop1:	
	LD	HL, MESSAGE
	CALL PRINT
	ld bc, 1000
loop
	push bc
	; Получаем данные от PIC	
	LD	HL, DATA
	CALL RECEIVE
	; Выводим на экран
	LD	HL, DATA
	CALL PRINT
	pop bc
	dec bc
	ld a, b
	or c
	jr z, loop1
	; Повторяем бесконечно
 	JR loop
	RET

DATA EQU #C000
SYSFONT	EQU	23606 ; System font address

FONT DEFW #8000

FONT1 DEFW #8400

MESSAGE:
	DEFB 22, 0, 1, "Waiting PIC...", 0
; Такой блок данных приходит от PIC
;TXT	
;	DEFB 18, 001000b 				; 18 - установка цвета бордюра
;	DEFB 22, 0, 0 					; 22 - координаты курсора в 0, 0
;	DEFB 21, 32, 24, 000001111b 	; 21 - закраска прямоугольника цветом
;	DEFB 20, 32, 24 				; 20 - очистка области пикселей 
;	DEFB 22, 3, 4, 21, 14, 10, 000011111b	
;	DEFB 19, 14, 10 				; 19 - нарисовать рамку окна в области
;	DEFB 22, 4, 5, "Hello Test", 22, 1, 1, "Top", 22, 31, 21, "E", 0

;--------------------------------------------------------------------------  
; HL-начало строки.
; В строке: 22-новая координата печати, потом два байта-сами ко-
; рдинаты: 1'ый - X, 2'ой Y, 0 - конец строки
;--------------------------------------------------------------------------

PRINT:
; сохранение всех регистров
	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
PRINT_0:
	LD	A, (HL)		
; 0 - конец обработки строки
	CP	0
	JR	Z, PRINT_EXIT	
; Символ
	CP 32			
	JR	NC, PRINT_CHAR
; Установки новой координате: D-x, E-y.
	CP	22
	JR	NZ, PRINT_1
	INC	HL
	LD	BC,(HL)
	INC	HL
	PUSH HL
	CALL GetScreenAddr
	LD	(COOR),HL
	CALL GetAttrAddr
	LD	(COORATTR),HL
	POP HL
	JR PRINT_NEXT
PRINT_1:	
; Прямоугольник цветом 
	CP	21			
	JR	NZ, PRINT_2
	INC	HL
	LD	BC,(HL)
	INC	HL
	INC HL
	LD A, (HL)
	PUSH HL
	CALL DrawColorRect
	POP HL
	
	JR PRINT_NEXT
PRINT_2:
	CP 20
	JR NZ, PRINT_3
	INC	HL
	LD	BC,(HL)
	INC	HL
	PUSH HL
	CALL DrawWindowRect
	POP HL
	JR PRINT_NEXT
PRINT_3:
; Установка цвета бордюра
	CP 19			
	JR	NZ, PRINT_4
	INC	HL
	LD	BC,(HL)
	INC	HL
	PUSH HL
	CALL DrawWindowFrame
	POP HL
	JR PRINT_NEXT
PRINT_4:
	CP 18			
	JR	NZ, PRINT_5
	INC HL
	LD A, (HL)
	CALL SetBorderColor
	JR PRINT_NEXT
PRINT_5:
PRINT_NEXT:
	INC	HL		;увеличение и переход к новому символу.
	JR	PRINT_0	
PRINT_EXIT:
; востановление регистров и возврат.
	POP	HL		
	POP	DE		
	POP	BC		
	POP	AF
	RET

;--------------------------------------------------------------------------
; Печать символа 
;--------------------------------------------------------------------------
PRINT_CHAR:
	PUSH HL
	LD	L,A			; HL адрес символа в шрифте
	LD	H,#00		
	ADD	HL,HL		
	ADD	HL,HL		
	ADD	HL,HL		
	LD	DE,(FONT)		
	ADD	HL,DE		
	LD	DE,(COOR)	; DE адрес на экране
; Байты символа
	LD	B, 8
LOOP:
	LD	A,(HL)
	LD	(DE),A
	INC	HL
	INC	D
	DJNZ	LOOP
; Переход на следующий адрес
	LD	DE,(COOR)	;загрузка в DE адреса знакоместа
	INC	DE		;увеличить адрес знакоместа.
	LD	A,D
	CP	#41		;║проверка на переход через гра-
	JR	Z,PR_L1		;║ницу 1'ого и 2'ого сегмента
	CP	#49		;║
	JR	Z,PR_L2		;║
	LD	(COOR),DE	;запоминания адреса знакоместа
	JR	PR_L0
PR_L1	LD	DE,#4800	;║коррекция адресов
	LD	(COOR),DE	;║
	JR	PR_L0		;║
PR_L2	LD	DE,#5000	;║
	LD	(COOR),DE	;║
;--------
PR_L0		
	POP HL	
	JR PRINT_NEXT		
;--------
COOR	DEFW	#4000		; текущий адрес вывода
COORATTR	DEFW #4000 + #1800

;----------------
; in coords: B - Y 0..23, C - X 0..31
; out addr: HL
GetScreenAddr:
	ld a,b
	and a, $18
	or a, $40
	ld h,a
	ld a,b
	and a, $07
	rrca
	rrca
	rrca
	add a,c
	ld l,a
    ret

;----------------
; in coords: B - Y 0..23, C - X 0..31
; out addr: HL
GetAttrAddr:
	ld a, b
	sla a
	sla a
	sla a
	ld l, a
	ld h, 22  
	add hl, hl
	add hl, hl
	ld a, l
	or a, c
	ld l, a
	ret

;----------------
; in size B - Y size, C - X size, A - color 
DrawColorRect:
	ld (coloraddr+1),a
	ld hl,(COORATTR)
	ld de, 32
	ld a, 32
	sub c
	ld e, a
	xor d,d
DrawColorRect1:
	push bc
DrawColorRect2
coloraddr:
	ld (hl), 255
	inc hl
	dec c
	jr nz, DrawColorRect2
	add hl, de
	pop bc
	dec b
	jr nz, DrawColorRect1
	ret

;----------------
; in size B - Y size, C - X size, A - color 
DrawWindowRect:
	ld hl,(COOR)
	ld de, 32
	ld a, 32
	sub c
	ld e, a
	xor d,d
DrawWindowRect1:
	push bc
	push hl
DrawWindowRect2
	ld e, 8
	ld a, 0
DrawWindowRect3:
	ld (hl), a
	inc h
	dec e
	jr nz, DrawWindowRect3
	ld a, h      
    and 7       
    jr nz, IncScreenAddrA    
    ; inc 
	ld a, l      
    add a,32    
    ld l, a     
    jr c,IncScreenAddrA  
    ld a, h      
    sub 8      
    ld h, a
IncScreenAddrA:
	dec b
	jr nz, DrawWindowRect2
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, DrawWindowRect1
	ret

;----------------
; in size B - Y size, C - X size, A - color 
DrawWindowFrame:
	ld hl,(COOR)
	push bc
; top horisontal line
	ld a, 255
DrawWindowFrameHorA1:
	ld (hl), a
	inc l
	dec c
	jr nz, DrawWindowFrameHorA1
	dec l

; right vertical line
	inc h
	ld e, 7
DrawWindowFrameVertA2:
	ld d, 00000011b
DrawWindowFrameVertA1:
	ld a, (hl)
	or a, d
	ld (hl), a
	inc h
	dec e
	jr nz, DrawWindowFrameVertA1
; inc
	ld a, h
    and 7       
    jr nz, IncScreenAddrVertA1
	ld a, l      
    add a,32
    ld l, a
    jr c,IncScreenAddrVertA1  
    ld a, h      
    sub 8      
    ld h, a
IncScreenAddrVertA1:
	ld e, 8
	dec b
	jr nz, DrawWindowFrameVertA2 
	pop bc

; left vertical line
	ld hl,(COOR)
	inc h
	ld e, 7
DrawWindowFrameVertB2:
	ld d, 11000000b
DrawWindowFrameVertB1:
	ld a, (hl)
	or a, d
	ld (hl), a
	inc h
	dec e
	jr nz, DrawWindowFrameVertB1
	dec b
	jr z, DrawWindowFrameVertB3
; inc
	ld a, h
    and 7       
    jr nz, IncScreenAddrVertB1
	ld a, l      
    add a,32
    ld l, a
    jr c,IncScreenAddrVertB1  
    ld a, h      
    sub 8      
    ld h, a
IncScreenAddrVertB1:
	ld e, 8
	jr DrawWindowFrameVertB2
DrawWindowFrameVertB3:
	dec h
; borrom horizantal line
	ld a, 255
DrawWindowFrameHorB1:
	ld (hl), a
	inc l
	dec c
	jr nz, DrawWindowFrameHorB1
	ret
	
;----------------
; 	
SetBorderColor:
    push af 
    rra
    rra
    rra
    and $07
    out     ($fe),a
    pop af
    ret

;-----------------
;
MAKEFONT:
	ld hl, (SYSFONT)
	ld de, (FONT)
	ld bc, 1024 ; 32*8=256 + 768 font size
MAKEFONTLOOP:
	ld a,(hl)
	rrca
	or (hl)
	ld (de),a
	inc hl
	inc de
	dec bc
	ld a, b
	or c
	jr nz, MAKEFONTLOOP 	
	ret

;-----------------
;	
RECEIVE:
	DI

	LD A, 100
	LD (RECEIVELEADDELAY+1), A		
	LD (RECEIVESTOPDELAY+1), A
	LD (RECEIVEDATADELAY+1), A

	LD E, 0 ; Счетчик несущей
	LD D, 4
RECEIVELEADLOOP: 
	
	

	;  ----    (лог 1)
	;     |              спад несущей
	;     |--  (лог 0)

; Считаем импульсы несущей
	LD BC, 0 				; 10
RECEIVELEADRIZE:
	INC BC				    ; 6
	LD A, #7F				; 7
	IN A, (#FE)				; 11
	AND 64                  ; 11
	JR Z, RECEIVELEADRIZE   ; 12/7

	LD A, B                 ; 4
	AND A                   ; 4
	JR NZ, RECEIVEERROR     ; 12
	 
RECEIVELEADDELAY:
	LD A, 255
	;CP 255					; 7
	;JR Z, CONTINUELEAD 		; 12/7
	CP C	 				; 4
	JR C, RECEIVEDATA		; 12/7
CONTINUELEAD:			

	;     ----  (лог 1)
    ;     |
    ;  ----     (лог 0) - подьем несущей

; Считаем импульсы несущей
	LD BC, 0 				; 10
RECEIVELEADFALL:
	INC BC					; 6
	LD A, #7F				; 7
	IN A, (#FE)				; 11
	AND 64					; 11
	JR NZ, RECEIVELEADFALL	; 12/7
							
	;  ----    (лог 1)
	;     |              спад несущей
	;     |--  (лог 0)

	LD A, B					; 4
	AND A					; 4
	JR NZ, RECEIVEERROR		; 12/7

	;INC E
	;LD A, E
	;CP D
	;JR NC, RECEIVELEADLOOP
	;LD E, D

	;LD A, C					; 4
	;SRL A
	;ADD A,C
	;ADD A,C
	;ADD A,C
	;LD A, 110				; работает норм
	;LD (RECEIVELEADDELAY+1), A		; 13

	JR RECEIVELEADLOOP		; 12
							
RECEIVEDATA:

	LD A, (RECEIVELEADDELAY+1)		
	LD (RECEIVESTOPDELAY+1), A
	;SRL A
	;SRL A
	LD A, 33
	LD (RECEIVEDATADELAY+1), A

	LD D, 1		;7
	LD E, D		;4

RECEIVEDATALOOP:


	;     ----  (лог 1)
    ;     |
    ;  ----     (лог 0) - подьем данных
	
	
	; Считаем импульсы данных
	LD BC, 0 				; 10

							; == 10 такта
RECEIVEDATARIZE2: 	
	INC BC					; 6
	LD A, #7F				; 7
	IN A, (#FE)				; 11
	AND 64                  ; 11
	JR NZ, RECEIVEDATARIZE2 ; 12/7
							; == 40 тактов

RECEIVEDATADELAY:
	LD A, 33				; 7 				; 4
	CP C; 25 - 50			; 7
	RL E					; 8
	JR NC, RECEIVEDATALOOP1	; 12/7

	LD (HL), E				; 7
	INC HL					; 6
	LD E, D					; 4

RECEIVEDATALOOP1:

	LD BC, 0 				; 10
RECEIVEDATAFALL2: 	
	INC BC					; 6
	LD A, #7F				; 7
	IN A, (#FE)				; 11
	AND 64					; 11
	JR Z, RECEIVEDATAFALL2	; 12/7						
							; == 40 тактов
	;     ----  (лог 1)
    ;     |
    ;  ----     (лог 0) - подьем данных


RECEIVESTOPDELAY:
	LD A, 150				; 4
	CP C					; 7
	JR NC, RECEIVEDATALOOP		; 12/7
RECEIVEERROR4:
	LD (HL), '4'
	INC HL
	LD (HL), 0
	EI
	RET
RECEIVEERROR:
	LD (HL), '0'
	INC HL
	LD (HL), 0
	EI
	RET   ; 10




;-----------------
;
length	=	$-start


	include	 TapLib.asm
	MakeTape ZXSPECTRUM48, "main.tap", "main", start, length, start
