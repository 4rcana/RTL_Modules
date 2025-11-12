`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2025 01:57:09 PM
// Design Name: 
// Module Name: clk_to_500
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_to_500(
    input clk,
    input rst,
    output reg clk_500
    );

    localparam DIVISOR = 400_000;  // ( 100 MHz / 400,000 ) * 2 = 500 Hz

    reg [18:0] counter;  // log2(400000) ≈ 19 bits

    always @(posedge clk) begin
        if (rst) begin
            counter <= 0;
            clk_500 <= 0;
        end else begin
            if (counter == (DIVISOR / 2 - 1)) begin
                counter <= 0;
                clk_500 <= ~clk_500;  // toggle output clock
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
