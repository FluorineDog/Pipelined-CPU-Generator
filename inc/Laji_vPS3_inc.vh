    // dog auto generation
    SynPS3 vPS3(
        .clk(clk),
        .rst_n(rst_n),
        .en(en_vps3),
        .clear(clear_vps3),
        .rd_in(rd_ps2),
        .rd(rd_ps3),
        .regfile_w_en_in(regfile_w_en_ps2),
        .regfile_w_en(regfile_w_en_ps3),
        .regfile_req_w_in(regfile_req_w_ps2),
        .regfile_req_w(regfile_req_w_ps3),
        .r_datamem_in(r_datamem_ps2),
        .r_datamem(r_datamem_ps3),
        .bht_state_in(bht_state_ps2),
        .bht_state(bht_state_ps3),
        .is_branch_in(is_branch_ps2),
        .is_branch(is_branch_ps3)
    );
