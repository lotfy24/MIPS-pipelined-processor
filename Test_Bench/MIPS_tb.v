module MIPS_tb;
    reg clk_tb, rst_n_tb;
    integer i;

    // Instantiate the DUT (Device Under Test)
    MIPS_Piplined DUT(clk_tb, rst_n_tb);

    // Clock generation: Toggle every 1 time unit
    initial begin
        clk_tb = 0;
        forever #1 clk_tb = ~clk_tb;
    end

    // Simulation control and stimulus
    initial begin
        // Load memory and register file contents
        $readmemb("Imem.dat", DUT.Instruction_mem_inst.I_mem);
        $readmemb("Dmem.dat", DUT.Data_mem_inst.D_mem);
        $readmemh("register_file.dat", DUT.Reg_File_inst.reg_file);

        // Reset sequence
        rst_n_tb = 0;
        @(negedge clk_tb);
        @(negedge clk_tb);
        rst_n_tb = 1;

        // Display monitoring
        $monitor("Time=%0t | PC=%h | Instr_D=%h | WD_3=%h",
                 $time, DUT.pcf, DUT.Instr_D, DUT.WD_3);

        // Run simulation for 500 cycles
        for (i = 0; i < 500; i = i + 1) begin
            @(negedge clk_tb);
        end

        // Finish simulation
        $stop;
    end
endmodule
