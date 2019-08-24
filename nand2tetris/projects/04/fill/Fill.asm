// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

  @key_status
  M=0     // keep last key status
  
  @8192
  D=A
  @n
  M=D     // n = 8192;

(KEY_SCAN)
  @KBD
  D=M
  @key_status
  D=D-M
  @KEY_SCAN
  D;JEQ   // if key not change, continue scan

  @KBD
  D=M
  @key_status
  M=D     // store the key status

(SCREEN_FLUSH_BEGIN)
  @0
  D=A
  @i
  M=D     // i = 0;

(LOOP)
  @i
  D=M
  @n
  D=D-M
  @WINDOW_FLUSH_DONE
  D;JEQ
  @key_status
  D=M         // key_status == 0; WHITE
  @WHITE
  D;JEQ

(BLACK)
  @SCREEN
  D=A
  @i
  A=D+M
  M=-1
  @NEXT
  0;JMP

(WHITE)
  @SCREEN
  D=A
  @i
  A=D+M
  M=0

(NEXT)
  @i
  M=M+1

  @LOOP
  0;JMP

(WINDOW_FLUSH_DONE)
  @KEY_SCAN
  0;JMP
