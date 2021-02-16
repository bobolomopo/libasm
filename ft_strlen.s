%ifdef __LINUX__
    %define M_FT_STRLEN ft_strlen
%else
    %define M_FT_STRLEN _ft_strlen
%endif

; prototype : size_t strlen(const char *s);
; defining global name depending OS

segment .text
    global M_FT_STRLEN

M_FT_STRLEN:
    MOV rax, -1                     ; debute le compte a -1 vu qu'on commence par un increment
FT_STRLEN_LOOP:
    INC rax                         ; incremente le compte
    CMP BYTE [rdi + rax], 0         ; compare si on est arrive a '\0'
    JNE FT_STRLEN_LOOP              ; si la comparaison n'est pas egale on relance la boucle
    RET                             ; fin de procedure