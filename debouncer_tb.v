`timescale 1ns / 1ps

module debouncer_tb;
    reg clk, rst, button;
    wire debounced_button;

    debouncer dut (
        .clk(clk),
        .rst(rst),
        .button(button),
        .debounced_button(debounced_button)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        rst = 1; button = 0;
        #20 rst = 0;

        #50 button = 1;
        #500 button = 0;

        #50 button = 1;
        #30 button = 0;

        #100 $finish;
    end
endmodule