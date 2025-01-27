;   =============================================================================================
;   ||  ~                 Computer Organization & Assembly Language                         ~  ||
;   ||  ~                                     Fall 2024                                     ~  ||
;   ||  ~                                   Final Project                                   ~  ||
;   ||  ~    National University of Computer & Emerging Sciences (FAST-NUCES), Islamabad    ~  ||
;   =============================================================================================

;   ====================================
;   ||  ~    BRICK BREAKER GAME    ~  ||
;   ====================================

;   ==============================================
;   ||          ~    DEVELOPED BY    ~          ||
;   ==============================================
;   ||    • Uzair Majeed    (23i-3063)(SE-B)    ||
;   ||    • Hussnain Haider (23i-0695)(SE-B)    ||
;   ==============================================


INCLUDE Irvine32.inc
Include Macros.inc
Includelib winmm.lib

TITLE MASM PlaySound         
    PlaySound PROTO,
    pszsound:PTR BYTE,
    hmod:DWORD,
    fdwsound:DWORD
    


.data
    pathName db "highScores.txt", 0
    title0 byte "  _____                      _        _                             _                  ",0ah,0
    title1 byte " |  _  \          O         | | __   | |                    ____   | | __              ", 0ah,0
    title2 byte " | |_) |   ____   _    ___  | |/ /   | |__    ____   ____  |___ \  | |/ /   ____  ____ ", 0ah,0
    title3 byte " |  __ \  | '__| | |  / __| |  _ \   |  _ \  | '__| | []_|  ___| \ |  _ \  | []_|| '__|", 0ah,0
    title4 byte " | |__) | | |    | | | |__  | | \ \  | |_) | | |    | |__  |     | | | \ \ | |__ | |   ", 0ah,0
    title5 byte " |_____/  |_|    |_|  \___| |_|  \_\ |____/  |_|    |____| |_[]__| |_|  \_\|____||_|   ", 0ah,0
    title6 byte "                                                                                       ", 0ah,0

    start_msg db"                                 PRESS ANY KEY TO START....                            ",0ah,0


    ins0 byte "  ______           ____   _                          _                          ____     ",0ah,0
    ins1 byte " |__  __|         |  __| | |__                      | |__    O                 |  __|    ", 0ah,0
    ins2 byte "   |  |  |\_____  | |__  | ___|   ____  _   _   ___ | ___|   _   ____ |\_____  | |__     ", 0ah,0
    ins3 byte "   |  |  |  __  \ |__  | | |  __ | '__|| | | | / __|| |  __ | | |    ||  __  \ |__  |    ", 0ah,0
    ins4 byte "  _|  |_ | |  | |  __| | | |_/ / | |   | |_| || |__ | |_/ / | | | [] || |  | |  __| |    ", 0ah,0
    ins5 byte " |______||_|  |_| |____|  \___/  |_|   |_____| \___| \___/  |_| |____||_|  |_| |____|    ", 0ah,0
    ins6 byte "                                                                                         ", 0ah,0
    

    l0 byte "                                                _____      ",0ah,0
    l1 byte "  _                                _           / _  |      ", 0ah,0
    l2 byte " | |                              | |         /_| | |      ", 0ah,0
    l3 byte " | |       ____  __     __  ____  | |             | |      ", 0ah,0
    l4 byte " | |      | []_| \ \   / / | []_| | |             | |      ", 0ah,0
    l5 byte " | |____  | |__   \ \_/ /  | |__  | |____      ___| |___   ", 0ah,0
    l6 byte " |______| |____|   \___/   |____| |______|    |_________|  ", 0ah,0


    l7 byte  "                                              ______      ",0ah,0
    l8 byte  "  _                                _         / __   \     ", 0ah,0
    l9 byte  " | |                              | |       /_/ /   /     ", 0ah,0
    l10 byte " | |       ____  __     __  ____  | |          /   /      ", 0ah,0
    l11 byte " | |      | []_| \ \   / / | []_| | |         /   /       ", 0ah,0
    l12 byte " | |____  | |__   \ \_/ /  | |__  | |____    /   /___     ", 0ah,0
    l13 byte " |______| |____|   \___/   |____| |______|  |________|    ", 0ah,0


    l14 byte "                                               __________   ",0ah,0
    l15 byte "                                               |______  |   ",0ah,0
    l16 byte "  _                                _                 |  |   ", 0ah,0
    l17 byte " | |                              | |           _____|  |   ", 0ah,0
    l18 byte " | |       ____  __     __  ____  | |          |_____|  |   ", 0ah,0
    l19 byte " | |      | []_| \ \   / / | []_| | |                |  |   ", 0ah,0
    l20 byte " | |____  | |__   \ \_/ /  | |__  | |____       _____|  |   ", 0ah,0
    l21 byte " |______| |____|   \___/   |____| |______|     |_____|__|   ", 0ah,0

     g1  db"           ______         ______  _______     _____  _    _ _______ ______           ",0ah,0
     g2  db"          / _____|   /\  |  ___ \|_______|   / ___ \| |  | |  _____||  __ \          ",0ah,0
     g3  db"         | /  ____  /  \ | | _ | |_____     | |   | | |  | | |____  | |__) \         ",0ah,0
     g4  db"         | | |___ |/ /\ \| || || |  ___|    | |   | |\ \/ /|  ___|  | ___  /         ",0ah,0
     g5  db"         | \____/ | |__| | || || | |_____   | |___| | \  / | |_____ | |  | |         ",0ah,0
     g6  db"          \_____/\|______|_||_||_|_______|   \_____/   \/  |_______||_|  |_|         ",0ah,0
     g7  db"                                                                                     ",0ah,0

    enter_Name db "Enter Your Name :                                     ",0dh,0      
    X_Coord db ?
    Y_Coord db ?


    
    prevX byte ?
    prevY byte ?

    


    row_lower_1 db 37,45,60,75,83,98,106,114,129
    row_lower_2 db 37,52,67,82,90,98,113,128
    row_lower_3 db 37,45,60,68,83,91,106,114,129
    row_lower_4 db 45,60,75,83,98,113
    row_lower_5 db 58,66,74,82,90,98,106
   
    row_upper_1 db 44,59,74,82,97,105,113,128,136
    row_upper_2 db 51,66,81,89,97,112,127,135
    row_upper_3 db 44,59,67,82,90,105,113,128,136
    row_upper_4 db 59,74,82,97,112,127
    row_upper_5 db 65,73,81,89,97,105,113

    sizeB1 db 0,1,1,0,1,0,0,1,0 ; 0 is for small blocks ,1 is for large blocks
    sizeB2 db 1,1,1,0,0,1,1,0
    sizeB3 db 0,1,0,1,0,1,0,1,0
    sizeB4 db 1,1,0,1,1,1
    sizeB5 db 0,0,0,0,0,0,0

    status1 db 9 DUP(1) ;0 block is removed ,1 block is avaialble
    status2 db 8 DUP(1)
    status3 db 9 DUP(1)
    status4 db 6 DUP(1)
    status5 db 7 DUP(1)


    ST01 db 9 DUP(2) ;0 block is removed ,1 hit once, 2 not hit yet
    ST02 db 8 DUP(2)
    ST03 db 9 DUP(2)
    ST04 db 6 DUP(2)
    ST05 db 7 DUP(2)


ST31 db 255, 3, 3, 255, 3, 3, 3, 3, 255     ;255 MEANS UNBREAKABLE/FIXED BRICKS
ST32 db 3, 3, 3, 3, 3, 3, 255, 3            ;3 means takes 3 hits to remove
ST33 db 3, 255, 3, 3, 3, 3, 3, 255, 3     ;SPECIAL BRICK WILL HAVE 100 as status, generated random
ST34 db 3, 3, 3, 3, 3, 3          
ST35 db 3, 255, 3, 3, 3, 255, 255   

    brickCount dd ?

    paddleX db 78
    paddleY db 37
    paddleLen db 13
    paddleLenForLevel2 db 9

    leftwall db 34
    upwall db 13
    downwall db 40
    rightwall db 140

    ballX byte ?
    ballY byte ?

    ballDx sbyte 0
    ballDy sbyte -1

    lives db 3
    score db 0

    cyan_score db 1
    yellow_score db 2
    green_score db 3
    pink_score db 4

    bricks_color db 39 DUP(-1)

    flag db 1
    brickflag db 0

    playerName db 50 Dup(0)
    snd_filename dword 20001h

     musicintro db "menuSound",0
    musicintro1 db "level1",0
    musicintro2 db "level2",0
    musicintro3 db "level3",0
    musicintro4 db "gameoverSound",0

    randomSeed db 10


    NA1 db 'Player1',0
    NA2 db 'Player2',0
    NA3 db 'Player3',0
    NA4 db 'Player4',0
    NA5 db 'Player5',0
    fileHandle dd 0


scores db 0,0,0,0,0
namesFile db "Source.txt",0    ; File for player names
scoresFile db "Source1.txt",0  ; File for scores
.code
main PROC
    
    invoke playsound,offset musicintro,null,snd_filename
    mov eax, gray + (gray*16)
    call setTextColor
    call ClrScr
    call Randomize

    call titlePage
    call FirstPage

    
    call Menu
   call crlf
    INVOKE ExitProcess,0
main ENDP


FirstPage PROC
   
    add Y_Coord,4
    add X_Coord,1
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET enter_Name
    call WriteString
    add X_Coord,20
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY

    mov edx,offset NA1
    mov ecx,lengthof NA1
    call ReadString
    mov eax, black + (gray * 16)
    call SetTextColor
    ret
FirstPage ENDP
;-------------------------------------------
titlePage PROC

    call Logo
    mov edx, OFFSET start_msg
    call WriteString
    mov eax, black + (gray * 16)
    call SetTextColor
    call ReadChar
    ret
titlePage ENDP

Logo PROC
    
    call GetMaxXY

    SHR al, 2
    SHR dl, 2

    mov dh, al
    mov X_Coord, dl
    mov Y_Coord, dh


    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY

     mov  eax,100 
     call Delay
    mov eax ,red + (black*16)
    call SetTextColor
    mov edx, OFFSET title0
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET title1
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET title2
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET title3
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET title4
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET title5
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET title6
    call WriteString

    inc Y_Coord
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
ret
Logo ENDP


 Menu proc
    
    call setSpecialBrick
     mov eax, black + (gray * 16)
    call SetTextColor
    call clrscr
      mov dl,55
    mov dh,4
    call gotoxy
     
     mov eax, red + (black * 16)
    call SetTextColor
 mwrite ",____    ____  ________  ____  _____  _____  _____ "
          mov  eax,100 
          call Delay
          inc dh
          call gotoxy
     mwrite "|_   \  /   _||_   __  ||_   \|_   _||_   _||_   _|"
     call Delay
     inc dh
        call gotoxy
     mwrite "  |   \/   |    | |_ \_|  |   \ | |    | |    | |  "
     call Delay
     inc dh
        call gotoxy
     mwrite "  | |\  /| |    |  _| _   | |\ \| |    | '    ' |  "
     call Delay
     inc dh
        call gotoxy
     mwrite " _| |_\/_| |_  _| |__/ | _| |_\   |_    \ \__/ /   "
     call Delay
     inc dh
        call gotoxy
     mwrite "|_____||_____||________||_____|\____|    `.__.'    "

    
    mov dl, 55
    add dh, 5
    call gotoxy
   mov eax, blue + (black * 16)    
    call SetTextColor
    mwrite "----------------------------------------------------"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mwrite "|                                                  |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mov eax, gray + (black * 16) 
    call SetTextColor
    mwrite "|                   New Game                       |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mov eax, blue + (black * 16)   
    call SetTextColor
    mwrite "|                                                  |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mwrite "----------------------------------------------------"
    mov  eax,100 
          call Delay
    add dh, 1  

    call GotoXY
    mov eax, blue + (black * 16)   
    call SetTextColor
    mwrite "----------------------------------------------------"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mwrite "|                                                  |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mov eax, gray + (black * 16) 
    call SetTextColor
    mwrite "|                   Instructions                   |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mov eax, blue + (black * 16) 
    call SetTextColor
    mwrite "|                                                  |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mwrite "----------------------------------------------------"
    mov  eax,100 
          call Delay
    add dh, 1 

    call GotoXY
    mov eax, blue + (black * 16)  
    call SetTextColor
    mwrite "----------------------------------------------------"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mwrite "|                                                  |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mov eax, gray + (black * 16)   
    call SetTextColor
    mwrite "|                   High Score                     |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mov eax, blue + (black * 16)  
    call SetTextColor
    mwrite "|                                                  |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mwrite "----------------------------------------------------"
    mov  eax,100 
          call Delay
    add dh, 1  

    call GotoXY
    mov eax, blue + (black * 16)   
    call SetTextColor
    mwrite "----------------------------------------------------"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mwrite "|                                                  |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mov eax, gray + (black * 16)  
    call SetTextColor
    mwrite "|                   Exit                           |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mov eax, blue + (black * 16) 
    call SetTextColor
    mwrite "|                                                  |"
    mov  eax,100 
          call Delay
    inc dh
    call GotoXY
    mwrite "----------------------------------------------------"
    mov  eax,100 
    call Delay

    add dh, 2
    call GotoXY
    call readInt
     cmp eax,1
    je ll1

    cmp eax, 2
    je Instruction_

    cmp eax,3
    je highScores_
   

    jmp end_p

    Instruction_:
    call Instruction
    jmp end_p

    highScores_:
    call highScores
    jmp end_p

    ll1:
    call levelsOptions

    end_p:
     ret
Menu endp




levelsOptions PROC
 mov eax, black + (gray * 16)
    call SetTextColor
    call clrscr
     mov eax, red + (gray * 16)
    call SetTextColor
    call clrscr    

    mov dl, 50               
    mov dh, 4                   
    call GotoXY
    mov X_Coord, dl
    mov Y_Coord, dh


    mov eax, red + (black * 16)
    call SetTextColor

    mov edx, OFFSET l0
    call WriteString
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mov edx, OFFSET l1
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
   
    mov edx, OFFSET l2
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mov edx, OFFSET l3
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l4
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l5
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l6
    call WriteString

    inc Y_Coord
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY

    add Y_Coord,2
    mov dl, X_Coord
    mov dh, Y_Coord
    call gotoxy


    mov eax, red + (black * 16)
    call SetTextColor

    mov edx, OFFSET l7
    call WriteString
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l8
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l9
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l10
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l11
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l12
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l13
    call WriteString

    inc Y_Coord
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay

     add Y_Coord,2
      mov dl, X_Coord
    mov dh, Y_Coord
    call gotoxy


    mov eax, red + (black * 16)
    call SetTextColor

    mov edx, OFFSET l14
    call WriteString
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
   
    mov edx, OFFSET l15
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mov edx, OFFSET l16
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l17
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l18
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l19
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l20
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mov edx, OFFSET l21
    call WriteString

    add Y_Coord,3
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    mwrite "Select Level: "
    call ReadInt

    cmp eax,1
    je level1_

    cmp eax,2
    je level2_

    cmp eax,3
    je level3_



    level1_:
    invoke playsound,offset musicintro1,null,snd_filename
    call level1
    jmp endp_

    level2_:
    invoke playsound,offset musicintro2,null,snd_filename
    call level2
    jmp endp_

    level3_:
    invoke playsound,offset musicintro3,null,snd_filename
    call level3
    jmp endp_



endp_:
ret
levelsOptions ENDP


highScores PROC
call ReadPlayerNames
call ReadPlayerScores
    mov eax, black + (gray * 16)
    call SetTextColor
    call clrscr
      mov dl,25
    mov dh,4
    call gotoxy
     mov eax, red + (black * 16)
    call SetTextColor
    mov eax,100
    call Delay
     mwrite "  _         _______   ________  ____     _______  _____       ____     _______  ________  _____     ____    "
    inc dh
    call gotoxy
    call Delay
     mwrite " | |       |  _____| |   __   ||    \   |  _____||  _  \     |  _  \  |  ___  ||   __   ||  _  \   |    \   "
    inc dh
    call gotoxy
    call Delay
     mwrite " | |       | |       |  |  |  ||  _  \  | |      | | \  |    | |_|  \ | |   | ||  |  |  || | \  |  |  _  \  "
    inc dh
    call gotoxy
    call Delay
     mwrite " | |       | |___    |  |__|  || | \  \ | |___   | |_/ /     |      / | |   | ||  |__|  || |_/ /   | | \  \ "
    inc dh
    call gotoxy
    call Delay
     mwrite " | |       |  ___|   |  ____  || |  |  ||  ___|  |  __ \     |  __  \ | |   | ||  ____  ||  __ \   | |  |  |"
    inc dh
    call gotoxy
    call Delay
     mwrite " | |       | |       | |    | || |_/  / | |      | |  \ \    | |  |  \| |   | || |    | || |  \ \  | |_/  / "
    inc dh
    call gotoxy
    call Delay
     mwrite " | |_____  | |_____  | |    | ||     /  | |_____ | |   \ \   | |__|  || |___| || |    | || |   \ \ |     /  "
    inc dh
    call gotoxy
    call Delay
     mwrite " |_______| |_______| |_|    |_||____/   |_______||_|    \_\  |______/ |_______||_|    | || |    \_\|____/   "
    inc dh
    call gotoxy
    mov eax, black + (gray * 16)
    call SetTextColor
    mov dl, 45            
    mov dh,18                 
    call gotoxy
    mwrite "***************************************************************"
    inc dh
    call gotoxy
    mwrite "*          Player Name                    Score               *"
    inc dh
    call gotoxy
    mwrite "***************************************************************"
    mov ecx, 5                 
    lea esi,NA1              
    lea edi,scores         

displayLoop:
    inc dh                   
    call gotoxy
    mwrite "*           "        

    push ecx                   
    mov ecx, 30            
printName:
    lodsb                    
    cmp al, 0
    je endPrintName           
    call WriteChar
    loop printName
endPrintName:
    mov al, ' '      
fillNameSpace:
    call WriteChar
    loop fillNameSpace

    mwrite "  "           

    xor eax,eax
    movzx eax,byte ptr [edi]
    call WriteDec           
    add edi, 1               

    mov ecx, 10
fillScoreSpace:
    call WriteChar
    loop fillScoreSpace

    mwrite "                 *"            
    pop ecx                 
    inc dh                  
    loop displayLoop         
    inc dh
    call gotoxy
    mwrite "***************************************************************"
    inc dh
    call gotoxy
    mov eax, black + (gray * 16)
    call SetTextColor
    mwrite "Press any key to return to the menu..."
    call ReadChar
    call menu
    endp_:
    ret

highScores ENDP

pauseScreen PROC
 mov eax, black + (gray * 16)
    call SetTextColor
    call clrscr
      mov dl,55
    mov dh,4
    call gotoxy
     
     mov eax, red + (black * 16)
    call SetTextColor
    mwrite "    _______   _________   _      _    _______   ________   "
    inc dh
    call gotoxy
    mwrite "   |   __  | |   ___   | | |    | |  |  _____| |  ______|  "
    inc dh
    call gotoxy
    mwrite "   |  |  | | |  |   |  | | |    | |  | |       | |         "
    inc dh
    call gotoxy
    mwrite "   |  |__| | |  |___|  | | |    | |  | |_____  | |___      "
    inc dh
    call gotoxy
    mwrite "   |   ____| |   ___   | | |    | |  |_____  | |  ___|     "
    inc dh
    call gotoxy
    mwrite "   |  |      |  |   |  | | |    | |        | | | |         "
    inc dh
    call gotoxy
    mwrite "   |  |      |  |   |  | | |____| |   _____| | | |______   "
    inc dh
    call gotoxy
    mwrite "   |__|      |__|   |__|  \______/   |_______| |________|  "
    inc dh
    call gotoxy
    mwrite "                                                           "
    inc dh
    call gotoxy

    mov dl, 55
    add dh, 5
    call gotoxy
   mov eax, blue + (black * 16)    
    call SetTextColor
    mwrite "----------------------------------------------------"

    inc dh
    call GotoXY
    mwrite "|                                                  |"

    inc dh
    call GotoXY
    mov eax, gray + (black * 16) 
    call SetTextColor
    mwrite "|                   RESUME                         |"

    inc dh
    call GotoXY
    mov eax, blue + (black * 16)   
    call SetTextColor
    mwrite "|                                                  |"

    inc dh
    call GotoXY
    mwrite "----------------------------------------------------"

    add dh, 1  

    call GotoXY
    mov eax, blue + (black * 16)    
    call SetTextColor
    mwrite "----------------------------------------------------"
    inc dh
    call GotoXY
    mwrite "|                                                  |"
    inc dh
    call GotoXY
    mov eax, gray + (black * 16) 
    call SetTextColor
    mwrite "|                   BACK TO MENU                   |"

    inc dh
    call GotoXY
    mov eax, blue + (black * 16)  
    call SetTextColor
    mwrite "|                                                  |"


    inc dh
    call GotoXY
    mwrite "----------------------------------------------------"
    inc dh
    call gotoXY

    call readInt

    CMP EAX,1
    je resume

    CMP EAX,2
    JE MEN

    resume:
       cmp ecx,1
       je ll1
       cmp ecx,2
       je ll2
       
       call level3
       jmp end_p
    ll1:
        call level1
        jmp end_p
    ll2:
        call level2
        jmp end_p

    MEN:
       cmp ecx,1
       je m1
       cmp ecx,2
       je m2
       
       call resetFuncForLevel3
       call menu
       jmp end_p
    m1:
        call resetFunc
         call menu
        jmp end_p
    m2:
        call resetFuncForLevel2
        call menu
        jmp end_p

end_p:
ret
pauseScreen ENDP


Instruction PROC
mov eax, blue + (gray * 16)
    call SetTextColor
    call clrscr                  

    mov dl, 27                 
    mov dh, 2                     
    call GotoXY
    mov X_Coord, dl
    mov Y_Coord, dh

    mov eax, 100
    call Delay
    mov eax, red + (black * 16)
    call SetTextColor
    mov edx, OFFSET ins0
    call WriteString
    mov eax, 100
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET ins1
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET ins2
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET ins3
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET ins4
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET ins5
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET ins6
    call WriteString

    inc Y_Coord
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay

    mov eax, black + (gray * 16)
    call SetTextColor

    inc dh
    call GotoXY
    mwrite "1. Welcome to the Brick Breaker Game!"
    inc dh
    call GotoXY
    mwrite "   - Your goal is to break all the bricks by bouncing the ball using your paddle."
    inc dh
    call GotoXY
    mwrite "   - Each brick destroyed will score points. Special bricks may offer bonuses."
    add dh, 1
    call GotoXY
    mwrite "2. Controls:"
    inc dh
    call GotoXY
    mwrite "   - LEFT Arrow: Move the paddle left to position it under the ball."
    inc dh
    call GotoXY
    mwrite "   - RIGHT Arrow: Move the paddle right for better ball control."
    inc dh
    call GotoXY
    mwrite "   - Stay alert and maintain your paddle's position to prevent losing the ball!"
    add dh, 1
    call GotoXY
    mwrite "3. Game Mechanics:"
    inc dh
    call GotoXY
    mwrite "   - The ball bounces off walls, bricks, and the paddle, but it falls off the screen if you miss."
    inc dh
    call GotoXY
    mwrite "   - Some bricks require multiple hits to break, while others grant special rewards."
    inc dh
    call GotoXY
    mwrite "   - Speed increases as the game progresses, so stay sharp!"

    add dh, 1
    call GotoXY
    mwrite "4. Winning and Losing:"
    inc dh
    call GotoXY
    mwrite "   - Win: Destroy all bricks to complete the level and claim victory!"
    inc dh
    call GotoXY
    mwrite "   - Lose: Allow the ball to fall off the screen too many times, and you'll lose all your lives."

    add dh, 1
    call GotoXY
    mwrite "5. Tips for Success:"
    inc dh
    call GotoXY
    mwrite "   - Keep an eye on the ball's trajectory and plan your paddle's movement accordingly."
    inc dh
    call GotoXY
    mwrite "   - Take advantage of power-ups from special bricks to gain an edge."
    inc dh
    call GotoXY
    mwrite "   - Stay calm and focused, especially as the ball speed increases!"
    inc dh
    call GotoXY
    mwrite "6. BLOCKS SCORE LIST"
    inc dh
    call GotoXY

    mov eax,lightmagenta + (LIGHTGRAY * 16)
    call settextcolor

    mwrite "   - Pink Color : 4 (Highest)"
    inc dh
    call GotoXY

    mov eax,green + (LIGHTGRAY * 16)
    call settextcolor
    mwrite "   - Green Color : 3"
    inc dh
    call GotoXY
    mov eax,yellow + (LIGHTGRAY * 16)
    call settextcolor
    mwrite "   - Yellow Color : 2"
    inc dh
    call GotoXY
    mov eax,cyan + (LIGHTGRAY * 16)
    call settextcolor
    mwrite "   - Cyan Color : 1 (LOWEST)"

    inc dh
    inc dh
    call GotoXY

    
    mov eax, black + (gray * 16)
    call SetTextColor
    mwrite "Press any key to return to the menu..."
    call ReadChar
    call Menu
    ret
