`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2024 21:16:52
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input clk,
    input reset,
    input [5:0] address,
    output reg [5:0] address_next
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset == 1) begin
            address_next <= 6'b000000;
        end 
        
        else 
            address_next = address + 1'b1;
     end 
     
endmodule
