%ifdef __LINUX__
    %define M_FT_STRLEN ft_strlen
%else
    %define M_FT_STRLEN _ft_strlen
%endif

; defining global name depending OS

segment .text
    global M_FT_STRLEN

M_FT_STRLEN:
    mov eax, -1                     ; debute le compte a -1 vu qu'on commence par un increment
FT_STRLEN_LOOP:
    inc eax                         ; incremente le compte
    cmp BYTE [rdi + rax], 0         ; compare si on est arrive a '\0'
    jne FT_STRLEN_LOOP              ; si la comparaison n'est pas egale on relance la boucle
    ret                             ; fin de procedure