Instruction ENDP



Level1 Proc

    mov eax, red + (gray * 16)
    call SetTextColor
    call clrscr    

    mov dl, 5                 
    mov dh, 2                     
    call GotoXY
    mov X_Coord, dl
    mov Y_Coord, dh

    mov eax, 100
    call Delay
    mov eax, red + (black * 16)
    call SetTextColor

    mov edx, OFFSET l0
    call WriteString
    mov eax, 100
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l1
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l2
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l3
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l4
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l5
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l6
    call WriteString

    inc Y_Coord
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    ;---------------------------now making bricks and coloring them randonmly


    inc Y_Coord
    inc Y_Coord


    mov X_Coord,30

    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY

    mov eax, white + (black * 16)
    call SetTextColor

    mov edi,offset status1
    call DrawGrid

    
    mov ballX,dl
    mov ballY,dh
    

    mov bl,X_Coord
    mov prevX,bl
    mov bl,Y_Coord
    mov prevY,bl
    add prevY,5


    mov ballX,85
    mov ballY,37
    mov dl,ballX
    mov dh,ballY
    call gotoXY
    call drawBall

    
    ;grid boundaries X:31 - 127 Y: 12 - 30
    
loop1:

    
    call makeHeart
    
    xor ecx,ecx

    mov cl,lives
    cmp cl,0
    je gO

    xor ebx,ebx
    mov [flag],1
    call winCondition

    mov bl,[flag]
    cmp bl,0
    je level1Completed

    mov eax, white + (black * 16)
    call SetTextColor

    mov dl,prevX
    mov dh,prevY
    call GOTOXY
    mwrite" MOVE WITH A(LEFT) - D(RIGHT)  "
    inc dh
    call gotoXy
    mwrite"   PRESS ESCAPE KEY TO PAUSE   "
    
    
    
    
    xor eax,eax

    call processInput

    
    mov eax,90
    call Delay
    xor eax,eax

    call moveBall
    
    jmp loop1

gO:

call resetFunc
call gameOver
jmp end_p

level1Completed:
    jmp gO
end_p:
ret
Level1 ENDP


processInput PROC
    xor eax,eax
    invoke getKeystate,27
    test 8000h,ax; If no key is pressed, skip input

    jnz stop
    jmp next

    stop:
        mov ecx,1
        call pauseScreen
        jmp end_p

    next:
    invoke getKeystate,'A'
    test 8000h,ax
    jnz moveleft

    invoke getKeystate,'D'
    test 8000h,ax
    jnz moveright

    invoke getKeystate,'a'
    test 8000h,ax
    jnz moveleft

    invoke getKeystate,'d'
    jnz moveright

    ; If no valid input, return
    jmp end_p

moveleft:
    mov bl, paddleX          
    cmp bl,34          ; Left wall limit
    jbe skipPaddleMove        ; Skip if out of bounds

    call remPaddle         ; Erase current paddle
    sub X_Coord,5              ; Update X_Coord
    mov cl,X_Coord
    mov paddleX, cl         ; Sync paddleX with updated X_Coord
    call drawPaddle          ; Draw paddle at new position
    jmp skipPaddleMove       ; Skip further checks

moveright:
    mov bh, paddleX          ; Get current X position
    cmp bh,127      ; Right wall limit
    jae skipPaddleMove        ; Skip if out of bounds

    call remPaddle           ; Erase current paddle
    add X_Coord ,5            ; Update X_Coord
    mov cl,X_Coord
    mov paddleX, cl     ; Sync paddleX with updated X_Coord
    call drawPaddle          ; Draw paddle at new position

skipPaddleMove:
    jmp end_p
end_p:
    ret
processInput ENDP




moveBall PROC

    mov dl, ballX
    mov dh, ballY
    call GotoXY
    call remBall

    mov al, ballDx
    add ballX, al
    mov al, ballDy
    add ballY, al

    mov [paddleLen],12
    call checkCorners
    cmp al, 1                
    je skipPaddle

    ; Check collisions with walls
    mov cl, ballX
    cmp cl, leftwall
    jbe revX
    cmp cl, 139
    jae revX

    mov bl, ballY
    cmp bl, upwall
    jbe revY
    cmp bl, downwall
    jae lose

    mov [brickflag],0
   call checkBrickCollision
   mov al,brickflag
    cmp al,1
    je skipPaddle

    ; Check paddle collision
    mov bl, ballY
    cmp bl, 37
    jne skipPaddle

    mov bh, ballX
    mov al,paddleX

    cmp bh, al
    jb skipPaddle

    add al, 13      

    cmp bh, al
    ja skipPaddle

    mov al, paddleX
    add al, 7              
    cmp bh, al
    jl leftZone

    cmp bh, al
    je centerZone

rightZone:
    mov [ballDx], 1
    neg [ballDy]
    jmp skipPaddle

centerZone:
    mov [ballDx], 0
    neg [ballDy]
    jmp skipPaddle

leftZone:
    mov [ballDx], -1
    neg [ballDy]
    jmp skipPaddle

revX:
    neg [ballDx]
    jmp skipPaddle

revY:
    neg [ballDy]
    jmp skipPaddle

lose:
    sub lives,1
    mov ballDx,0
    mov ballDy,-1
    mov cl,paddleX
    add cl,6
    mov ballX,cl
    mov cl,paddleY
    mov ballY,cl

    jmp skipPaddle

skipPaddle:
    mov dl, ballX
    mov dh, ballY
    call GotoXY
    call drawBall

    ret
moveBall ENDP

checkBrickCollision PROC
    mov ebp,offset bricks_color
    xor esi, esi
    mov edi,offset row_lower_1
    mov ecx,offset row_upper_1
    mov eax,offset status1

loop1:
    cmp esi, LENGTHOF row_upper_1
    je done1
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip1
    cmp bl, [ecx + esi]
    ja skip1
    mov bh, ballY
    cmp bh, 14
    jne skip1

    mov bl, [eax + esi]
    cmp bl, 1
    jne skip1

    mov [brickflag],1
    neg ballDy
    mov dl,0
    mov [eax + esi],dl
    mov dl, [edi + esi]
    mov dh, 14
    call gotoXY

    mov bl,[ebp + esi]
    add score,bl

    mov bl, [sizeB1 + esi]
    cmp bl, 0
    je remSmall1
    call remLargeBlock
    jmp skip1

remSmall1:
    call remSmallBlock
    jmp skip1

skip1:
    inc esi
    jmp loop1

done1:
    mov ebp,offset bricks_color
    xor esi, esi
    mov edi,offset row_lower_2
    mov ecx,offset row_upper_2
    mov eax,offset status2
loop2:
    cmp esi, LENGTHOF row_upper_2
    je done2
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip2
    cmp bl, [ecx + esi]
    ja skip2
    mov bh, ballY
    cmp bh, 16
    jne skip2

    mov bl, [eax + esi]
    cmp bl, 1
    jne skip2

    neg ballDy
    
    mov [brickflag],1

    mov dl,0
    mov [eax + esi],dl
    mov dl, [edi + esi]
    mov dh, 16
    
    call gotoXY

    mov bl,[ebp + esi]
    add score,bl

    mov bl, [sizeB2 + esi]
    cmp bl, 0
    je remSmall2
    call remLargeBlock
    jmp skip2

remSmall2:
    call remSmallBlock
    jmp skip2

skip2:
    inc esi
    jmp loop2

done2:
    mov ebp,offset bricks_color
    xor esi, esi
    mov edi,offset row_lower_3
    mov ecx,offset row_upper_3
    mov eax,offset status3
loop3:
    cmp esi, LENGTHOF row_upper_3
    je done3
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip3
    cmp bl, [ecx + esi]
    ja skip3
    mov bh, ballY
    cmp bh, 18
    jne skip3

    mov bl, [eax + esi]
    cmp bl, 1
    jne skip3

    neg ballDy
    
    mov [brickflag],1

    mov dl,0
    mov [eax + esi],dl
    mov dl, [edi + esi]
    mov dh, 18
    
    call gotoXY
    mov bl,[ebp + esi]
    add score,bl

    mov bl, [sizeB3 + esi]
    cmp bl, 0
    je remSmall3
    call remLargeBlock
    jmp skip3

remSmall3:
    call remSmallBlock
    jmp skip3

skip3:
    inc esi
    jmp loop3

done3:
    mov ebp,offset bricks_color
    xor esi, esi
    mov edi,offset row_lower_4
    mov ecx,offset row_upper_4
    mov eax,offset status4
loop4:
    cmp esi, LENGTHOF row_upper_4
    je done4
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip4
    cmp bl, [ecx + esi]
    ja skip4
    mov bh, ballY
    cmp bh, 20
    jne skip4

    mov bl, [eax + esi]
    cmp bl, 1
    jne skip4

    neg ballDy
    
    mov [brickflag],1

    mov dl,0
    mov [eax + esi],dl
    mov dl, [edi + esi]
    mov dh, 20
    call gotoXY

    mov bl,[ebp + esi]
    add score,bl

    mov bl, [sizeB4 + esi]
    cmp bl, 0
    je remSmall4
    call remLargeBlock
    jmp skip4

remSmall4:
    call remSmallBlock
    jmp skip4

skip4:
    inc esi
    jmp loop4

done4:
   mov ebp,offset bricks_color
    xor esi, esi
    mov edi,offset row_lower_5
    mov ecx,offset row_upper_5
    mov eax,offset status5
loop5:
    cmp esi, LENGTHOF row_upper_5
    je end_proc
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip5
    cmp bl, [ecx + esi]
    ja skip5
    mov bh, ballY
    cmp bh, 22
    jne skip5

    mov bl, [eax + esi]
    cmp bl, 1
    jne skip5

    neg ballDy
    
    mov [brickflag],1

    mov dl,0
    mov [eax + esi],dl

    mov dl, [edi + esi]
    mov dh, 22
    call gotoXY

    mov bl,[ebp + esi]
    add score,bl

    mov bl, [sizeB5 + esi]
    cmp bl, 0
    je remSmall5
    call remLargeBlock
    jmp skip5

remSmall5:
    call remSmallBlock
    jmp skip5

skip5:
    inc esi
    jmp loop5

end_proc:
    ret
checkBrickCollision ENDP

remSmallBlock PROC
    push eax
    mov eax, black + 0
    call SetTextColor

    mwrite "_______"
    

    mov dl,ballX
    mov dh,ballY
    call gotoXY
    pop eax

ret
remSmallBlock ENDP

remLargeBlock PROC
push eax

    mov eax, black + 0
    call SetTextColor
    mwrite "______________"
    

    mov dl,ballX
    mov dh,ballY
    call gotoXY
pop eax

ret
remLargeBlock ENDP

comparison PROC

