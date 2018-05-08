`timescale 1ns / 1ps
`include "Core.vh"
// Brief: pipeline stage1, sychronized
// Author: FluorineDog
module SynPS1(
    input clk,
    input rst_n,
    input en,       
    input clear,
    input [31:0] inst_in,
    input [1:0] bht_state_in,
    output reg [31:0] inst,
    output reg [1:0] bht_state
);
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin 
            inst <= 0;
            bht_state <= 0;
        end else if(clear) begin
            inst <= 0;
            bht_state <= 0;
        end else if(en) begin
            inst <= inst_in;
            bht_state <= bht_state_in;
        end
    end
endmodule
