    // dog auto generation
    SynPS1 vPS1(
        .clk(clk),
        .rst_n(rst_n),
        .en(en_vps1),
        .clear(clear_vps1),
        .inst_in(inst_ps0),
        .inst(inst_ps1),
        .bht_state_in(bht_state_ps0),
        .bht_state(bht_state_ps1)
    );
