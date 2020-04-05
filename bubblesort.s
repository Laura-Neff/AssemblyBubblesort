//THIS CODE IS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING A TUTOR OR CODE WRITTEN BY OTHER STUDENTS - LAURA NEFF

        .global BubbleSort, while, whileEnd, for, forEnd, if, ifEnd


BubbleSort:
//*****************************************************
// Write your bubble sort assembler subroutine here
//
//    BubbleSort: input  r0 = address of int array
//                       r1 = # elements in the array
//*****************************************************



        // Write your bubble sort function here.....
	// Make sure you RETURN to the caller !!!


 	 push    {lr}   

	 mov	 r2, #0       //Done = 0
	 mov	 r3, #1	      //k = 1


while:
	 cmp 	 r2, #0		//while(Done == 0)
	 bne 	 whileEnd

	 mov	 r2, #1		//Done = 1
	 
	
	 sub 	r4, r1, r3 	//r4 = N - k

	 mov    r5, #0		//r5 = i = 0 initially

for:
	 cmp 	r5, r4		//if i is >= N - k, leave the for loop
	 bge	forEnd
	 

if: 
	 add	r6, r5, r5	//integer offset for array when A[i]
	 add	r6, r6, r6
	
	 ldr    r7, [r0, r6]    //r7 = A[i]
         
	 add    r6, r5, #1	//r6 = i + 1
	 add    r6, r6, r6	//integer offset for array --> i + 1
	 add    r6, r6, r6

	 ldr    r8, [r0, r6]    //r8 = A[i+1]

	 cmp 	r7, r8
	 ble	ifEnd

	 mov 	r9, r7		//Help = r9 = A[i]

	 add	r6, r5, r5	//integer offset for array for when A[i]
	 add	r6, r6, r6

	 str    r8, [r0, r6]	//A[i] = A[i+1]

	 add    r6, r5, #1	//r6 = i + 1
	 add    r6, r6, r6	//integer offset for array --> i + 1
	 add    r6, r6, r6

	 str	r9, [r0, r6]	//A[i+1] = Help

	 mov	 r2, #0		//Done = 0, not sorted




	 add	r5, r5, #1	//iterate! i++




	 b for




 	

ifEnd:

	add	r5, r5, #1	//iterate! i++

	b for


forEnd:
	add	 r3, r3, #1	      //k = k + 1
	


	b 	while
	 
whileEnd:

 	 pop     {pc}  


	.data
// *************************************************************************
// If you need local variables, you can define them below this line
// *************************************************************************





        .end
