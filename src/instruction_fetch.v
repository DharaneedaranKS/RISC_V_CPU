`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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
    output [31:0] instruction
    );
    
    reg [5:0] curr_address;
    
    // PROGRAM COUNTER
    always @(posedge reset or posedge clk) begin
        if (reset == 1'b1)
            curr_address <= 5'd0;
        
        else 
            curr_address <= curr_address + 1'b1;
    end
    
    // INSTRUCTION CALL
    
    instructions_memory mem(.address(curr_address), .instruction(instruction));
    
endmodule
