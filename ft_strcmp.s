%ifdef __LINUX__
    %define FT_STRCMP ft_strcmp
%else
    %define FT_STRCMP _ft_strcmp
%endif

; prototype : int strcmp(const char *s1, const char *s2);
; defining global name depending OS

segment .text
    global FT_STRCMP

FT_STRCMP:
    MOV rcx, -1                     ; we begin the count to -1, because we begin the loop with an addition
FT_STRCMP_LOOP:
    INC rcx                         ; increments
    MOV al, BYTE [rdi + rcx]        ; keep rdi current byte value
    CMP al, BYTE [rsi + rcx]        ; compare it to rsi current byte value
    JNE FT_STRCMP_INEG              ; if not equal, jump to the verification of which one is smaller
    CMP BYTE [rdi + rcx], 0         ; is it the end?
    JNE FT_STRCMP_LOOP              ; if not, keep going
    JMP EXIT                        ; end and return 0
FT_STRCMP_INEG:
    CMP al, BYTE [rsi + rcx]        ; subrstraction between the two chars
    %ifdef __LINUX__
        JL  FT_STRCMP_SMALLER
    %else
        JC  FT_STRCMP_SMALLER       ; if rsi is smaller, return -1
    %endif                  
    MOV rax, 1                      ; else return 1
    RET
FT_STRCMP_SMALLER:
    MOV rax, -1                     ; -1 returned
    RET
EXIT:
    RET