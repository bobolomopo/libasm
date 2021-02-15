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
    PUSH rbx
    PUSH rcx