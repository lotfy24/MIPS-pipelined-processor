module MIPS_tb();
    reg clk_tb, rst_n_tb;
    integer i;

    MIPS_Piplined DUT(clk_tb, rst_n_tb);
    initial begin
        clk_tb = 0;
        forever #1 clk_tb = ~clk_tb;
    end
    initial begin
        $readmemb("Imem.dat", DUT.Instruction_mem_inst.I_mem);
        $readmemb("Dmem.dat", DUT.Data_mem_inst.D_mem);
        $readmemh("register_file.dat", DUT.Reg_File_inst.reg_file);

        rst_n_tb = 0;
        @(negedge clk_tb);
        @(negedge clk_tb);
        rst_n_tb = 1;
        for (i = 0; i < 100; i = i + 1) begin
                @(negedge clk_tb);
        end
        $stop;
    end
    initial begin
        $monitor("pc = %h,op code = %b,equal_D=%b",DUT.PC_inst.pcf,DUT.Control_Unit_inst.Op_Code,DUT.Is_Equal_inst.Equal_D);
    end
endmodule
