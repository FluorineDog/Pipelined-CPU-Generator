    // dog auto generation
    SynPS2 vPS2(
        .clk(clk),
        .rst_n(rst_n),
        .en(en_vps2),
        .clear(clear_vps2),
        .rd_in(rd_ps1),
        .rd(rd_ps2),
        .regfile_w_en_in(regfile_w_en_ps1),
        .regfile_w_en(regfile_w_en_ps2),
        .r_datamem_in(r_datamem_ps1),
        .r_datamem(r_datamem_ps2),
        .bht_state_in(bht_state_ps1),
        .bht_state(bht_state_ps2),
        .is_branch_in(is_branch_ps1),
        .is_branch(is_branch_ps2)
    );
