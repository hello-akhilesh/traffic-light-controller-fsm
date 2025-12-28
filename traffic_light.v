module traffic_light (
    input clk,
    input reset,
    output reg red,
    output reg green,
    output reg yellow
);

    // State encoding
    localparam S_RED    = 2'b00;
    localparam S_GREEN  = 2'b01;
    localparam S_YELLOW = 2'b10;

    reg [1:0] state, next_state;
    reg [3:0] timer;   // enough to count up to 10

    // State & timer register
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S_RED;
            timer <= 0;
        end else begin
            state <= next_state;
            if (state != next_state)
                timer <= 0;
            else
                timer <= timer + 1;
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            S_RED:    if (timer == 9)  next_state = S_GREEN;   // 10 cycles
            S_GREEN:  if (timer == 7)  next_state = S_YELLOW;  // 8 cycles
            S_YELLOW: if (timer == 3)  next_state = S_RED;     // 4 cycles
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        red = 0; green = 0; yellow = 0;
        case (state)
            S_RED:    red    = 1;
            S_GREEN:  green  = 1;
            S_YELLOW: yellow = 1;
        endcase
    end

endmodule
