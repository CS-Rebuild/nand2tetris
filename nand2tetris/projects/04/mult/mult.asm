// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

  @product
  M=0       // product = 0

(IS_R0_R1_EQ_0)
  @R0
  D=M
  @MULTI_DONE
  D;JEQ     // if R0 is 0, goto MULTI_DONE
  @R1
  D=M
  @MULTI_DONE
  D;JEQ     // if R1 is 0, goto MULTI_DONE

(MULTI_BEGIN)
  @R0
  D=M
  @n
  M=D       // n = R0

(LOOP)
  @n
  D=M    
  @MULTI_DONE
  D;JEQ      // if (n==0) goto MULTI_DONE
  
  @R1
  D=M
  @product
  M=D+M

  @n
  M=M-1      // n--
  
  @LOOP
  0;JMP

(MULTI_DONE)
  @product
  D=M
  @R2
  M=D       // R2 = product

(END)
  @END
  0;JMP
