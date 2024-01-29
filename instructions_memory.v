`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2024 21:16:52
// Design Name: 
// Module Name: instructions_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instructions_memory(
    input [5:0] address,
    output [31:0] instruction
    );
    
    reg [31:0] instruction_memory [63:0];
    
    initial begin 
     instruction_memory[0] = 32'h00000000;
     instruction_memory[1] = 32'h00007033;   // and r0, r0, r0 32'h00000000
     instruction_memory[2] = 32'h00100093;   // addi r1, r0, 1 32'h00000001 
     instruction_memory[3] = 32'h00200113;   // addi r2, r0, 2 32'h00000002
     instruction_memory[4] = 32'h00308193;   // addi r3, r1, 3 32'h00000004 
     instruction_memory[5] = 32'h00408213;   // addi r4, r1, 4 32'h00000005
     instruction_memory[6] = 32'h00510293;   // addi r5, r2, 5 32'h00000007 
     instruction_memory[7] = 32'h00610313;   // addi r6, r2, 6 32'h00000008
     instruction_memory[8] = 32'h00718393;   // addi r7, r3, 7 32'h0000000B
     instruction_memory[9] = 32'h00208433;   // add r8, r1, r2 32'h00000003 
     instruction_memory[10] = 32'h404404B3;   // sub r9, r8, r4 32'hFFFFFFFF or 32'hFFFFFFFE
     instruction_memory[11] = 32'h00317533;  // and r10, r2, r3 32'h00000000
     instruction_memory[12] = 32'h0041E5B3;  // or r11, r3, r4 32'h00000005 
     instruction_memory[13] = 32'h0041A633;  // if r3 is less than r4 then r12 = 1 32'h00000001
     instruction_memory[14] = 32'h007346B3;  // nor r13, r6, r7 32'hFFFFFFF4
     instruction_memory[15] = 32'h4D34F713;  // andi r14, r9, "4D3" 32'h000004D2
     instruction_memory[16] = 32'h8D35E793;  // ori r15, r11, "8D3" 32'hFFFFF8D7
     instruction_memory[17] = 32'h4D26A813;  // if r13 is less than 32'h000004D2 then r16 = 1 32'h00000001 
     instruction_memory[18] = 32'h4D244893;  // nori r17, r8, "4D2" 32'hFFFFFB2C
     instruction_memory[19] = 32'h02B02823;  // sw r11, 48(r0) alu_result = 32'h00000030
     instruction_memory[20] = 32'h03002603;  // lw r12, 48(r0) alu_result = 32'h00000030 r12 = 32'h00000005
    end
    
    assign instruction = instruction_memory[address[5:0]];
    
endmodule
