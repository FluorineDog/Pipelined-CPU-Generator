`timescale 1ns / 1ps
`include "Core.vh"
// Brief: pipeline stage3, sychronized
// Author: FluorineDog
module SynPS3(
    input clk,
    input rst_n,
    input en,       
    input clear,
    input [4:0] rd_in,
    input regfile_w_en_in,
    input [4:0] regfile_req_w_in,
    input r_datamem_in,
    input [1:0] bht_state_in,
    input is_branch_in,
    output reg [4:0] rd,
    output reg regfile_w_en,
    output reg [4:0] regfile_req_w,
    output reg r_datamem,
    output reg [1:0] bht_state,
    output reg is_branch
);
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin 
            rd <= 0;
            regfile_w_en <= 0;
            regfile_req_w <= 0;
            r_datamem <= 0;
            bht_state <= 0;
            is_branch <= 0;
        end else if(clear) begin
            rd <= 0;
            regfile_w_en <= 0;
            regfile_req_w <= 0;
            r_datamem <= 0;
            bht_state <= 0;
            is_branch <= 0;
        end else if(en) begin
            rd <= rd_in;
            regfile_w_en <= regfile_w_en_in;
            regfile_req_w <= regfile_req_w_in;
            r_datamem <= r_datamem_in;
            bht_state <= bht_state_in;
            is_branch <= is_branch_in;
        end
    end
endmodule
