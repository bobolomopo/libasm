%ifdef __LINUX__
    %define FT_STRLEN ft_strlen
%else
    %define FT_STRLEN _ft_strlen
%endif

; prototype : size_t ft_strlen(const char *s);
; defining global name depending OS

segment .text
    global FT_STRLEN

FT_STRLEN:
    MOV rax, -1                     ; we begin the count to -1, because we begin the loop with an addition
FT_STRLEN_LOOP:
    INC rax                         ; increment
    CMP BYTE [rdi + rax], 0         ; are we at the end?
    JNE FT_STRLEN_LOOP              ; if not, keep going
    RET                             ; end of procedure