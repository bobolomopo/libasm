%ifdef __LINUX__
    %define FT_WRITE ft_write
    %define ERRNO_LOCATION __errno_location
    %define SYSCALL_WRITE 0x1
%else
    %define FT_WRITE _ft_write
    %define ERRNO_LOCATION ___error
    %define SYSCALL_WRITE 0x2000004
%endif

; prototype : ssize_t write(int fd, const void *buf, size_t count);
; defining global name depending OS, errno location and the syscall for write

segment .text
    extern ERRNO_LOCATION
    global FT_WRITE

FT_WRITE:
    MOV rax, SYSCALL_WRITE              ; equalize rax to write syscall
    SYSCALL                             ; syscall which is going to write rsi with a length of rdx, in rdi
    CMP rax, 0                          ; checking if everything went fine
    %ifdef __LINUX__
        JL  FT_WRITE_ERROR
    %else
        JC  FT_WRITE_ERROR              ; if rax is less than 0, an error is returned
    %endif
    RET
FT_WRITE_ERROR:
%ifdef __LINUX__
    neg  rax                            ; error returned is positive and has to be negative
%endif
    PUSH rax                            ; rax is placed on top of the pile
    CALL ERRNO_LOCATION wrt ..plt       ; error call, wrt..pl avoids overflow in R_X86_64_PC32 relocation
    POP  qword [rax]
    MOV  rax, -1                        ; returned value has to be -1 if there is an error
    RET
    
