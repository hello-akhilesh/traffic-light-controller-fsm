module tb_traffic_light;

    reg clk;
    reg reset;
    wire red, green, yellow;

    traffic_light dut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .green(green),
        .yellow(yellow)
    );

    // Clock: 10 ns period (simulated time)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light);

        reset = 1;
        #10 reset = 0;

        #1000;   // let FSM run
        $finish;
    end

endmodule
