starting_text: db "Bootloader is starting...", 0x0d, 0xa, 0
shutdown_text: db "Bootloader is shutdown...", 0x0d, 0xa, 0
help_text: db "it`s a small simple boot or SSB", 0
wrong_text: db "Wrong command!", 0
prompt: db  ">", 0
new_line: db 0x0d, 0xa, 0

help_command: db "help", 0


on_start:

	mov si, starting_text   
	call print 

	ret
always:

	mov ax,help_command
	call check_the_input

	cmp cx,1
	je equal_help

	jmp equal_to_nothing
	
	ret

equal_help:
    mov si, help_text
    call print

    jmp done

equal_to_nothing:
	mov si, wrong_text
	call print
    jmp done
