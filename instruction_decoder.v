`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2024 21:16:52
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(
    input clk,
    input reset,
    input [31:0] instruction,
    output [6:0] opcode,
    output reg [20:0] imm,
    output reg [4:0] rd,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [2:0] func3,
    output reg [6:0] func7
    );
    
    parameter R_type = 0110011,
              I_type = 0010011,
              Load_type = 0000011,
              S_type = 0100011,
              B_type = 1100011,
              J_type = 1100111,
              U_lui = 0110111,
              U_auipc = 0010111;
    
    assign opcode = instruction[6:0];
             
    always @(posedge clk) begin 
        case (opcode) 
            R_type : begin
                     func7 <= instruction [31:25];
                     rs2 <= instruction [24:20];
                     rs1 <= instruction [19:15];
                     func3 <= instruction [14:12];
                     rd <= instruction [11:7];
                     imm <= 21'hxxxxx;
                     end
            
            I_type : begin
                     func7 <= 7'bxxxxxxx;
                     rs2 <= 5'bxxxxx;
                     rs1 <= instruction [19:15];
                     func3 <= instruction [14:12];
                     rd <= instruction [11:7];
                     imm <= {9'b0, instruction [31:20]};
                     end         
            
            Load_type : begin
                        func7 <= 7'bxxxxxxx;
                        rs2 <= 5'bxxxxx;
                        rs1 <= instruction [19:15];
                        func3 <= instruction [14:12];
                        rd <= instruction [11:7];
                        imm <= {9'b0, instruction [31:20]};
                        end
            
            S_type : begin
                     func7 <= 7'bxxxxxxx;
                     rs2 <= instruction [24:20];
                     rs1 <= instruction [19:15];
                     func3 <= instruction [14:12];
                     rd <= 5'bxxxxx;
                     imm <= {9'b0, instruction [31:25], instruction [11:7]};
                     end
            
            B_type : begin
                     func7 <= 7'bxxxxxxx;
                     rs2 <= instruction [24:20];
                     rs1 <= instruction [19:15];
                     func3 <= instruction [14:12];
                     rd <= 5'bxxxxx;
                     imm <= {9'b0,instruction [31], instruction [7], instruction [30:25], instruction[11:8], 1'b0};
                     end
            
            J_type : begin
                     func7 <= 7'bxxxxxxx;
                     rs2 <= 5'bxxxxx;
                     rs1 <= 5'bxxxxx;
                     func3 <= 3'bxxx;
                     rd <= instruction [11:7];
                     imm <= { instruction [31], instruction [19:12], instruction [20], instruction [30:21], 1'b0};
                     end
              
              U_lui, U_auipc : begin                                                                                           
                               func7 <= 7'bxxxxxxx;                                                                            
                               rs2 <= 5'bxxxxx;                                                                                
                               rs1 <= 5'bxxxxx;                                                                                
                               func3 <= 3'bxxx;                                                                                
                               rd <= instruction [11:7];                                                                       
                               imm <= {1'b0, instruction [31:12]};    
                               end 
              
              default : begin                                                                                                                         
                        func7 <= 7'bxxxxxxx;              
                        rs2 <= 5'bxxxxx;                  
                        rs1 <= 5'bxxxxx;                  
                        func3 <= 3'bxxx;                  
                        rd <= 5'bxxxxx;         
                        imm <= 21'bxxxxxxxxxxxxxxxxxxxxx;
                        end
               endcase
      end
                                              
endmodule