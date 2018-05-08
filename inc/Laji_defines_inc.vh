wire [31:0] inst_ps0, inst_ps1;
wire [5:0] opcode, funct;
wire [4:0] rt;
reg [4:0] regfile_req_b_ps1;          // conbinatorial 
wire [4:0] rd_ps1, rd_ps2, rd_ps3;
wire regfile_w_en_ps1, regfile_w_en_ps2, regfile_w_en_ps3, regfile_w_en_ps4;
wire [4:0] regfile_req_w_ps2, regfile_req_w_ps3, regfile_req_w_ps4;
reg [31:0] regfile_data_w_ps4;  // combinatorial
wire r_datamem_ps1, r_datamem_ps2, r_datamem_ps3, r_datamem_ps4;
wire bubble;
wire [1:0] bht_state_ps0, bht_state_ps1, bht_state_ps2, bht_state_ps3; 
wire is_branch_ps1, is_branch_ps2, is_branch_ps3;
wire pred_succ, pred_succ_tmp;
wire intr_jmp;
wire clear_vps1, clear_vps2, clear_vps3, clear_vps4;
// to be continued