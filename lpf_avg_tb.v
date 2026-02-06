`timescale 1ns / 1ps

module tb_lpf_avg;

    reg clk;
    reg rst;
    reg signed [15:0] x_in;
    wire signed [15:0] y_out;

    integer file;
    integer status;

    lpf_avg dut (
        .clk(clk),
        .rst(rst),
        .x_in(x_in),
        .y_out(y_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        x_in = 0;

        file = $fopen("D:\fixed_data.txt", "r");
        #20 rst = 0;

        while (!$feof(file)) begin
            status = $fscanf(file, "%d\n", x_in);
            #10;  
        end

        $fclose(file);
        #20 $finish;
    end

endmodule
