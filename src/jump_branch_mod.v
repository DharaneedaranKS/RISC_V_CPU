`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 12:01:00 PM
// Design Name: 
// Module Name: branch_jump_block
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


module branch_jump_block(
    input [2:0] func3,
    input signed [20:0] imm,
    input [63:0] data_rs1,
    input [63:0] data_rs2,
    input [6:0] opcode,
    output reg [5:0] jump
    );
  
    always @(*) 
     begin
        if(opcode==1100011)
         begin
            case(func3)
                000: jump= ((data_rs1)==(data_rs2)?((imm)>>2):1);
                001: jump= ((data_rs1)!=(data_rs2)?((imm)>>2):1);
                100: jump= ((data_rs1)<(data_rs2)?((imm)>>2):1);
                101: jump= ((data_rs1)>=(data_rs2)?((imm)>>2):1);
                110: jump= ((data_rs1)<(data_rs2)?((imm)>>2):1);
                111: jump= ((data_rs1)>=(data_rs2)?((imm)>>2):1);
                default: jump=0;        
            endcase
         end 
        else if(opcode==1101111)
         jump= imm;
        else
         jump=0;
     end
endmodule     
    







