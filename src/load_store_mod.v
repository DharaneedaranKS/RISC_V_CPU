`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 16:36:04
// Design Name: 
// Module Name: load_store_mod
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


module load_store_mod(
    input [11:0] imm,
    input [63:0] rs1_data,
    input [2:0] func3,
    input [6:0] opcode,
    output [63:0] rd,
    output write_en,
    output read_en,
    output [31:0] address
    );
    
    parameter load = 0000011,
              store = 0100011;
              
    always @(*) begin
        if(opcode == store) begin 
             case (func3)
                000 : 
            
endmodule
