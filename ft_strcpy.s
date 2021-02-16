%ifdef __LINUX__
    %define FT_STRCPY ft_strcpy
%else
    %define FT_STRCPY _ft_strcpy
%endif

; prototype : char *strcpy(char *dest, const char *src)
; defining global name depending OS

segment .text
    global FT_STRCPY

FT_STRCPY:
    MOV  rax, rdi                   ; rax becomes the destination
    MOV  rbx, rsi                   ; rbx becomes the source
    MOV  rcx, -1                    ; we begin the count to -1, because we begin the loop with an addition
FT_STRCPY_LOOP:
    INC  rcx        				; incrementation
    MOV  dl, byte [rbx + rcx]		; copy the current byte in dl
    MOV  byte [rax + rcx], dl		; copy the current byte into the desitnation (we cant have to adresse when using MOV)
    CMP  byte [rbx + rcx], 0		; checking if its the end of the source
    JNE  FT_STRCPY_LOOP				; while we are not at the end, keep copying
    RET								; return rax