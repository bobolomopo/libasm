%ifdef __LINUX__
    %define M_FT_STRCPY ft_strcpy
%else
    %define M_FT_STRCPY _ft_strcpy
%endif

; prototype : char *strcpy(char *dest, const char *src)
; defining global name depending OS

segment .text
    global M_FT_STRCPY

M_FT_STRCPY:
    MOV  rax, rdi                   ; rax devient la destination
    MOV  rbx, rsi                   ; rbx devient la source
    MOV  rcx, -1                    ; on commence le compte à -1 vu qu'on débute par une incrémentation
FT_STRCPY_LOOP:
    INC  rcx        				; incrementation
    MOV  dl, byte [rbx + rcx]		; on copie le byte en cours dans dl (plus petit registre 1 octet)
    MOV  byte [rax + rcx], dl		; on copie le byte dans la destination (intermédiaire car les deux ne peuvent pas être adresse mémoire avec MOV)
    CMP  byte [rbx + rcx], 0		; on check si on est à la fin de la source
    JNE  FT_STRCPY_LOOP				; tant que on est pas a la fin, on continue de copier
    RET								; on retourne rax