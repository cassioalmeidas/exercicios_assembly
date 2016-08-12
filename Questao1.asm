;Autores: Cassio Almeida, Francisco da Paz, Wesley Oliveira
;
;Escreva um programa para (a) exibir um \u2018?\u2019, (b) ler dois dígitos decimais cuja
;soma seja menor que 10 e (c) exibir sua soma na próxima linha.

;Sugestão:
;?27
;A soma de 2 e 7 vale 9

org 100h

; imprime mensagem na tela '?'
mov ah, 9     
mov dx, msg1 
int 21h

; ler um caratere do teclado
mov ah, 1 
int 21h ; 

; move o caractere lido para registrador bl
mov bl,al       
             
; ler outro caractere do teclado
mov ah, 1 
int 21h ;

; move o caractere lido para registrador cl
mov cl,al
add bl,cl  
   
; exibe na tela string 'Resutado: '   
mov ah, 9   
mov dx, msg3    
int 21h     

; chama o procedimento para exibir a soma em decimal na tela
sub bl,96d    
mov al,bl
call escreve_al    

; termino do programa       
mov ah, 0  
int 16h  

mov ax,0x4C00
int 21h

msg1: db '? $'  
    
msg3: db 0DH,0AH,'Resultado: $'
                    
                    
; procedimentos que convertem valores para decimal                 
escreve_al proc
cmp al, 0
jne escrever_al_r
    push ax
    mov al, '0'
    mov ah, 0eh
    int 10h
    pop ax
    ret 
escrever_al_r:    
    pusha
    mov ah, 0
    cmp ax, 0
    je pn_done
    mov dl, 10
    div dl    
    call escrever_al_r
    mov al, ah
    add al, 30h
    mov ah, 0eh
    int 10h    
    jmp pn_done
pn_done:
    popa  
    ret                      
  
ret