xor eax,eax
myloop:
    cmp eax,ecx
    je End_Cond
    xor ebx,ebx

    mov bl,[esi + eax]
    cmp bl, 1 
    je notEnd

    inc eax
    jmp myloop
    
End_Cond:
mov [flag],0
jmp end_p

notEnd:
mov [flag],1

end_p:
    ret
comparison ENDP


winCondition PROC

    ; Check status for each row
    mov esi,offset status1
    mov ecx, 9
    call comparison     

    MOV esi,OFFSET status2
    mov ecx, 8
    call comparison

    MOV esi,OFFSET status3
    mov ecx, 9
    call comparison

    MOV esi,OFFSET status4
    mov ecx, 6
    call comparison

    MOV esi,OFFSET status5
    mov ecx, 7
    call comparison

end_p:
    ret
winCondition ENDP


gameOver PROC
    
    invoke playsound,offset musicintro4,null,snd_filename
    mov eax, red + (black * 16)
    call SetTextColor
    call clrscr    

    mov dl, 40                 
    mov dh, 15                     
    call GotoXY
    mov X_Coord, dl
    mov Y_Coord, dh

    mov eax, 100
    call Delay
    mov eax, red + (black * 16)
    call SetTextColor

    mov edx, OFFSET g1
    call WriteString
    mov eax, 100
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET g2
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET g3
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET g4
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET g5
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET g6
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET g7
    call WriteString


    mov X_Coord,50
    add Y_Coord,2
    mov dl,X_Coord
    mov dh,Y_Coord
    call gotoXy
    
    call Delay

    mwrite " _____  ____  ____  ____  ______  "
    inc dh 
    call gotoXY
    mwrite "/ ____]|  __]|    || [] || ,____| "
    inc dh 
    call gotoXY
    mwrite "\___  \| |__ | [] ||    /| ,__|_  "
    inc dh 
    call gotoXY
    mwrite "[_____/|____]|____||_|\_\|______| "
    inc dh 
    call gotoXY
    mwrite "                                  "

    MOV DL,100
    dec dh
    dec dh
    call gotoXY
    

    xor eax,eax
    mov al,score
    call WriteDec

    mov dl,65
    add dh,5
    call GotoXY
    mov al,score
    mov [scores+0],al
    call SortLeaderboard
    call WritePlayerNames
    call WritePlayerScores
    mwrite "PRESS ANY KEY TO RETURN TO MENU.... "

    xor eax,eax
    mov eax,100
    call delay
    call ReadInt
    call menu
    jmp end_p


    end_p:
    ret
gameOver ENDP

customLoop PROC

loop1:
    mov al,1
    mov [esi + ecx],al
    loop loop1

ret
customLoop ENDP


;ballX == 34 && ballY == 13 upper left corner
;ballX == 34 && ballY == 39 lower left corner (lose live condition)
;ballX == 139 && ballY == 13 upper right corner
;ballX == 139 && ballY == 39 lower right corner(lose live condition)
;also if ballX== 34 && ballY == 37 && ballX == paddleX (paddleX is starting X coord of paddle) 
;also if ballX == 139 && ballY == 37 && ballX== paddleX + paddleLen
   
checkCorners PROC
    mov cl, ballX          ; Load ball's X-coordinate
    mov bl, ballY          ; Load ball's Y-coordinate

    ; Check Right Corners
    cmp cl, 139
    jne checkLeftCorners
    cmp bl, 13
    je cornerUpRight
    cmp bl, 39
    je cornerDownRight

    ; Check Right Paddle Edge
    cmp bl, 37
    jne skipCorners
    mov al, paddleX        ; Calculate paddle's right edge: paddleX + paddleLen
    add al, paddleLen
    cmp cl, al
    je cornerRightPaddle
    jmp skipCorners

checkLeftCorners:
    cmp cl, 34
    jne skipCorners
    cmp bl, 13
    je cornerUpLeft
    cmp bl, 39
    je cornerDownLeft

    ; Check Left Paddle Edge
    cmp bl, 37
    jne skipCorners
    mov al, paddleX        ; Compare with paddle's starting X-coordinate
    cmp cl, al
    je cornerLeftPaddle
    jmp skipCorners

cornerUpRight:
    neg ballDx             ; Reflect in X-direction
    neg ballDy             ; Reflect in Y-direction
    mov al, 1              ; Indicate corner collision
    jmp end_p

cornerDownRight:
    neg ballDx
    neg ballDy
    mov al, 1
    dec lives              ; Lose a life
    jmp end_p

cornerUpLeft:
    neg ballDx
    neg ballDy
    mov al, 1
    jmp end_p

cornerDownLeft:
    neg ballDx
    neg ballDy
    mov al, 1
    dec lives              ; Lose a life
    jmp end_p

cornerRightPaddle:
    neg ballDx             ; Reflect in X-direction
    neg ballDy             ; Reflect in Y-direction
    mov al, 1              ; Indicate paddle collision
    jmp end_p

cornerLeftPaddle:
    neg ballDx
    neg ballDy
    mov al, 1
    jmp end_p

skipCorners:
    xor al, al             ; No corner or paddle collision
end_p:
    ret
checkCorners ENDP





drawBall PROC
    mov eax, red + 0
    call SetTextColor
    mwrite "O"          ; Draw the ball (no coordinate changes)
    ret
drawBall ENDP


remBall PROC
    mov eax, black + 0
    call SetTextColor
    mwrite " "          ; Erase the ball (no coordinate changes)
    ret
remBall ENDP


remPaddle PROC
    mov dl, paddleX           ; Get the X coordinate of the paddle
    mov dh, paddleY           ; Get the Y coordinate of the paddle
    inc dh
    call GotoXY               ; Move cursor to the paddle's position

    ; Erase paddle by writing spaces (12 spaces to match paddle width)
    mwrite "             "     ; 12 spaces to erase the paddle

    ret
remPaddle ENDP


DrawPaddle PROC
    mov eax, white + (white * 16)  ; Set the text color (white in this case)
    call SetTextColor

    ; Move cursor to the paddle's position
    mov dl, paddleX                ; Get the X coordinate of the paddle
    mov dh, paddleY                ; Get the Y coordinate of the paddle
    inc dh
    call GotoXY                    ; Move the cursor to the correct position

    ; Draw the paddle at the current position
    mwrite "|___________|"          ; Draw the paddle (width = 12 characters)

    ret
DrawPaddle ENDP
resetFunc PROC
        mov ballDx,-1
        mov ballDy,-1
        mov lives,3
        mov [flag],1

        mov esi,offset status1
        mov ecx,LENGTHOF status1

        call customLoop
        mov esi,offset status2
        mov ecx,LENGTHOF status2

        call customLoop
        mov esi,offset status3
        mov ecx,LENGTHOF status3

        call customLoop
        mov esi,offset status4
        mov ecx,LENGTHOF status4

        call customLoop
        mov esi,offset status5
        mov ecx,LENGTHOF status5

        call customLoop
RET
resetFunc ENDP
;------------------------------------------------------------------------------------------------------------------------

;---------------  LEVEL 2  1) Increase Speed of Ball   2) Shorten Length of Paddle   3) Brick break at 2 hits and change colour after one hit


Level2 PROC
 
    mov eax, red + (gray * 16)
    call SetTextColor
    call clrscr    

    mov dl, 5                 
    mov dh, 2                     
    call GotoXY
    mov X_Coord, dl
    mov Y_Coord, dh

    mov eax, 100
    call Delay
    mov eax, red + (black * 16)
    call SetTextColor

    mov edx, OFFSET l7
    call WriteString
    mov eax, 100
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l8
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l9
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l10
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l11
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l12
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l13
    call WriteString

    inc Y_Coord
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    ;---------------------------now making bricks and coloring them randonmly


    inc Y_Coord
    inc Y_Coord


    mov X_Coord,30

    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY

    mov eax, white + (black * 16)
    call SetTextColor

    mov edi,offset ST01
    call DrawGrid
    call DrawPaddleForLevel2
    
    mov ballX,dl
    mov ballY,dh
    

    mov bl,X_Coord
    mov prevX,bl
    mov bl,Y_Coord
    mov prevY,bl
    add prevY,5


    mov ballX,82
    mov ballY,37
    mov dl,ballX
    mov dh,ballY
    call gotoXY
    call drawBall

    
    ;grid boundaries X:31 - 127 Y: 12 - 30
    
loop1:

    
    call makeHeart
    
    xor ecx,ecx

    mov cl,lives
    cmp cl,0
    je gO

    xor ebx,ebx
    mov [flag],1
    call winConditionForLevel2
    
    mov bl,[flag]
    cmp bl,0
    je level2Completed

    mov eax, white + (black * 16)
    call SetTextColor

    mov dl,prevX
    mov dh,prevY
    call GOTOXY
    mwrite"  MOVE WITH A(LEFT) - D(RIGHT) "
    inc dh
    call gotoXy
    mwrite"   PRESS ESCAPE KEY TO PAUSE   "
    
    
    
    
    xor eax,eax

    call processInputForLevel2

   
    mov eax,60
    call Delay
    xor eax,eax

    call moveBallForLevel2
    
    jmp loop1

gO:

call resetFuncForLevel2
call gameOver
jmp end_p

level2Completed:
    jmp gO
end_p:
ret

Level2 ENDP


DrawPaddleForLevel2 PROC
    mov eax, white + (white * 16)  ; Set the text color (white in this case)
    call SetTextColor

    ; Move cursor to the paddle's position
    mov dl, paddleX                ; Get the X coordinate of the paddle
    mov dh, paddleY                ; Get the Y coordinate of the paddle
    inc dh
    call GotoXY                    ; Move the cursor to the correct position

    ; Draw the paddle at the current position
    mwrite "_________"          ; Draw the paddle (width = 9 characters)

    ret
DrawPaddleForLevel2 ENDP


remPaddleForLevel2 PROC
    mov dl, paddleX           ; Get the X coordinate of the paddle
    mov dh, paddleY           ; Get the Y coordinate of the paddle
    inc dh
    call GotoXY               ; Move cursor to the paddle's position

    ; Erase paddle by writing spaces (8 spaces to match paddle width)
    mwrite "         "     ; 9 spaces to erase the paddle

    ret
remPaddleForLevel2 ENDP



processInputForLevel2 PROC
    xor eax,eax
    invoke getKeystate,27
    test 8000h,ax; If no key is pressed, skip input

    jnz stop
    jmp next

    stop:
        mov ecx,2
        call pauseScreen
        jmp end_p

    next:
    invoke getKeystate,'A'
    test 8000h,ax
    jnz moveleft

    invoke getKeystate,'D'
    test 8000h,ax
    jnz moveright

    invoke getKeystate,'a'
    test 8000h,ax
    jnz moveleft

    invoke getKeystate,'d'
    jnz moveright

    ; If no valid input, return
    jmp end_p

moveleft:
    mov bl, paddleX          
    cmp bl,34          ; Left wall limit
    jbe skipPaddleMove        ; Skip if out of bounds

    call remPaddleForLevel2           ; Erase current paddle
    sub X_Coord,3          ; Update X_Coord
    mov cl,X_Coord
    mov paddleX, cl         ; Sync paddleX with updated X_Coord
    call drawPaddleForLevel2          ; Draw paddle at new position
    jmp skipPaddleMove       ; Skip further checks

moveright:
    mov bh, paddleX          ; Get current X position
    cmp bh,131     ; Right wall limit
    jae skipPaddleMove        ; Skip if out of bounds

    call remPaddleForLevel2           ; Erase current paddle
    add X_Coord ,3           ; Update X_Coord
    mov cl,X_Coord
    mov paddleX, cl     ; Sync paddleX with updated X_Coord
    call drawPaddleForLevel2          ; Draw paddle at new position

skipPaddleMove:
    jmp end_p
end_p:
    ret
processInputForLevel2 ENDP


