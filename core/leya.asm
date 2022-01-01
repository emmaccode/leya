
;         .-.
;        ((`-)
;         \\     (\/)
;          \\     \/
;   .="""=._))
;  /  .,   .'
; /__(,_.-'
;`    /|
;    /_|__
;      | `))
;      |
;     -"==
;		 __    ____
;		(  )  ( ___)=========================|
;		 )(__  )__)      Version 0.0.1       |
;		(____)(____)  NO Copyright (C) 2021  |
;		 _  _   __|==========================|
;		( \/ ) /__\  Programmed By           |
;		 \  / /(__)\        Emmy Boudreau    |
;		 (__)(__)(__)========================|
;    The Leya project is open-source,    |
;    MIT-licensed software. This         |
;    compiler may be duplicated or       |
;    modified for personal AND           |
;    professional use, my only request   |
;    Is that my name remain here, in this|
;             REPL and code. Thanks.     |
;========================================|
; This is the core file of leya, it holds the leya interpreter
; and loads the do, sub, and alias tables.

; ____    __   ____   __
;(  _ \  /__\ (_  _) /__\
; )(_) )/(__)\  )(  /(__)\
;(____/(__)(__)(__)(__)(__)
section .data
; prompt
  repl_prompt db "< leya >", 10

  ; Basic necessary bytes/collections
  ; operators
  logical_open db "["
  logical_close db "]"
  collection db "..."
  collection_noc db "...|"
  ; Registered calls
  _sub db "sub"
  _in db "in"


  ; prompt_head:
  head_prnt1 db " __    ____", 10, "(  )  ( ___)=========================|", 10
  head_prnt2 db " )(__  )__)      Version 0.0.0.3     |", 10
  head_prnt3 db "(____)(____)  Copyright (C) 2021     |", 10
  head_prnt4 db " _  _   __|==========================|", 10
  head_prnt5 db "( \/ ) /__\  Programmed By           |", 10
  head_prnt6 db " \  / /(__)\        Emmy   Boudreau  |", 10
  head_prnt7 db " (__)(__)(__)========================|", 10

section .bss
  uname resb 20
  lya resb 30
section .text
  global _start


;  ___  ____   __    ____  ____
; / __)(_  _) /__\  (  _ \(_  _)
; \__ \  )(  /(__)\  )   /  )(
; (___/ (__)(__)(__)(_)\_) (__)
; ===============|
; _start
; main function, checks if argument provided.
; If no argument is provided, jumps to _start_repl.
; passable args:
;v======+======+======+===================================================v
;| arg1 | arg2 | arg3 |    does:                                          |
;+======+======+======+===================================================+
;+------+------+------+--Basic CLI's--------------------------------------+
;| -v   |      |      | Prints out version information.                   |
;|-help |      |      | Prints out argument information for CLIs.         |
;+------+------+------+--Compiling--------------------------------------+
;| -o   | uri1 | uri2 | Compiles file-input. arg2 is the file we want     |
;|      |      |      | to compile, arg2 is the output filename.          |
;| uri  |      |      | Runs file at uri inside of REPL.                  |
;L------+------+------+--------------------------------------------------w
; ===============|
_start:
  ; Parse CLI's, no CLI's we start_repl
  jmp _start_repl

; _START_REPL
; Allocates data for REPL, calls _repl_printout:, followed by _repl. On ret
; from repl, will ret to _start. Start will then call syscall 60 (exit).
; ===============|
_start_repl:
  call _repl_printout
  jmp _repl
; ===============|
; _REPL_PRINTOUT
; Prints leya header, returns to _start_repl:.
; ===============|
_repl_printout:
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt1
  mov rdx, 51
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt2
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt3
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt4
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt5
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt6
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt7
  mov rdx, 39
  syscall
  ; ===============|
  ; _PROMPT
  ; Prints prompt, returns to _repl
  ; ===============|
_prompt:
  mov rax, 1
  mov rdi, 1
  mov rsi, repl_prompt
  mov rdx, 9
  syscall
  ret
  ; ===============|
  ; _REPL
  ; Prints prompt by calling _show_prompt:
  ;, takes input, calls _parse:, on ret, checks for change in
  ; exit flag. If the exit flag has not been changed, then jumps to itself.
  ; ===============|
_repl:
; Read
  call _prompt
  call _stdin
  ; Evaluate
;  call _interpret
    ; Print
  call _stdout
  ;     Loop
  jmp _repl
;   (
;   )\        (      (
;  (((_)   (   )(    ))\
;  )\___   )\ (()\  /((_)
;((/ __| ((_) ((_)(_))
; | (__ / _ \| '_|/ -_)
; \___|\___/|_|  \___|

; I/O
_stdin:
  mov rax, 0
  mov rdi, 0
  mov rsi, rbx
  mov rdx, 30000
  syscall
  mov rax, rbx
  ret

_stdout:
  push rax
  call _outloop

_outloop:
  inc rax
  inc rcx
  mov cl, [rax]
  cmp cl, 0
  jne _outloop

  mov rax, 1
  mov rdi, 1
  pop rsi
  mov rdx, rbx
  syscall
  ret

  ; Errors

_error:
  call stdout
  ;  ____  _  _  ____  ____  ____  ____  ____  ____  ____  ____  ____
  ; (_  _)( \( )(_  _)( ___)(  _ \(  _ \(  _ \( ___)(_  _)( ___)(  _ \
  ;  _)(_  )  (   )(   )__)  )   / )___/ )   / )__)   )(   )__)  )   /
  ; (____)(_)\_) (__) (____)(_)\_)(__)  (_)\_)(____) (__) (____)(_)\_)

  ; ===============|
  ; _PARSE
  ; Parses array of input code, fills registry and data, then returns to
  ; either _REPL or _RUN
  ; ===============|
  _parse:

    ; ===============|
    ; _INTERPRET
    ; defines arrays out of the data with starts and stops.
    ; Calls parsing algorithm
    ; compiles, executes associated lya code
    ; ===============|
  _interpret:
  ret


  _compile:

  _execute:
