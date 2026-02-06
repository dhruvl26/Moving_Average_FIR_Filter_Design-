module lpf_avg (
    input  wire clk,
    input  wire rst,
    input  wire signed [15:0] x_in, 
    output reg  signed [15:0] y_out  
);

    reg signed [15:0] x1;   
    reg signed [15:0] x2;   
    reg signed [15:0] x3;  

    reg signed [17:0] sum; 

    always @(posedge clk) 
    begin
        if (rst) 
        begin
            x1 <= 0;
            x2 <= 0;
            x3 <= 0;
            y_out <= 0;
        end 
        else 
        begin
            x3 <= x2;
            x2 <= x1;
            x1 <= x_in;

            sum = x_in + x1 + x2 + x3;
            y_out <= sum >>> 2;
        end
    end

endmodule