moveBallForLevel2 PROC
    

    mov dl, ballX
    mov dh, ballY
    call GotoXY
    call remBall
    mov al,[brickflag]
    cmp al,0
    jne forward

    mov al, ballDx
    add ballX, al
    mov al, ballDy
    add ballY, al
    
    forward:
    
    mov [brickflag],0
    mov [paddleLen],9
    call checkCorners
    cmp al, 1                
    je skipPaddle

    ; Check collisions with walls
    mov cl, ballX
    cmp cl, leftwall
    jbe revX
    cmp cl, 139
    jae revX

    mov bl, ballY
    cmp bl, upwall
    jbe revY
    cmp bl, downwall
    jae lose

    call checkBrickCollisionForLevel2
     mov al,[brickflag]
    cmp al,1
    je skipPaddle

    ; Check paddle collision
    mov bl, ballY
    cmp bl, 37
    jne skipPaddle

    mov bh, ballX
    mov al,paddleX

    cmp bh, al
    jb skipPaddle

    add al, 9      ;paddle len is 9 now in level2

    cmp bh, al
    ja skipPaddle

    mov al, paddleX
    add al, 4
    cmp bh, al
    jb leftZone

    cmp bh, al
    je centerZone

rightZone:
    mov [ballDx], 1
    neg [ballDy]
    jmp skipPaddle

centerZone:
    mov [ballDx], 0
    neg [ballDy]
    jmp skipPaddle

leftZone:
    mov [ballDx], -1
    neg [ballDy]
    jmp skipPaddle

revX:
    neg [ballDx]
    jmp skipPaddle

revY:
    neg [ballDy]
    jmp skipPaddle

lose:
    sub lives,1
    mov ballDx,0
    mov ballDy,-1
    mov cl,paddleX
    add cl,4
    mov ballX,cl
    mov cl,paddleY
    mov ballY,cl
    jmp skipPaddle

skipPaddle:
    mov dl, ballX
    mov dh, ballY
    call GotoXY
    call drawBall
end_p:
    ret
moveBallForLevel2 ENDP

changeSmallBlock PROC

push eax


mov dl,[ebp + esi]
cmp dl,4
je pink_c

cmp dl,3
je green_c
cmp dl,2
je yellow_c

mov eax, cyan + (cyan * 16)
call SetTextColor
 
    mwrite "_______"
 
    jmp end_p
pink_c:
    dec dl
    mov [ebp + esi],dl
    mov eax, green + (green * 16)
    call SetTextColor
 
    mwrite "_______"
    
    jmp end_p
green_c:
    dec dl
    mov [ebp + esi],dl
    mov eax, yellow + (yellow * 16)
    call SetTextColor

    
    mwrite "_______"
    
    jmp end_p
yellow_c:
    dec dl
    mov [ebp + esi],dl
    mov eax,cyan + (cyan * 16)
    call SetTextColor
 
    
    mwrite "_______"
    
    jmp end_p

end_p:
    mov dh,ballDx
    mov dl,ballDy
    add ballX,dh
    add ballY,dl

 pop eax
ret
changeSmallBlock ENDP

changeLargeBlock PROC

push eax
mov dl,[ebp + esi]
cmp dl,4
je pink_c

cmp dl,3
je green_c
cmp dl,2
je yellow_c

mov eax, cyan + (cyan * 16)
call SetTextColor
 
    mwrite "______________"
 
    jmp end_p
pink_c:
    dec dl
    mov [ebp + esi],dl
    mov eax, green + (green * 16)
    call SetTextColor
 
    mwrite "______________"
    
    jmp end_p
green_c:
    dec dl
    mov [ebp + esi],dl
    mov eax, yellow + (yellow * 16)
    call SetTextColor

    
    mwrite "______________"
    
    jmp end_p
yellow_c:
    dec dl
    mov [ebp + esi],dl
    mov eax,cyan + (cyan * 16)
    call SetTextColor
 
    
    mwrite "______________"
    
    
    jmp end_p

end_p:

    mov dh,ballDx
    mov dl,ballDy
    add ballX,dh
    add ballY,dl
 pop eax
ret
changeLargeBlock ENDP
;cyan
;yell
;green
;pink
checkBrickCollisionForLevel2 PROC
    mov ebp,offset bricks_color
    xor esi, esi
    mov edi, offset row_lower_1
    mov ecx, offset row_upper_1
    mov eax,offset ST01
loop1:
    cmp esi, LENGTHOF row_upper_1
    je done1
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip1
    cmp bl, [ecx + esi]
    ja skip1
    mov bh, ballY
    cmp bh, 14
    jne skip1

    mov bl, [eax + esi]
    cmp bl, 0
    je skip1


    cmp bl,1
    ja deflect1

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,0
    mov [eax + esi],dl

    mov dl, [edi + esi]
    mov dh, 14
    call gotoXY

    mov bl, [sizeB1 + esi]
    cmp bl, 0
    je remSmall1
    call remLargeBlock

    jmp skip1

    deflect1:
    neg ballDy
    mov [brickflag],1
    mov dl,1
    mov [eax + esi],dl
    
    mov dl, [edi + esi]
    mov dh, 14
    call gotoXY

    mov bl, [sizeB1 + esi]
    cmp bl, 0
    je changeSmall1

    call changeLargeBlock
    
    jmp skip1

changeSmall1:
    call changeSmallBlock
    jmp skip1

remSmall1:
    call remSmallBlock
    jmp skip1

skip1:
    inc esi
    jmp loop1

done1:
    
    mov ebp,offset bricks_color
    mov edi, offset row_lower_2
    mov ecx, offset row_upper_2
    xor esi, esi
    mov eax,offset ST02

loop2:
    cmp esi, LENGTHOF row_upper_2
    je done2
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip2
    cmp bl, [ecx + esi]
    ja skip2
    mov bh, ballY
    cmp bh, 16
    jne skip2

    mov bl, [eax + esi]
    cmp bl, 0
    je skip2


    cmp bl,1
    ja deflect2


    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,0
    mov [eax + esi],dl
    mov dl, [edi + esi]
    mov dh, 16
    call gotoXY
    mov bl, [sizeB2 + esi]
    cmp bl, 0
    je remSmall2
    call remLargeBlock
    
    jmp skip2

    deflect2:
    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,1
    mov [eax + esi],dl

    
    mov dl, [edi + esi]
    mov dh, 16
    call gotoXY

    mov bl, [sizeB2 + esi]
    cmp bl, 0
    je changeSmall2

    call changeLargeBlock
    jmp skip2

changeSmall2:
    call changeSmallBlock
    jmp skip2
remSmall2:
    call remSmallBlock
    jmp skip2

skip2:
    inc esi
    jmp loop2

done2:
    
    mov ebp,offset bricks_color
    mov edi, offset row_lower_3
    mov ecx, offset row_upper_3
    xor esi, esi
    mov eax,offset ST03

loop3:
    cmp esi, LENGTHOF row_upper_3
    je done3
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip3
    cmp bl, [ecx + esi]
    ja skip3
    mov bh, ballY
    cmp bh, 18
    jne skip3

    mov bl, [eax + esi]
    cmp bl, 0
    je skip3

    cmp bl,1
    ja deflect3


    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,0
    mov [eax + esi],dl
    mov dl, [edi + esi]
    mov dh, 18
    call gotoXY
    mov bl, [sizeB3 + esi]
    cmp bl, 0
    je remSmall3
    call remLargeBlock
    
    jmp skip3

    deflect3:
    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,1
    mov [eax + esi],dl

    
    mov dl, [edi + esi]
    mov dh, 18
    call gotoXY

    mov bl, [sizeB3 + esi]
    cmp bl, 0
    je changeSmall3

    call changeLargeBlock
    jmp skip3

changeSmall3:
    call changeSmallBlock
    jmp skip3

remSmall3:
    call remSmallBlock
    jmp skip3
skip3:
    inc esi
    jmp loop3

done3:
    
    mov ebp,offset bricks_color
    mov edi, offset row_lower_4
    mov ecx, offset row_upper_4
    xor esi, esi
    mov eax,offset ST04

loop4:
    cmp esi, LENGTHOF row_upper_4
    je done4
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip4
    cmp bl, [ecx + esi]
    ja skip4
    mov bh, ballY
    cmp bh, 20
    jne skip4

    mov bl, [eax + esi]
    cmp bl, 0
    je skip4

    cmp bl,1
    ja deflect4


    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,0
    mov [eax + esi],dl

    mov dl, [edi + esi]
    mov dh, 20
    call gotoXY
    mov bl, [sizeB4 + esi]
    cmp bl, 0
    je remSmall4
    call remLargeBlock
    jmp skip4

    deflect4:
    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,1
    mov [eax + esi],dl

    
    mov dl, [edi + esi]
    mov dh, 20
    call gotoXY

    mov bl, [sizeB4 + esi]
    cmp bl, 0
    je changeSmall4

    call changeLargeBlock
    jmp skip4

changeSmall4:
    call changeSmallBlock
    jmp skip4
remSmall4:
    call remSmallBlock
    jmp skip4

skip4:
    inc esi
    jmp loop4

done4:
    
    mov ebp,offset bricks_color
    mov edi, offset row_lower_5
    mov ecx, offset row_upper_5
    xor esi, esi
    mov eax,offset ST05

loop5:
    cmp esi, LENGTHOF row_upper_5
    je end_proc
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip5
    cmp bl, [ecx + esi]
    ja skip5
    mov bh, ballY
    cmp bh, 22
    jne skip5

    mov bl, [eax + esi]
    cmp bl, 0
    je skip5

    cmp bl,1
    ja deflect5

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,0
    mov [eax + esi],dl

    mov dl, [edi + esi]
    mov dh, 22
    call gotoXY
    mov bl, [sizeB5 + esi]
    cmp bl, 0
    je remSmall5
    call remLargeBlock
    jmp skip5

    deflect5:
    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,1
    mov [eax + esi],dl

    
    mov dl, [edi + esi]
    mov dh, 22
    call gotoXY

    mov bl, [sizeB5 + esi]
    cmp bl, 0
    je changeSmall5

    call changeLargeBlock
    jmp skip5

changeSmall5:
    call changeSmallBlock
    jmp skip5

remSmall5:
    call remSmallBlock
    jmp skip5
skip5:
    inc esi
    jmp loop5

end_proc:
    ret
checkBrickCollisionForLevel2 ENDP

comparison2 PROC

xor eax,eax
myloop:
    cmp eax,ecx
    je End_Cond

    xor ebx,ebx

    mov bl,[esi + eax]
    cmp bl, 1 
    je notEnd
    cmp bl,2
    je notEnd

    inc eax
    jmp myloop
    
End_Cond:
mov [flag],0
jmp end_p

notEnd:
mov [flag],1

end_p:
    ret
comparison2 ENDP


winConditionForLevel2 PROC

    xor esi,esi
    mov [flag],0         ; Assume all bricks are broken initially

    ; Check status for each row
    mov esi,offset ST01
    mov ecx, 9
    call comparison2
    cmp [flag],1         ; If any row has unbroken bricks, skip further checks
    je end_p

    mov esi,offset ST02
    mov ecx, 8
    call comparison2
    cmp [flag],1
    je end_p

    mov esi,offset ST03
    mov ecx, 9
    call comparison2
    cmp [flag],1
    je end_p

    mov esi,offset ST04
    mov ecx, 6
    call comparison2
    cmp [flag],1
    je end_p

    mov esi,offset ST05
    mov ecx, 7
    call comparison2

end_p:
    ret
winConditionForLevel2 ENDP

customLoop2 PROC

loop1:
    mov al,2
    mov [esi + ecx],al
    loop loop1

ret
customLoop2 ENDP

resetFuncForLevel2 PROC
        mov ballDx,-1
        mov ballDy,-1
        mov lives,3
        mov flag,1

        mov esi,offset ST01
        mov ecx,LENGTHOF ST01

        call customLoop2
        mov esi,offset ST02
        mov ecx,LENGTHOF ST02

        call customLoop2
        mov esi,offset ST03
        mov ecx,LENGTHOF ST03

        call customLoop2
        mov esi,offset ST04
        mov ecx,LENGTHOF ST04

        call customLoop2
        mov esi,offset ST05
        mov ecx,LENGTHOF ST05

        call customLoop2
RET
resetFuncForLevel2 ENDP
;----------------------------------------------------------------------------------






