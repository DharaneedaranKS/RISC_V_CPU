module alu_tb;

    reg [31:0] in1, in2;
    reg [3:0] func3, func7;
    wire [31:0] C;
    wire zero, cout, overflow, sign;

    alu alu_inst (
        .in1(in1),
        .in2(in2),
        .func3(func3),
        .func7(func7),
        .C(C),
        .zero(zero),
        .cout(cout),
        .overflow(overflow),
        .sign(sign)
    );

    initial begin
        // Test case 1: Addition
        in1 = 32'h00000001;
        in2 = 32'h00000002;
        func3 = 4'b0000;
        func7 = 7'b0000000;
        #10;
        
        $display("Expected output = %h", in1 + in2);
        
        $display("");

 
        $display("Expected output = %h", in1 << in2[4:0]);
        
        $display("");
    end 
   initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule