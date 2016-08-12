;Autores: Cassio Almeida, Francisco da Paz, Wesley Oliveira
;
;Escreva um programa para (a) questionar o usuário sobre suas iniciais (três
;por exemplo), (b) ler as iniciais e (c) exibi-las de cima para baixo, em linhas
;separadas e na margem esquerda da tela.

org 100h

; ler caractere do teclado
mov ah, 1 
int 21h ; 
   
; move caractere para registrador bl   
mov bl,al       
             
; ler caractere do teclado
mov ah, 1 
int 21h ; 

; move caractere para registrador cl
mov cl,al 

; ler caractere do teclado
mov ah, 1 
int 21h ;       
            
; move caractere para registrador dl
mov ch,al

; seta modo de video
mov ax, 3     ; modo texto em 80x25, 16 cores, 8 paginas (ah=0, al=3)
int 10h       

; exibe o primeiro caractere na tela      
mov ah, 2h
mov dl, bl
int 21h 

; quebra a linha
mov ah, 2h
mov dl, 0Ah
int 21h

; move para o inicio da linha       
mov ah, 2h
mov dl, 0Dh
int 21h       
   
; exibe segundo caractere na tela          
mov ah, 2h
mov dl, cl
int 21h  

; quebra a linha
mov ah, 2h
mov dl, 0Ah
int 21h  

; move para o inicio da linha   
mov ah, 2h
mov dl, 0Dh
int 21h    
    
; exibe terceiro caractere na tela    
mov ah, 2h
mov dl, ch
int 21h
       
; termino do programa  
mov ah, 0  
int 16h      

ret