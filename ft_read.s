%ifdef __LINUX__
    %define FT_READ ft_read
    %define ERRNO __errno_location
    %define SYSCALL_READ 0x0
%else
    %define FT_READ _ft_read
    %define ERRNO ___error
    %define SYSCALL_READ 0x2000003
%endif

; prototype : ssize_t ft_read(int fd, void *buf, size_t count);
; defining global name depending OS, errno location and the syscall for read

segment .text
    extern ERRNO
    global FT_READ

FT_READ:
    MOV rax, SYSCALL_READ               ; equalize rax to read syscall
    SYSCALL                             ; syscall which is going to read rdx bytes in rdi and stock what is read in rsi
    CMP rax, 0                          ; checking if everything went fine
    %ifdef __LINUX__
        JL  FT_READ_ERROR
    %else
        JC  FT_READ_ERROR               ; if rax is less than 0, an error is returned
    %endif
    RET
FT_READ_ERROR:
%ifdef __LINUX__
    neg  rax                            ; error returned is positive and has to be negative
%endif
    PUSH rax                            ; rax is placed on top of the pile
    CALL ERRNO wrt ..plt                ; error call, wrt..pl avoids overflow in R_X86_64_PC32 relocation
    POP  qword [rax]
    MOV  rax, -1                        ; returned value has to be -1 if there is an error
    RET