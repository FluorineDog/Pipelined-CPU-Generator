`timescale 1ns / 1ps

`define BIT_WIDTH
// Brief: CPU Top Module, synchronized
// Author: EAirPeter
module SynLajiIntelKnightsLanding(
    input clk, 
    input rst_n, 
    input en
);

    `include "inc/Laji_defines_inc.vh"

    // YOUR CODE FOR STAGE 0 HERE

    ////////////////////////////
    ///////   ps1 IF/ID  ////////
    assign en_vps1 = 0;
    assign clear_vps1 = 0;
    `include "inc/Laji_vPS1_inc.vh"
    ////////////////////////////
    
    // YOUR CODE FOR STAGE 1 HERE
    // code to use xxxx_ps1

    /////////////////////////////
    ///////   ps2 ID/EX  ////////
    assign en_vps2 = 0;
    assign clear_vps2 = 0;
    `include "inc/Laji_vPS2_inc.vh"
    /////////////////////////////

    //YOUR CODE FOR STAGE 2 HERE
    // code to use xxxx_ps2

    /////////////////////////////
    ///////   ps3 EX/DM  ////////
    assign en_vps3 = 0;
    assign clear_vps3 = 0;
    `include "inc/Laji_vPS3_inc.vh"
    ////////////////////////////

    // YOUR CODE FOR STAGE 3 HERE   
    // code to use xxxx_ps3

    ///////////////////////
    //////write back///////
    assign en_vps4 = 0;
    assign clear_vps4 = 0;
    `include "inc/Laji_vPS4_inc.vh"
    //////////////////////

    // YOUR CODE FOR STAGE 4 HERE
    // code to use xxxx_ps4

endmodule