;------------------------------------------------------------
;---------- LEVEL 3     1) Some bricks are fixed  2) Normal Bricks will require 3 hits to disappear  3) Increase Speed of the ball 
;                       4) Make one random brick a special brick. When this special brick is hit, 5 random bricks (or all the remaining bricks if less than 5) should disappear.
;-----------------------------------------------------------

setSpecialBrick PROC
mov edi,offset ST31

loop1:
mov eax,39
call RandomRange

mov dl,[edi + eax]

cmp dl,0
je loop1

cmp dl,255
je loop1

mov dl,100
mov [edi + eax],dl

end_:
ret
setSpecialBrick ENDP






Level3 PROC

    mov eax, red + (gray * 16)
    call SetTextColor
    call clrscr    

    mov dl, 5                 
    mov dh, 2                     
    call GotoXY
    mov X_Coord, dl
    mov Y_Coord, dh

    mov eax, 100
    call Delay
    mov eax, red + (black * 16)
    call SetTextColor

    mov edx, OFFSET l14
    call WriteString
    mov eax, 100
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l15
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l16
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l17
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l18
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l19
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l20
    call WriteString

    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    mov edx, OFFSET l21
    call WriteString

    inc Y_Coord
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    call Delay
    ;---------------------------now making bricks and coloring them randonmly


    inc Y_Coord
   ; inc Y_Coord


    mov X_Coord,30

    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY

    mov eax, white + (black * 16)
    call SetTextColor

    mov edi,offset ST31
    call DrawGrid
    call DrawPaddleForLevel3
    
    mov ballX,dl
    mov ballY,dh
    

    mov bl,X_Coord
    mov prevX,bl
    mov bl,Y_Coord
    mov prevY,bl
    add prevY,5


    mov ballX,82
    mov ballY,37
    mov dl,ballX
    mov dh,ballY
    call gotoXY
    call drawBall

    
    ;grid boundaries X:31 - 127 Y: 12 - 30
    
loop1:

    
    call makeHeart
    
    xor ecx,ecx

    mov cl,lives
    cmp cl,0
    je gO

    xor eax,eax
    mov [flag],0
    call winConditionForLevel3
    mov bl,[flag]
    cmp bl,0
    je level3Completed

    mov eax, white + (black * 16)
    call SetTextColor

    mov dl,prevX
    mov dh,prevY
    call GOTOXY
    mwrite"  MOVE WITH A(LEFT) - D(RIGHT) "
    inc dh
    call gotoXy
    mwrite"   PRESS ESCAPE KEY TO PAUSE   "
    
    
    
    
    xor eax,eax

    call processInputForLevel3

   
    mov eax,45
    call Delay
    xor eax,eax
    call moveBallForLevel3
    
    jmp loop1

gO:

call resetFuncForLevel3
call gameOver
jmp end_p

level3Completed:
    jmp gO
end_p:
ret

Level3 ENDP


DrawPaddleForLevel3 PROC
    mov eax, white + (white * 16)  ; Set the text color (white in this case)
    call SetTextColor

    ; Move cursor to the paddle's position
    mov dl, paddleX                ; Get the X coordinate of the paddle
    mov dh, paddleY                ; Get the Y coordinate of the paddle
    inc dh
    call GotoXY                    ; Move the cursor to the correct position

    ; Draw the paddle at the current position
    mwrite "_________"          ; Draw the paddle (width = 9 characters)

    ret
DrawPaddleForLevel3 ENDP


remPaddleForLevel3 PROC
    mov dl, paddleX           ; Get the X coordinate of the paddle
    mov dh, paddleY           ; Get the Y coordinate of the paddle
    inc dh
    call GotoXY               ; Move cursor to the paddle's position

    ; Erase paddle by writing spaces (8 spaces to match paddle width)
    mwrite "         "     ; 9 spaces to erase the paddle


    ret
remPaddleForLevel3 ENDP



processInputForLevel3 PROC
    xor eax,eax
    invoke getKeystate,27
    test 8000h,ax; If no key is pressed, skip input

    jnz stop
    jmp next

    stop:
        mov ecx,3
        call pauseScreen
        jmp end_p

    next:
    invoke getKeystate,'A'
    test 8000h,ax
    jnz moveleft

    invoke getKeystate,'D'
    test 8000h,ax
    jnz moveright

    invoke getKeystate,'a'
    test 8000h,ax
    jnz moveleft

    invoke getKeystate,'d'
    jnz moveright

    ; If no valid input, return
    jmp end_p

moveleft:
    mov bl, paddleX          
    cmp bl,34          ; Left wall limit
    jbe skipPaddleMove        ; Skip if out of bounds

    call remPaddleForLevel3           ; Erase current paddle
    sub X_Coord,3          ; Update X_Coord
    mov cl,X_Coord
    mov paddleX, cl         ; Sync paddleX with updated X_Coord
    call drawPaddleForLevel3          ; Draw paddle at new position
    jmp skipPaddleMove       ; Skip further checks

moveright:
    mov bh, paddleX          ; Get current X position
    cmp bh,131     ; Right wall limit
    jae skipPaddleMove        ; Skip if out of bounds

    call remPaddleForLevel3           ; Erase current paddle
    add X_Coord ,3           ; Update X_Coord
    mov cl,X_Coord
    mov paddleX, cl     ; Sync paddleX with updated X_Coord
    call drawPaddleForLevel3          ; Draw paddle at new position

skipPaddleMove:
    jmp end_p
end_p:
    ret
processInputForLevel3 ENDP


moveBallForLevel3 PROC
    

    mov dl, ballX
    mov dh, ballY
    call GotoXY
    call remBall
    mov al,[brickflag]
    cmp al,1
    je forward

    mov al, ballDx
    add ballX, al
    mov al, ballDy
    add ballY, al
    
    forward:
    
    mov [brickflag],0
    mov [paddleLen],9
    call checkCorners
    cmp al, 1                
    je skipPaddle

    ; Check collisions with walls
    mov cl, ballX
    cmp cl, leftwall
    jbe revX
    cmp cl, 139
    jae revX

    mov bl, ballY
    cmp bl, upwall
    jbe revY
    cmp bl, downwall
    jae lose

    call checkBrickCollisionForLevel3
     mov al,[brickflag]
    cmp al,1
    je skipPaddle

    ; Check paddle collision
    mov bl, ballY
    cmp bl, 37
    jne skipPaddle

    mov bh, ballX
    mov al,paddleX

    cmp bh, al
    jb skipPaddle

    add al, 9      ;paddle len is 7 now in level2

    cmp bh, al
    ja skipPaddle

    mov al, paddleX
    add al, 4
    cmp bh, al
    jl leftZone

    cmp bh, al
    je centerZone

rightZone:
    mov [ballDx], 1
    neg [ballDy]
    jmp skipPaddle

centerZone:
    mov [ballDx], 0
    neg [ballDy]
    jmp skipPaddle

leftZone:
    mov [ballDx], -1
    neg [ballDy]
    jmp skipPaddle

revX:
    neg [ballDx]
    jmp skipPaddle

revY:
    neg [ballDy]
    jmp skipPaddle

lose:
    sub lives,1
    mov ballDx,0
    mov ballDy,-1
    mov cl,paddleX
    add cl,4
    mov ballX,cl
    mov cl,paddleY
    mov ballY,cl
    jmp skipPaddle

skipPaddle:
    mov dl, ballX
    mov dh, ballY
    call GotoXY
    call drawBall
end_p:
    ret
moveBallForLevel3 ENDP


;cyan
;yell
;green
;pink

;hardcode unbreakable brick set them as -1
;u needto remove 5 random brick when a special random brick is hit
;u can first do like pehle aik special random brick bana lo aur uska status koi special rkh do maybe like 100
;when that 100 status brick is hit u can then use random func to remove 5 random bricks,i.e make their status 0
;make a brick count function if brick count is less then 5 then dont remove by random func just remove them



returnBrickCount PROC
xor eax,eax
xor ebx,ebx

loop1:
    cmp eax,39
    je done

    mov dl,[ST31 + eax]
    cmp dl,0
    je skip

    cmp dl,255
    je skip

    inc ebx

skip:
    inc eax
    jmp loop1
done:

ret
returnBrickCount ENDP




removeRandomBrick PROC
    LOCAL Yi:byte

call returnBrickCount

cmp ebx,5
jl loop1

mov ebx,5

loop1:
    cmp ebx,0
    je done

    mov eax,39
    call RandomRange

    mov dl,[ST31 + eax]
    cmp dl,255      ;perm brick
    je loop1

    cmp dl,0        ;brick already broken
    je loop1

    mov dl,0
    mov [ST31 + eax],dl

    mov dl,[bricks_color + eax]
    add score,dl

    cmp eax,9
    jl first_row

    cmp eax,17
    jl second_row

    cmp eax,26
    jl third_row

    cmp eax,32
    jl fourth_row

    mov Yi,22
    jmp next

    first_row:
        mov Yi,14
        jmp next

    second_row:
        mov Yi,16
        jmp next

    third_row:
        mov Yi,18
        jmp next

    fourth_row:
        mov Yi,20
        jmp next

    next:

    mov dl,[sizeB1 + eax]
    cmp dl,0
    je remSmall

    mov dl,[row_lower_1 + eax]
    mov dh,Yi
    call gotoXY
    call remLargeBlock
    jmp below

    remSmall:
        mov dl,[row_lower_1 + eax]
        mov dh,Yi
        call gotoXY
        call remSmallBlock


    below:
    dec ebx
    jmp loop1

done:

ret
removeRandomBrick ENDP

checkBrickCollisionForLevel3 PROC
    mov ebp,offset bricks_color
    xor esi, esi
    mov edi, offset row_lower_1
    mov eax, offset row_upper_1
    mov ecx, offset ST31

loop1:
    cmp esi, LENGTHOF row_upper_1
    je done1
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip1
    cmp bl, [eax + esi]
    ja skip1
    mov bh, ballY
    cmp bh, 14
    jne skip1


    ; Check for permanent brick
    mov dl, [ecx + esi]
    cmp dl, 255
    je PERM_BOUNCE_1

    ;Check for Special Brick
    mov dl,[ecx+esi]
    cmp dl,100
    je SPECIAL_BRICK_1


    ;BRICK ALREADY REMOVED
    mov bl, [ecx + esi]
    cmp bl, 0
    je skip1

    ;BRICK WILL BREAK IF STATUS IS 1,ELSE IF IT IS 2 OR 3 IT WILL CHANGE COLOR ONLY
    cmp bl,1
    ja DEFLECT_1

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,1
    sub [ecx + esi],dl

    mov dl, [edi + esi]
    mov dh, 14
    call gotoXY

    mov bl, [sizeB1 + esi]
    cmp bl, 0
    je REMOVE_SMALL_1
    call remLargeBlock

    jmp skip1

;BRICK WILL NOT BREAK BUT COLOR WILL CHANGE
DEFLECT_1:
    neg ballDy
    mov dl,1
    mov brickflag,dl
    mov dl,1
    sub [ecx + esi],dl
    
    mov dl, [edi + esi]
    mov dh, 14
    call gotoXY

    mov bl, [sizeB1 + esi]
    cmp bl, 0
    je CHANGE_SMALL_1

    call changeLargeBlock
    
    jmp skip1

CHANGE_SMALL_1:
    call changeSmallBlock
    jmp skip1

SPECIAL_BRICK_1:

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,0
    mov [ecx + esi],dl

    push eax
    
    call removeRandomBrick
    
    pop eax

    mov dl, [edi + esi]
    mov dh, 14
    call gotoXY

    mov bl, [sizeB1 + esi]
    cmp bl, 0
    je REMOVE_SMALL_1
    call remLargeBlock
    jmp skip1

REMOVE_SMALL_1:
    call remSmallBlock
    jmp skip1

skip1:
    inc esi
    jmp loop1

done1:
    add ebp,9
    xor esi, esi
    mov edi, offset row_lower_2
    mov eax, offset row_upper_2
    mov ecx, offset ST32

