$NOMOD51
$INCLUDE (8051.MCU)


 org   0000h
      
SETB P1.0
CPL P1.0
Start: 

	 SETB P3.3
	 CLR P3.4
	 SETB P3.5
	 SETB P3.4
	 
	 stay: JB P3.5, stay
	 CLR P3.3
	 
	 SETB P3.7
	 
	 
	MOV TMOD,#00H 
	
	MOV R1, P0
	MOV A, R1
	MOV B, #3
	MUL AB
	MOV P2,A
	CPL A
	MOV R7, A

	
	
	SETB TR0 
	
	CLR P1.1
	LCALL HIGH_DONE
	SETB TR0
	LCALL LOW_DONE
	JMP Start
	
HIGH_DONE:			
	SETB P1.1
	CLR TF0                              	 
	MOV TH0, R7		
        stay1: JNB TF0, stay1		
	CLR TF0			
	RET		
					 		
	 

LOW_DONE:
	CLR P1.1		
	MOV A, #0FFH		
	CLR C				
	SUBB A, R7		
	MOV TH0, A
	stay2: JNB TF0, stay2
	CLR TF0			
	RET	

Loop:	
      jmp Loop


      END
