`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2024 22:39:42
// Design Name: 
// Module Name: tb_instruction_fetch
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


module tb_instruction_fetch();
    
    reg clk,reset;
    wire [31:0] instruction;
    
    instruction_fetch dut(.clk(clk), .reset(reset), .instruction(instruction));
    
    initial begin 
    clk = 1'b0;
    forever begin
      #5 clk = ~clk;
    end
    end
    
    initial begin
        reset = 1'b1;
        #15 reset = 1'b0;
        $monitor(instruction);
    end
    
     
endmodule
