;Autores: Cassio Almeida, Francisco da Paz, Wesley Oliveira
;
;Escreva um programa para ler um dígito hexadecimal de A a F (maiúsculo) e
;exibi-lo em decimal na próxima linha. Utilize mensagens convenientes.

org 100h
   
;exibe string 'Entre um digito hexadecimal:'
mov ah,9h        
lea dx,m1      
int 21h         

;ler caracter do teclado
mov ah, 1h
int 21h
mov bl,al  

; exibe resultado na tela 
mov ah,9        
lea dx,m3      
int 21h


;subtrai valor do caracter em ascii e chama procedimento para exibir valor em decimal
mov al,bl  
sub al,55d
call print_al: 


; termino do programa
mov ah, 0 
int 16h

mov ax, 0x4c00
int 21h 
               
; procedimentos que fazerm conversoes para decimal    
print_al proc
cmp al, 0
jne print_al_r
    push ax
    mov al, '0'
    mov ah, 0eh
    int 10h
    pop ax
    ret 
print_al_r:    
    pusha
    mov ah, 0
    cmp ax, 0
    je pn_done
    mov dl, 10
    div dl    
    call print_al_r
    mov al, ah
    add al, 30h
    mov ah, 0eh
    int 10h    
    jmp pn_done
pn_done:
    popa  
    ret  
                 
  m1 db 'Entre um digito hexadecimal(de A a F): $'  
  m3 db 0dh, 0ah, 'O seu valor decimal vale: $'  
ret




