`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 12:53:04 PM
// Design Name: 
// Module Name: alu
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


module alu #(parameter DATA_WIDTH = 64)(
  input  [DATA_WIDTH-1:0] data_rs1,
  input [DATA_WIDTH-1:0] data_rs2,
  input  [3:0] func3,
  input  [3:0] func7,
  output  reg [DATA_WIDTH-1:0] C,
  output reg zero,
  output reg cout,
  output reg overflow,
  output reg sign
);


	parameter add=3'b000,
  			  sll=3'b001,
  			  slt=3'b010,
  			  sltu=3'b011,
              		  x_or=3'b100,
   			  srl=3'b101,
       		 	  o_r=3'b110,
  			  a_nd=3'b111;
  			  
  	reg signed [31:0] data_rs1_signed;		  
  
	
	always @ (*)
     begin
		case (func3)
    		
          add: if(func7 == 7'b0000000)
					begin
                      C= data_rs1 + data_rs2;
					end// add
				  else
				 	begin
                      C= data_rs1- data_rs2 ;
 					end//sub
 	   	  sll: 
 	   	   begin 
				 C = data_rs1 << data_rs2;
				 cout = 0;			
		   end //sll
		   
		  slt: begin//slt
		            assign data_rs1_signed = data_rs1;
			         if(data_rs1_signed < data_rs2)
				         C = 1;
				     else
				         C = 0;
			             cout = 0;
                    end
          sltu: begin
                   
            	     if(data_rs1 < data_rs1)
				         C = 1;
			     	 else
				         C = 0;
			             cout = 0;	
			        end//sltu
		  x_or: begin // xor
		        	C = data_rs1 ^ data_rs2;
			        cout = 0;			
			      end
		  srl:
			if(func7 == 7'b0000000)
			 begin // srl
			  C = data_rs1 >> data_rs2;
			  cout = 0;			
			 end
			else
			 begin // sra
              C = data_rs1 >>> data_rs2;
		    	cout = 0;			
			 end
			 
		  o_r: begin //or
		        	C = data_rs1 | data_rs2;
		        	cout = 0;
			end
		 
		  a_nd: 
		 	begin //and
			 C = data_rs1 & data_rs2;
			 cout = 0;
			end
		
		
		
		  default: begin
			C = 0;
			cout = 0;			
			end 

 		endcase
 		
 		if (C==1)
			zero = 1;
		else
			zero = 0;
			
		 sign = C[DATA_WIDTH-1];

	     overflow = (data_rs1[DATA_WIDTH-1] == data_rs2[DATA_WIDTH-1]) && (data_rs1[DATA_WIDTH-1] != C[DATA_WIDTH-1]); 
	
 	 end
 		
endmodule 
