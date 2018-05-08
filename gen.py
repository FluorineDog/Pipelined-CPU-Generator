#!/bin/python3
import re
pattern = re.compile(r"^(wire|reg) +(\[.*\])?(.*);")

table = [[] for i in range(0, 6)]
header = """`timescale 1ns / 1ps
`include "Core.vh"
// Brief: pipeline stage{0}, sychronized
// Author: FluorineDog
module SynPS{0}(
    input clk,
    input rst_n,
    input en,       
    input clear,
{1}
);
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin 
{2}
        end else if(clear) begin
{2}
        end else if(en) begin
{3}
        end
    end
endmodule
"""
defines_file = "inc/Laji_defines_inc.vh"
with open(defines_file) as file:
    for line in file.readlines():
        ans = pattern.match(line)
        if not ans:
            continue
        ans = ans.groups()
        width = ans[1]
        keywords = ans[2]
        # print(width, keywords)
        keywords = keywords.replace(",", " ")
        for word in keywords.split(): 
            if word[-4:-1] == "_ps":
                # print(word[-1:])
                table[int(word[-1])].append((word, width))

tab = "    "
tab2 = tab + tab
tab3 = tab + tab + tab

header2 = """    // dog auto generation
    SynPS{0} vPS{0}(
        .clk(clk),
        .rst_n(rst_n),
        .en(en_vps{0}),
        .clear(clear_vps{0}),
{1}
    );
"""

def gen(key_list, index):
    input_lines = []
    output_lines = []
    rst_lines = []
    pc_4_lines = []
    assign_lines = []

    for word, width in key_list:
        width = "" if width == None else width + " "
        input_lines.append(tab + "input " + width + word + "_in")
        output_lines.append(tab + "output reg " + width + word)
        rst_lines.append(tab3 + word + " <= 0;")
        pc_4_lines.append(tab3 + "%s <= %s_in;" % (word, word))
        assign_lines.append(tab2 + ".%s_in(%s_ps%d)" % (word, word, index))
        assign_lines.append(tab2 + ".%s(%s_ps%d)" % (word, word, index + 1))


    index += 1

    arg1 = ",\n".join(input_lines + output_lines)
    arg2 = "\n".join(rst_lines)
    arg3 = "\n".join(pc_4_lines)
    # modify for your interest
    filename = "SynPS%d.v" % index 
    with open(filename, "w") as file:
        file.write(header.format(index, arg1, arg2, arg3))

    arg1 = ",\n".join(assign_lines)
    # modify for your interest
    filename = "inc/Laji_vPS%d_inc.vh" % index
    with open(filename, "w") as file:
        file.write(header2.format(index, arg1))
    
for src in range(0, 5):
    if src == 4:
        continue
    dest = src + 1
    key_list = []
    for word_src, width in table[src]:
        word_dest = word_src[:-1] + str(dest)
        if (word_dest, width) in table[dest]:
            key_list.append((word_src[:-4], width))
    gen(key_list, src)
