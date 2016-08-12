;Autores: Cassio Almeida, Francisco da Paz, Wesley Oliveira
;
;Escreva um programa que leia três iniciais, exiba-as de forma centrada
;dentro de uma moldura de asteriscos de 11 x 5 (horizontal x vertical) e por fim
;produza um bip no computador.



org 100h
   
; exibe string 'Entre com tres iniciais:' na tela
mov ah,9h        
lea dx,m1      
int 21h         
 
;receber caractere do teclado
mov ah, 1h
int 21h
mov bl,al   

;receber outro caractere do teclado
mov ah, 1h
int 21h
mov cl,al 

;receber outro caractere do teclado
mov ah, 1h
int 21h
mov ch,al 

; exibe asteriscos na tela
mov ah,9        
lea dx,m2      
int 21h      

; exibe asteriscos com espacos na tela
mov ah,9        
lea dx,mx      
int 21h
     
; exibe um asterisco com   espaço
mov ah,9        
lea dx,m3      
int 21h
            
; exibe primeiro caractere
mov ah, 2h
mov dl, bl
int 21h

; exibe segundo caractere 
mov ah, 2h
mov dl, cl
int 21h

; exibe terceiro caractere
mov ah, 2h
mov dl, ch
int 21h
  
; desenha asteriscos na tela
mov ah,9        
lea dx,m4
int 21h 

; desenha asteriscos na tela
mov ah,9        
lea dx,m5      
int 21h

; desenha asteriscos na tela
mov ah,9        
lea dx,m6      
int 21h   
   
; reproduz som de bip    
mov ah, 2h
mov dl, 07h
int 21h
  
; termino do programa
mov ah, 0 
int 16h

mov ax, 0x4c00
int 21h 
             
    

               
m1 db 'Entre com tres iniciais: $'  
m2 db 0dh, 0ah, '************$'
mx db 0dh, 0ah, '*          *$'  
m3 db 0dh, 0ah, '*   $'
m4 db '    *$'
  


m5 db 0dh, 0ah, '*          *$'
m6 db 0dh, 0ah, '************$'

ret




