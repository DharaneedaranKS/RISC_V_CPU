`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 13:47:25
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input reset,
    input read_en,
    input write_en,
    input [31:0] address_1,
    input [31:0] address_2,
    input [63:0] write_value,
    output reg [63:0] val1,
    output reg [63:0] val2
    );
    
    reg [63:0] mem [33554431:0];
    
    integer i;
    
    always @(*) begin
        val1 = 64'bx;
        val2 = 64'bx;
        if (reset == 1) begin
            for (i=0; i < 33554432; i = i+1) begin
                mem[i] = 64'b0;
            end
        end 
        
        else begin
            if ((address_1 > 31'd33554431)|(address_2 > 31'd33554431)) begin
                val1 = 64'b0;
                val2 = 64'b0;
            end 
            
            else if (read_en == 1'b1) begin
                val1 = mem[address_1];
                val2 = mem[address_2];
            end
            
            else if (write_en == 1'b1) begin 
                mem[address_1] = write_value;
            end
            
            else begin
                val1 = 64'bx;
                val2 = 64'bx;
            end
        end
  end
                
endmodule
