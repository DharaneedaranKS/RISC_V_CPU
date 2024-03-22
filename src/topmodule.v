module riscv_top (
    input clk, reset, // Clock and reset signals
    output [31:0] pc, // Program counter output
    input [31:0] instruction, // Instruction input from memory
    output [31:0] alu_result, // ALU result output
    output [31:0] mem_addr, // Memory address output
    output [31:0] mem_data, // Memory data output
    output reg mem_write // Memory write enable output
);

    // Pipeline registers
    //reg [31:0] pc_reg, instruction_reg, alu_result_reg, mem_addr_reg, mem_data_reg;
    //reg mem_write_reg;

    // Program counter module
    pc_module pc_module (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .pc_next(pc_reg)
    );

    // Instruction fetch module
    if_module if_module 
        (
        .clk(clk),
        .reset(reset),
        .jump(jump),
        .instruction(instruction)
        );

    // Instruction decode module
    id_module id_module 
        (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .imm(imm),
        .opcode(opcode)
        );

    // Register file module
    reg_file reg_file 
        (
        .clk(clk),
        .reset(reset),
        .read_en(read_en)
        .write_en(write_en),
        .data_read_1(data_read_1),
        .data_read_2(data_read_2),
        .data_in(data_in),
	    .data_out_1(data_out_1),
	    .data_out_2(data_out_2)
        );

    // ALU module
    alu_module alu_module (
        .clk(clk),
        .reset(reset),
        .rs1(rs1),
        .rs2(rs2),
        .imm(imm),
        .func3(func3),
        .func7(func7),
        .C(C),
        .zero(zero),
	.cout(cout),
	.overflow(overflow),
	.sign(sign)
    );

    // Memory access module
    mem_module mem_module (
        .clk(clk),
        .reset(reset),
        .alu_result(alu_result_reg),
        .rs2(rs2),
        .mem_op(mem_op),
        .mem_size(mem_size),
        .mem_sign(mem_sign),
        .mem_addr(mem_addr),
        .mem_addr_next(mem_addr_reg),
        .mem_data(mem_data),
        .mem_data_next(mem_data_reg),
        .mem_write(mem_write),
        .mem_write_next(mem_write_reg)
    );

    // Write back module
    wb_module wb_module (
        .clk(clk),
        .reset(reset),
        .mem_data(mem_data_reg),
        .alu_result(alu_result_reg),
        .mem_op(mem_op),
        .write_data(write_data)
    );

    // Branch and jump module
    bj_module bj_module 
     (
        .clk(clk),
        .reset(reset),
        .data_rs1(data_rs1),
	    .data_rs2(data_rs2),
        .imm(imm),
        .zero(zero),
        .func3(func3),
        .jump(jump),
        .opcode(opcode)
        
     );

endmodule