loop2:
    cmp esi, LENGTHOF row_upper_2
    je done2
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip2
    cmp bl, [eax + esi]
    ja skip2
    mov bh, ballY
    cmp bh, 16
    jne skip2


    ; Check for permanent brick
    mov dl, [ecx + esi]
    cmp dl, 255
    je PERM_BOUNCE_2

    ;Check for Special Brick
    mov dl,[ecx+esi]
    cmp dl,100
    je SPECIAL_BRICK_2


    ;BRICK ALREADY REMOVED
    mov bl, [ecx + esi]
    cmp bl, 0
    je skip2

    ;BRICK WILL BREAK IF STATUS IS 1,ELSE IF IT IS 2 OR 3 IT WILL CHANGE COLOR ONLY
    cmp bl,1
    ja DEFLECT_2

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,1
    sub [ecx + esi],dl

    mov dl, [edi + esi]
    mov dh, 16
    call gotoXY

    mov bl, [sizeB2 + esi]
    cmp bl, 0
    je REMOVE_SMALL_2
    call remLargeBlock

    jmp skip2

;BRICK WILL NOT BREAK BUT COLOR WILL CHANGE
DEFLECT_2:
    neg ballDy
    mov dl,1
    mov brickflag,dl
    mov dl,1
    sub [ecx + esi],dl
    
    mov dl, [edi + esi]
    mov dh, 16
    call gotoXY

    mov bl, [sizeB2 + esi]
    cmp bl, 0
    je CHANGE_SMALL_2

    call changeLargeBlock
    
    jmp skip2

CHANGE_SMALL_2:
    call changeSmallBlock
    jmp skip2

SPECIAL_BRICK_2:

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,0
    mov [ecx + esi],dl

    push eax
    
    call removeRandomBrick
    
    pop eax

    mov dl, [edi + esi]
    mov dh, 16
    call gotoXY

    mov bl, [sizeB2 + esi]
    cmp bl, 0
    je REMOVE_SMALL_2
    call remLargeBlock
    jmp skip2

REMOVE_SMALL_2:
    call remSmallBlock
    jmp skip2

skip2:
    inc esi
    jmp loop2

done2:
    add ebp,8
    xor esi, esi
    mov edi, offset row_lower_3
    mov eax, offset row_upper_3
    mov ecx, offset ST33

loop3:
    cmp esi, LENGTHOF row_upper_3
    je done3
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip3
    cmp bl, [eax + esi]
    ja skip3
    mov bh, ballY
    cmp bh, 18
    jne skip3


    ; Check for permanent brick
    mov dl, [ecx + esi]
    cmp dl, 255
    je PERM_BOUNCE_3

    ;Check for Special Brick
    mov dl,[ecx+esi]
    cmp dl,100
    je SPECIAL_BRICK_3


    ;BRICK ALREADY REMOVED
    mov bl, [ecx + esi]
    cmp bl, 0
    je skip3

    ;BRICK WILL BREAK IF STATUS IS 1,ELSE IF IT IS 2 OR 3 IT WILL CHANGE COLOR ONLY
    cmp bl,1
    ja DEFLECT_3

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,1
    sub [ecx + esi],dl

    mov dl, [edi + esi]
    mov dh, 18
    call gotoXY

    mov bl, [sizeB3 + esi]
    cmp bl, 0
    je REMOVE_SMALL_3
    call remLargeBlock

    jmp skip3

;BRICK WILL NOT BREAK BUT COLOR WILL CHANGE
DEFLECT_3:
    neg ballDy
    mov dl,1
    mov brickflag,dl
    mov dl,1
    sub [ecx + esi],dl
    
    mov dl, [edi + esi]
    mov dh, 18
    call gotoXY

    mov bl, [sizeB3 + esi]
    cmp bl, 0
    je CHANGE_SMALL_3

    call changeLargeBlock
    
    jmp skip3

CHANGE_SMALL_3:
    call changeSmallBlock
    jmp skip3

SPECIAL_BRICK_3:
    push eax
    call removeRandomBrick
    pop eax

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,0
    mov [ecx + esi],dl

    push eax
    
    call removeRandomBrick
    
    pop eax

    mov dl, [edi + esi]
    mov dh, 18
    call gotoXY

    mov bl, [sizeB3 + esi]
    cmp bl, 0
    je REMOVE_SMALL_3
    call remLargeBlock
    jmp skip3

REMOVE_SMALL_3:
    call remSmallBlock
    jmp skip3

skip3:
    inc esi
    jmp loop3

done3:
    add ebp,9
    xor esi, esi
    mov edi, offset row_lower_4
    mov eax, offset row_upper_4
    mov ecx, offset ST34

loop4:
    cmp esi, LENGTHOF row_upper_4
    je done4
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip4
    cmp bl, [eax + esi]
    ja skip4
    mov bh, ballY
    cmp bh, 20
    jne skip4


    ; Check for permanent brick
    mov dl, [ecx + esi]
    cmp dl, 255
    je PERM_BOUNCE_4

    ;Check for Special Brick
    mov dl,[ecx+esi]
    cmp dl,100
    je SPECIAL_BRICK_4


    ;BRICK ALREADY REMOVED
    mov bl, [ecx + esi]
    cmp bl, 0
    je skip4

    ;BRICK WILL BREAK IF STATUS IS 1,ELSE IF IT IS 2 OR 3 IT WILL CHANGE COLOR ONLY
    cmp bl,1
    ja DEFLECT_4

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,1
    sub [ecx + esi],dl

    mov dl, [edi + esi]
    mov dh, 20
    call gotoXY

    mov bl, [sizeB4 + esi]
    cmp bl, 0
    je REMOVE_SMALL_4
    call remLargeBlock

    jmp skip4

;BRICK WILL NOT BREAK BUT COLOR WILL CHANGE
DEFLECT_4:
    neg ballDy
    mov dl,1
    mov brickflag,dl
    mov dl,1
    sub [ecx + esi],dl
    
    mov dl, [edi + esi]
    mov dh, 20
    call gotoXY

    mov bl, [sizeB4 + esi]
    cmp bl, 0
    je CHANGE_SMALL_4

    call changeLargeBlock
    
    jmp skip4

CHANGE_SMALL_4:
    call changeSmallBlock
    jmp skip4

SPECIAL_BRICK_4:

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,0
    mov [ecx + esi],dl

    push eax
    
    call removeRandomBrick
    
    pop eax

    mov dl, [edi + esi]
    mov dh, 20
    call gotoXY

    mov bl, [sizeB4 + esi]
    cmp bl, 0
    je REMOVE_SMALL_4
    call remLargeBlock
    jmp skip4

REMOVE_SMALL_4:
    call remSmallBlock
    jmp skip4

skip4:
    inc esi
    jmp loop4

done4:
    add ebp,6
    xor esi, esi
    mov edi, offset row_lower_5
    mov eax, offset row_upper_5
    mov ecx, offset ST35

loop5:
    cmp esi, LENGTHOF row_upper_5
    je done5
    mov bl, ballX
    cmp bl, [edi + esi]
    jb skip5
    cmp bl, [eax + esi]
    ja skip5
    mov bh, ballY
    cmp bh, 22
    jne skip5


    ; Check for permanent brick
    mov dl, [ecx + esi]
    cmp dl, 255
    je PERM_BOUNCE_5

    ;Check for Special Brick
    mov dl,[ecx+esi]
    cmp dl,100
    je SPECIAL_BRICK_5


    ;BRICK ALREADY REMOVED
    mov bl, [ecx + esi]
    cmp bl, 0
    je skip5

    ;BRICK WILL BREAK IF STATUS IS 1,ELSE IF IT IS 2 OR 3 IT WILL CHANGE COLOR ONLY
    cmp bl,1
    ja DEFLECT_5

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,1
    mov [brickflag],dl
    mov dl,1
    sub [ecx + esi],dl

    mov dl, [edi + esi]
    mov dh, 22
    call gotoXY

    mov bl, [sizeB5 + esi]
    cmp bl, 0
    je REMOVE_SMALL_5
    call remLargeBlock

    jmp skip5

;BRICK WILL NOT BREAK BUT COLOR WILL CHANGE
DEFLECT_5:
    neg ballDy
    mov dl,1
    mov brickflag,dl
    mov dl,1
    sub [ecx + esi],dl
    
    mov dl, [edi + esi]
    mov dh, 22
    call gotoXY

    mov bl, [sizeB5 + esi]
    cmp bl, 0
    je CHANGE_SMALL_5

    call changeLargeBlock
    
    jmp skip5

CHANGE_SMALL_5:
    call changeSmallBlock
    jmp skip5

SPECIAL_BRICK_5:

    mov bl,[ebp + esi]
    add score,bl

    neg ballDy
    mov dl,0
    mov [ecx + esi],dl

    push eax
    
    call removeRandomBrick
    
    pop eax

    mov dl, [edi + esi]
    mov dh, 22
    call gotoXY

    mov bl, [sizeB5 + esi]
    cmp bl, 0
    je REMOVE_SMALL_5
    call remLargeBlock
    jmp skip5

REMOVE_SMALL_5:
    call remSmallBlock
    jmp skip5

skip5:
    inc esi
    jmp loop5

PERM_BOUNCE_1:

    neg ballDy ; Bounce back for permanent bricks
    mov dl, [edi + esi]
    mov dh, 14
    call gotoXY

    mov dl,1
    mov [brickflag],dl

    
    mov dl,5
    mov [ebp + esi],dl

    mov bl, [sizeB1 + esi]
    cmp bl, 0
    je DONT_CHANGE_SMALL
    call dontchangeLargeBlock
    JMP end_proc

PERM_BOUNCE_2:
    neg ballDy ; Bounce back for permanent bricks
    mov dl, [edi + esi]
    mov dh, 16
    call gotoXY
    mov dl,1
    mov brickflag,1

    
    mov dl,5
    mov [ebp + esi],dl
    
    mov bl, [sizeB2 + esi]
    cmp bl, 0
    je DONT_CHANGE_SMALL
    call dontchangeLargeBlock
    JMP end_proc

PERM_BOUNCE_3:
    neg ballDy ; Bounce back for permanent bricks
    mov dl, [edi + esi]
    mov dh, 18
    call gotoXY
    mov dl,1
    mov brickflag,1

    
    mov dl,5
    mov [ebp + esi],dl

    mov bl, [sizeB3 + esi]
    cmp bl, 0
    je DONT_CHANGE_SMALL
    call dontchangeLargeBlock
    JMP end_proc

PERM_BOUNCE_4:
    neg ballDy ; Bounce back for permanent bricks
    mov dl, [edi + esi]
    mov dh, 20
    call gotoXY
    mov dl,1
    mov brickflag,1

    
    mov dl,5
    mov [ebp + esi],dl

    mov bl, [sizeB4 + esi]
    cmp bl, 0
    je DONT_CHANGE_SMALL
    call dontchangeLargeBlock
    JMP end_proc

PERM_BOUNCE_5:
    neg ballDy ; Bounce back for permanent bricks
    mov dl, [edi + esi]
    mov dh, 22
    call gotoXY

    mov dl,1
    mov brickflag,1

    
    mov dl,5
    mov [ebp + esi],dl

    mov bl, [sizeB5 + esi]
    cmp bl, 0
    je DONT_CHANGE_SMALL
    call dontchangeLargeBlock
    JMP end_proc

DONT_CHANGE_SMALL:
    call dontchangeSmallBlock
done5:
end_proc:
    ret
checkBrickCollisionForLevel3 ENDP

dontchangeSmallBlock PROC

push eax


mov eax, brown + (brown * 16)
call SetTextColor
 
mwrite "_______"
 
    mov dh,ballDx
    mov dl,ballDy
    add ballX,dh
    add ballY,dl

 pop eax
ret
dontchangeSmallBlock ENDP

dontchangeLargeBlock PROC

push eax


mov eax, brown + (brown * 16)
call SetTextColor
 
mwrite "______________"
 
    mov dh,ballDx
    mov dl,ballDy
    add ballX,dh
    add ballY,dl
 pop eax
ret
dontchangeLargeBlock ENDP

comparison3 PROC

mov eax,0
myloop:
    cmp eax,ecx
    je End_Cond

    xor ebx,ebx
    mov bl,[esi + eax]
    cmp bl, 1 
    je notEnd
    cmp bl,2
    je notEnd
    cmp bl,3
    je notEnd

    inc eax
    jmp myloop
    
End_Cond:
mov bl,0
mov [flag],bl
jmp end_p

notEnd:
mov bl,1
mov [flag],bl

end_p:
    ret
comparison3 ENDP


winConditionForLevel3 PROC

    xor esi,esi
    mov [flag],0         ; Assume all bricks are broken initially

    ; Check status for each row
    mov esi,offset ST31
    mov ecx, 9
    call comparison3
    cmp [flag],1         ; If any row has unbroken bricks, skip further checks
    je end_p

    mov esi,offset ST32
    mov ecx, 8
    call comparison3
    cmp [flag],1
    je end_p

    mov esi,offset ST33
    mov ecx, 9
    call comparison3
    cmp [flag],1
    je end_p

    mov esi,offset ST34
    mov ecx, 6
    call comparison3
    cmp [flag],1
    je end_p

    mov esi,offset ST35
    mov ecx, 7
    call comparison3

end_p:
    ret
winConditionForLevel3 ENDP
customLoop3 PROC

loop1:
    mov al,[esi + ecx]

    cmp al,255
    je next

    mov al,3
    mov [esi + ecx],al

    next:
    loop loop1

ret
customLoop3 ENDP

resetFuncForLevel3 PROC
        mov ballDx,-1
        mov ballDy,-1
        mov lives,3
        mov flag,1

        mov esi,offset ST31
        mov ecx,LENGTHOF ST31

        call customLoop3
        mov esi,offset ST32
        mov ecx,LENGTHOF ST32

        call customLoop3
        mov esi,offset ST33
        mov ecx,LENGTHOF ST33

        call customLoop3
        mov esi,offset ST34
        mov ecx,LENGTHOF ST34

        call customLoop3
        mov esi,offset ST35
        mov ecx,LENGTHOF ST35

        call customLoop3
RET
resetFuncForLevel3 ENDP
;----------------------------------------------------------------------------------


makeHeart PROC

    mov dl,85
    mov dh,2
    call gotoXY

    mov eax,red + (black * 16)
    call settextcolor


    mwrite"                                                                     "
    inc dh
    call gotoXY
    mwrite"                                                                     "
    inc dh
    call gotoXY
    mwrite"                                                                     "
    inc dh
    call gotoXY
    mwrite"                                                                     "
    inc dh
    call gotoXY
    mwrite"                                                                     "
    inc dh
    call gotoXY
    mwrite"                                                                     "
    inc dh
    call gotoXY
    mwrite"                                                                     "
    inc dh
    call gotoXY
    mwrite"                                                                     "

    mov dl,85
    mov dh,2
    call gotoXY
    
    mwrite " _     _ __    __ _____  ____  "
    inc dh 
    call gotoXY
    mwrite "| |   | |\ \  / /| ,___|/ ___] "
    inc dh
    call gotoXY
    mwrite "| |__ | | \ \/ / | ,_|_ \__  \ "
    inc dh
    call gotoXY
    mwrite "|____||_|  \__/  |_____|[____/ "


    mov dl,120
    mov dh,2
    call gotoXY

    mwrite " _____  ____  ____  ____  ______  "
    inc dh 
    call gotoXY
    mwrite "/ ____]|  __]|    || [] || ,____| "
    inc dh 
    call gotoXY
    mwrite "\___  \| |__ | [] ||    /| ,__|_  "
    inc dh 
    call gotoXY
    mwrite "[_____/|____]|____||_|\_\|______| "

    MOV DL,135
    mov dh,7
    call gotoXY
    

    xor eax,eax
    mov al,score
    call WriteDec

    mov dl,85
    mov dh,7
    call gotoXY
    

    mwrite "                 "
    inc dh
    call gotoXY
    mwrite "                 "
    inc dh
    call gotoXY
    mwrite "                 "

    mov dl,85
    mov dh,7
    call gotoXY
    

xor ecx,ecx
mov cl,0

myloop:
    cmp cl,[lives]
    je done

    mov dh,7
    call gotoXY
    mwrite "## ##"
    inc dh
    call gotoXY
    mwrite " ### "
    inc dh
    call gotoXY

    mwrite "  #  "
    
    add dl,6
    inc cl
    jmp myloop

done:


ret
makeHeart ENDP

drawBlocks PROC

xor eax,eax
mov al,[esi]
cmp al,-1
jne comparing

mov eax,4
call RandomRange


cmp eax,0
je magentaColor

cmp eax,1
je greenColor

cmp eax,2
je cyanColor

cmp eax,3
je yellowColor

cmp eax,5
je brownColor

comparing:
    cmp al,1
    je cyanColor
    cmp al,2
    je yellowColor
    cmp al,3
    je greenColor
    cmp al,4
    je magentaColor
    cmp al,5
    je brownColor

cyanColor:
    mov eax, cyan + (cyan * 16)
    call SetTextColor
     mov al,1
    mov [esi],al
    jmp done

yellowColor:
    mov eax, yellow + (yellow * 16)
    call SetTextColor
     mov al,2
    mov [esi],al
    jmp done

greenColor:
    mov eax, green + (green * 16)
    call SetTextColor
     mov al,3
    mov [esi],al
    jmp done


magentaColor:
    mov eax, lightmagenta + (lightmagenta * 16)
    call SetTextColor
    mov al,4
    mov [esi],al
    jmp done

brownColor:
    mov eax, brown + (brown * 16)
    call SetTextColor
    jmp done

done:
mov al,[ecx]
cmp al,0
je smallBlock


mwrite "______________"

jmp end_p
smallBlock:
mwrite "_______"

end_p:
ret
drawBlocks ENDP

DrawGrid PROC
    LOCAL Yi:byte

    mwrite "#################################################################################################################"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY

    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY

    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY
    
    mwrite "##                                                                                                             ##"
    inc Y_Coord
    mov dl, X_Coord
    mov dh, Y_Coord
    call GotoXY

    mwrite "#################################################################################################################"
                                 
                     
    mov Yi,14

    mov esi,offset bricks_color

    mov ebx,offset row_lower_1
    mov ecx,offset sizeB1
    mov eax,0

    print_loop:
        cmp eax,39
        je done_print

        mov dl,[edi]
        cmp dl,0        ;if status is 0 dont print
        je skip

        xor edx,edx
        mov dl,[ebx]
        mov dh,Yi
        call gotoXY
        
        push eax
        call drawBlocks

        pop eax

    skip:
        inc eax
        inc ebx
        inc ecx
        inc esi
        inc edi

        cmp eax,9
        je next_row
        cmp eax,17
        je next_row
        cmp eax,26
        je next_row
        cmp eax,32
        je next_row
        cmp eax,39
        je next_row
        
        jmp print_loop

    next_row:
        inc Yi
        inc Yi
        jmp print_loop
    
    
    done_print:
        xor eax,eax
        xor ebx,ebx
        xor ecx,ecx
        xor edx,edx
        xor esi,esi
        xor edi,edi


    mov Y_Coord,37
    mov X_Coord,78
    mov dl, X_Coord
    mov dh, Y_Coord
    mov paddleX,dl
    call GotoXY

    mov eax, white + (black * 16)
    call SetTextColor

   
   
   ret
DrawGrid ENDP







WritePlayerNames PROC
    ; Create/Open names file
    mov edx, OFFSET namesFile
    call CreateOutputFile
    mov fileHandle, eax
    
    ; Check if file was created successfully
    cmp eax, INVALID_HANDLE_VALUE
    je write_error

    ; Write Player1
    mov edx, OFFSET NA1
    mov ecx, SIZEOF NA1
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Write Player2
    mov edx, OFFSET NA2
    mov ecx, SIZEOF NA2
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Write Player3
    mov edx, OFFSET NA3
    mov ecx, SIZEOF NA3
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Write Player4
    mov edx, OFFSET NA4
    mov ecx, SIZEOF NA4
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Write Player5
    mov edx, OFFSET NA5
    mov ecx, SIZEOF NA5
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

write_error:
    ret
WritePlayerNames ENDP

; Procedure to write scores to a separate file
WritePlayerScores PROC
    ; Create/Open scores file
    mov edx, OFFSET scoresFile
    call CreateOutputFile
    mov fileHandle, eax
    
    ; Check if file was created successfully
    cmp eax, INVALID_HANDLE_VALUE
    je write_error

    ; Write all scores at once
    mov edx, OFFSET scores
    mov ecx, 10          ; Size of scores array
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

write_error:
    ret
WritePlayerScores ENDP

; Procedure to read player names from file
ReadPlayerNames PROC
    ; Open existing names file
    mov edx, OFFSET namesFile
    call OpenInputFile
    mov fileHandle, eax

    ; Check if file opened successfully
    cmp eax, INVALID_HANDLE_VALUE
    je read_error

    ; Read Player1
    mov edx, OFFSET NA1
    mov ecx, SIZEOF NA1
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Read Player2
    mov edx, OFFSET NA2
    mov ecx, SIZEOF NA2
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Read Player3
    mov edx, OFFSET NA3
    mov ecx, SIZEOF NA3
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Read Player4
    mov edx, OFFSET NA4
    mov ecx, SIZEOF NA4
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Read Player5
    mov edx, OFFSET NA5
    mov ecx, SIZEOF NA5
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

read_error:
    ret
ReadPlayerNames ENDP




; Procedure to read scores from file
ReadPlayerScores PROC
    ; Open existing scores file
    mov edx, OFFSET scoresFile
    call OpenInputFile
    mov fileHandle, eax

    ; Check if file opened successfully
    cmp eax, INVALID_HANDLE_VALUE
    je read_error

    ; Read all scores at once
    mov edx, OFFSET scores
    mov ecx, 10          ; Size of scores array
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

read_error:
    ret
ReadPlayerScores ENDP

; Modified sorting procedure with optimized jumps
SortLeaderboard PROC
    pushad              ; Save all registers
    mov ecx, 4          ; outer loop counter (n-1 iterations)
    
outer_start:
    mov esi, 0         ; index for inner loop

compare_loop:
    ; Compare adjacent scores
    movzx eax, byte ptr [scores + esi]        ; current score
    movzx ebx, byte ptr [scores + esi + 1]    ; next score
    
    ; If current score is less than next score, swap them
    cmp eax, ebx
    jge no_swap        ; if current >= next, don't swap
    
    ; Swap scores
    mov dl, [scores + esi]
    mov dh, [scores + esi + 1]
    mov [scores + esi], dh
    mov [scores + esi + 1], dl
    
    ; Now swap the corresponding names
    push esi
    
    ; Determine which names to swap
    cmp esi, 0
    jne check_second
    mov edi, OFFSET NA1
    mov edx, OFFSET NA2
    jmp swap_names

check_second:
    cmp esi, 1
    jne check_third
    mov edi, OFFSET NA2
    mov edx, OFFSET NA3
    jmp swap_names

check_third:
    cmp esi, 2
    jne check_fourth
    mov edi, OFFSET NA3
    mov edx, OFFSET NA4
    jmp swap_names

check_fourth:
    mov edi, OFFSET NA4
    mov edx, OFFSET NA5

swap_names:
    ; Swap the names
    push ecx
    xor ecx, ecx        ; Initialize counter for name swapping
    
swap_char:
    mov al, [edi + ecx]
    mov bl, [edx + ecx]
    mov [edi + ecx], bl
    mov [edx + ecx], al
    inc ecx
    cmp ecx, 8          ; Compare with name length
    jl swap_char
    
    pop ecx
    pop esi

no_swap:
    inc esi
    cmp esi, ecx        ; compare with outer loop counter
    jl compare_loop     ; if not done, continue inner loop
    
    dec ecx             ; decrease outer loop counter
    jnz outer_start     ; if not zero, continue outer loop

sort_done:
    popad               ; Restore all registers
    ret
SortLeaderboard ENDP

END main