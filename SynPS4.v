`timescale 1ns / 1ps
`include "Core.vh"
// Brief: pipeline stage4, sychronized
// Author: FluorineDog
module SynPS4(
    input clk,
    input rst_n,
    input en,       
    input clear,
    input regfile_w_en_in,
    input [4:0] regfile_req_w_in,
    input r_datamem_in,
    output reg regfile_w_en,
    output reg [4:0] regfile_req_w,
    output reg r_datamem
);
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin 
            regfile_w_en <= 0;
            regfile_req_w <= 0;
            r_datamem <= 0;
        end else if(clear) begin
            regfile_w_en <= 0;
            regfile_req_w <= 0;
            r_datamem <= 0;
        end else if(en) begin
            regfile_w_en <= regfile_w_en_in;
            regfile_req_w <= regfile_req_w_in;
            r_datamem <= r_datamem_in;
        end
    end
endmodule
