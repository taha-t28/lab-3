`timescale 1ns / 1ps

module washing_machine_top_tb;
    reg CLK100MHZ, CPU_RESETN, BTNC;
    wire [6:0] LED;
    integer i;

    washing_machine_top dut (
        .CLK100MHZ(CLK100MHZ),
        .CPU_RESETN(CPU_RESETN),
        .BTNC(BTNC),
        .LED(LED)
    );

    initial CLK100MHZ = 0;
    always #5 CLK100MHZ = ~CLK100MHZ;

    initial begin

        CPU_RESETN = 0; BTNC = 0;
        #20 CPU_RESETN = 1;

        for (i = 0; i < 8; i = i + 1) begin
            #50 BTNC = 1;
            #100 BTNC = 0;
        end

        #50 CPU_RESETN = 0;
        #20 CPU_RESETN = 1;

        #50 $finish;
    end
endmodule