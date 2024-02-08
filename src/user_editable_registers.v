`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2024 21:16:52
// Design Name: 
// Module Name: user_editable_registers
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


module user_editable_registers(
    input reset,
    input read_en,
    input [4:0] data_read_1,
    input [4:0] data_read_2,
    input [4:0] write_en,
    input [31:0] data_in,
    output reg [31:0] data_out_1,
    output reg [31:0] data_out_2
    );
    
    reg [31:0] user_memory [31:0];
    integer i;
    
    always @(*) begin
        if (reset == 1) begin
            for (i=0; i<32; i = i+1) begin 
                user_memory [i] = 32'h00000000;
            end
        end 
        
        else if (read_en == 1'b1) begin 
            data_out_1 = user_memory [data_read_1];
            data_out_2 = user_memory [data_read_2];
         end 
         
         else if ((read_en == 1'b1)&(write_en > 5'b00000)) begin
            user_memory [write_en] <= data_in;
            data_out_1 = user_memory [data_read_1];
            data_out_2 = 32'hxxxxxxxx;
         end
         
         else if ((read_en == 1'b0)&(write_en > 5'b00000)) begin
            user_memory [write_en] <= data_in;
            data_out_1 = 32'hxxxxxxxx;
            data_out_2 = 32'hxxxxxxxx;
         end
          
         else begin 
            data_out_1 = 32'hxxxxxxxx;
            data_out_2 = 32'hxxxxxxxx;
         end
         
      end
            
endmodule
