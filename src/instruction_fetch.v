`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dharaneedaran K S
// 
// Create Date: 29.01.2024 21:16:52
// Design Name: 
// Module Name: instruction_fetch
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


module instruction_fetch(
    input clk,
    input reset, 
    input [5:0] jump,
    output [31:0] instruction
    );
    
    reg [5:0] curr_address;
    wire [5:0] next_address;
    
    always @(*) begin
        if (reset == 1'b1)
            curr_address = 6'b0;
        else
            curr_address = next_address;
    end 
    
    // PROGRAM COUNTER
     pc update_address(.clk(clk), .reset(reset), .address(curr_address), .jump(jump), .next_address(next_address));
    
    // INSTRUCTION CALL
    
    instructions_memory mem(.address(curr_address), .instruction(instruction));
    
endmodule
