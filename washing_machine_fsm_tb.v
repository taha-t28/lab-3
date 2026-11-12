`timescale 1ns / 1ps

module washing_machine_fsm_tb;
    reg clk, rst, button;
    wire [6:0] led;
    integer i;

    washing_machine_fsm dut (
        .clk(clk),
        .rst(rst),
        .button(button),
        .led(led)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        rst = 1; button = 0;
        #20 rst = 0;

        for (i = 0; i < 8; i = i + 1) begin
            #20 button = 1;
            #20 button = 0;
        end

        #20 rst = 1;
        #20 rst = 0;

        #20 $finish;
    end
endmodule