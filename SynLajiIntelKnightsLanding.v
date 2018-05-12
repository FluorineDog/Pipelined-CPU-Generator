`timescale 1ns / 1ps

// Brief: CPU Top Module, synchronized
// Main-Author: EAirPeter
// co-Author: Fluorine Dog, cuishaobo, AzureCrab, ghy
module SynLajiIntelKnightsLanding(
    input clk, 
    input rst_n, 
    input en
);

    `include "inc/Laji_defines_inc.vh"

    // YOUR CODE FOR STAGE 0 HERE

    ////////////////////////////
    ///////   ps1 IF/ID  ////////
    assign en_vps1 = 1;
    assign clear_vps1 = 1; 
    `include "inc/Laji_vPS1_inc.vh"
    ////////////////////////////
    
    // YOUR CODE FOR STAGE 1 HERE
    // code to use or generate xxxx_ps1

    /////////////////////////////
    ///////   ps2 ID/EX  ////////
    assign en_vps2 = 1;
    assign clear_vps2 = 1;
    `include "inc/Laji_vPS2_inc.vh"
    /////////////////////////////

    // YOUR CODE FOR STAGE 2 HERE
    // code to use or generate xxxx_ps2

    /////////////////////////////
    ///////   ps3 EX/MEM  ////////
    assign en_vps3 = 1;
    assign clear_vps3 = 1;
    `include "inc/Laji_vPS3_inc.vh"
    ////////////////////////////

    // YOUR CODE FOR STAGE 3 HERE   
    // code to use or generate xxxx_ps3

    //////////////////////////////
    //////   ps4 MEM/WB  /////////
    assign en_vps4 = 1;
    assign clear_vps4 = 1;
    `include "inc/Laji_vPS4_inc.vh"
    //////////////////////////////

    // YOUR CODE FOR STAGE 4 HERE
    // code to use or generate xxxx_ps4

endmodule

