`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2024 14:52:47
// Design Name: 
// Module Name: pc
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


module pc( input clk,
           input reset,
           input [5:0] address,
           input [5:0] jump,
           output reg [5:0] next_address
    );
    
    always @(posedge reset or posedge clk) begin
        if (reset == 1'b1)
            next_address <= 6'b0;
        else begin
            // next_address <= address + 1'b1;
            if (jump > 6'b0) begin
               next_address <= address + jump;
            end
            else 
                next_address <= address + 1'b1;
         end
         
    end
    
endmodule
