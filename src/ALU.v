module alu (
  input  [31:0] in1,
  input [31:0] in2,
  input  [3:0] func3,
  input  [3:0] func7,
  output  reg [31:0] C,
  output reg zero,
  output reg cout,
  output reg overflow,
  output reg sign
);

	
	always @ (*)
     begin
		case (func3)
    		
          3'b000: if(func7 == 7'b0000000)
					begin
                      C= in1 + in2;
					end// add
				  else
				 	begin
                      C= (in1)-(in2) ;
 					end//sub
 	   	  3'b001: 
 	   	   begin 
				 C = in1 << in2[4:0];
				 cout = 0;			
		   end //sll
		   
		  3'b010: begin//slt
			         if($unsigned(in1) < $unsigned(in2))
				         C = 1;
				     else
				         C = 0;
			             cout = 0;
                    end
          3'b011: begin
            	     if($signed(in1) < $signed(in2))
				         C = 1;
			     	 else
				         C = 0;
			             cout = 0;	
			        end//sltu
		  3'b100: begin // xor
		        	C = in1 ^ in2;
			        cout = 0;			
			      end
		  3'b101:
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
			 
		  3'b110: begin //or
		        	C = in1 | in2;
		        	cout = 0;
			end
		 
		  3'b111: 
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
			
		sign = C[31];

      overflow = (in1[31] == in2[31]) && (in1[31] != C[31]); 
	
 	 end
 		
endmodule 