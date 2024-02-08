module decoder_register (input clk, 
                         input reset,
                         input [6:0] opcode,
                         input [2:0] func3,
                         input [20:0] imm,
                         input [4:0] rd,
                         input [4:0] rs1,
                         input [4:0] rs2,
                         input [63:0] write_back_value,
                         output [63:0] in1,
                         output [63:0] in2);
       
       reg read_en;
       reg [4:0] write_en, data_read_1, data_read_2;
       reg [63:0] data1, data2;
       
       user_editable_register data_memory (.reset(reset), .read_en(read_en), .data_read_1(data_read_1), .data_read_2(data_read_2), .data_in(write_back_value), .data_out_1(data1), .data_out_2(data2));
       
       parameter R_type = 0110011,
                 I_type = 0010011,
                 Load_type = 0000011,
                 S_type = 0100011,
                 B_type = 1100011,
                 J_type = 1100111,
                 U_lui = 0110111,
                 U_auipc = 0010111;
                           
       always @(posedge clk or posedge reset) begin 
           write_en <= 5'b0;
           in1 <= 64'b0;
           in2 <= 64'b0;
           
           if (reset == 1) begin
               read_en <= 1'b0;
           end
           
           else begin
               case (opcode) 
               R_type : begin   
                        read_en <= 1'b1;
                        data_read_1 <= rs1;
                        data_read_2 <= rs2;
                        in1 <= data1;
                        in2 <= data2;
                        end
                        
               I_type : begin
                        read_en <= 1'b1;
                        data_read_1 <= rs1;
                        data_read_2 <= 5'b0;
                        in1 <= data1;
                        in2 <= {43'b0, imm};
                        end
                        
               Load_type : begin
                           read_en <= 1'b1;
                           data_read_1 <= rs1;
                           data_read_2 <= 5'b0;
                           write_en <= data1;
                           
                                


endmodule
                         