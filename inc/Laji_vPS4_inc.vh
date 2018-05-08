    // dog auto generation
    SynPS4 vPS4(
        .clk(clk),
        .rst_n(rst_n),
        .en(en_vps4),
        .clear(clear_vps4),
        .regfile_w_en_in(regfile_w_en_ps3),
        .regfile_w_en(regfile_w_en_ps4),
        .regfile_req_w_in(regfile_req_w_ps3),
        .regfile_req_w(regfile_req_w_ps4),
        .r_datamem_in(r_datamem_ps3),
        .r_datamem(r_datamem_ps4)
    );
