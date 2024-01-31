module alu #(parameter DATA_WIDTH = 64)(
  input  [DATA_WIDTH-1:0] in1,
  input [DATA_WIDTH-1:0] in2,
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
  			  
  			  
  
	
	always @ (*)
     begin
		case (func3)
    		
          add: if(func7 == 7'b0000000)
					begin
                      C= in1 + in2;
					end// add
				  else
				 	begin
                      C= (in1)-(in2) ;
 					end//sub
 	   	  sll: 
 	   	   begin 
				 C = in1 << in2[4:0];
				 cout = 0;			
		   end //sll
		   
		  slt: begin//slt
			         if($unsigned(in1) < $unsigned(in2))
				         C = 1;
				     else
				         C = 0;
			             cout = 0;
                    end
          sltu: begin
            	     if($signed(in1) < $signed(in2))
				         C = 1;
			     	 else
				         C = 0;
			             cout = 0;	
			        end//sltu
		  x_or: begin // xor
		        	C = in1 ^ in2;
			        cout = 0;			
			      end
		  srl:
			if(func7 == 7'b0000000)
			 begin // srl
			  C = in1 >> in2[4:0];
			  cout = 0;			
			 end
			else
			 begin // sra
              C = $signed(in1) >>> $unsigned(in2[4:0]);
		    	cout = 0;			
			 end
			 
		  o_r: begin //or
		        	C = in1 | in2;
		        	cout = 0;
			end
		 
		  a_nd: 
		 	begin //and
			 C = in1 & in2;
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

	     overflow = (in1[DATA_WIDTH-1] == in2[DATA_WIDTH-1]) && (in1[DATA_WIDTH-1] != C[DATA_WIDTH-1]); 
	
 	 end
 		
endmodule 
