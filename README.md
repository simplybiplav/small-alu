# small-alu
```
Implement a small ALU on the Basys-3 board using the 2-position switches to define two 4-bit operands, 
and a 3-bit control input specifying the operation to be performed.The on-board leds should be used to display the result.
```
![Repo List](diagram/Small-ALU.png)

```
1. Create a corresponding VHDL design file comprising two architectural descriptions using “if/then/else” and “when/else” statements. Assume the following set of arithmetic and logic operations:

ctr(2:0)  Operation
000	      add
001	      subtract
010	      and
011	      or
100	      shift A right
101	      shift A left
110	      shift B right
111	      shift B left

 
2. Explain the differences between these two architectural descriptions, regarding the implementation synthesised by Vivado.
3. Prove the correctness of your solution by creating a simulation source file covering all the operations supported by the ALU.
4.Program the FPGA and check the operation of your implementation in the Basys-3 board.
5.Expand the number of control inputs to 4 and assume that the most significant bit is used to distinguish between arithmetic
and logic operations. Define 8 new operations including multiplication and division, and modify your VHDL design file
accordingly.
6.Prove the correctness of your solution by expanding the simulation source file in order to cover the new 8 operations.
7.Program the FPGA and check the operation of this new implementation in the Basys-3 board.
 

Note: The attached files were presented in the classroom and correspond to questions 1 to 3 above. You may use them as a starting point to answer the remaining questions 4 to 6.

```


# Solution

The solution is for 5 and 6
