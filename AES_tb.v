`timescale 1ns/1ps
`include "AES.v"
module AES_tb;

    reg [0:127] state, key;
    wire [0:127] s_out, k_out;

    AES crypt(k_out, s_out, key, state);

    initial #50 $finish;
    initial
    begin 
    fork
    $monitor("a = %h, b= %h, c= %h, d=%h", state, key, s_out, k_out);
    $dumpfile("AES_tb.vcd");
    $dumpvars(0, AES_tb);
    //#0 state = 128'h00_04_12_14_12_04_12_00_0C_00_13_11_08_23_19_19 ;
    //#0 key =  128'h0F_15_71_C9_47_D9_E8_59_0C_B7_AD_D6_AF_7F_67_98 ;
    #0 state = 128'h54_77_6F_20_4F_6E_65_20_4E_69_6E_65_20_54_77_6F;
    #0 key = 128'h54_68_61_74_73_20_6D_79_20_4B_75_6E_67_20_46_75;

    join
    end
endmodule