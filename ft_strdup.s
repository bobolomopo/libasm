%ifdef __LINUX__
    %define FT_STRDUP ft_strdup
    %define FT_STRLEN ft_strlen
    %define FT_STRCPY ft_strcpy
    %define MALLOC malloc
%else
    %define FT_STRDUP _ft_strdup
    %define FT_STRLEN _ft_strlen
    %define FT_STRCPY _ft_strcpy
    %define MALLOC _malloc
%endif

; prototype : char *ft_strdup(const char *s);
; defining global name depending OS

segment .text
    global FT_STRDUP
    extern FT_STRLEN
    extern FT_STRCPY
    extern MALLOC

FT_STRDUP:
    PUSH rdi                    ; saving rdi so we can overwrite it to malloc
    CALL FT_STRLEN              ; strlen to know the size to malloc
    INC  rax                    ; increment rax to have the space for the '\0'
    MOV  rdi, rax               ; the size to malloc
    CALL MALLOC wrt ..plt       ; call malloc, wrt..pl avoids overflow in R_X86_64_PC32 relocation
    CMP  rax, 0                 ; if malloc failed, error
    JE   EXIT
    POP  rsi                    ; remembering the original value of rdi and putting it in rsi to call strcpy
    MOV  rdi, rax               ; rdi is the empty string malloc
    CALL FT_STRCPY              ; copy rsi (original rdi) in rdi
    RET                   
EXIT:
    POP rdi                     ; rdi retake its original value
    RET