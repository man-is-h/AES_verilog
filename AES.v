`include "round_last.v"

module AES(key_out, state_out, key_in, state_in);
input [0:127] state_in, key_in;
output [0:127] state_out, key_out;

wire [0:127] key1, key2, key3, key4, key5, key6, key7, key8, key9;
wire [0:127] s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s_out;

assign s0 = state_in ^ key_in;

round r1(key1, s1, 4'h1, s0, key_in); //round(rkey, state_out, rn, state, prkey) ;
round r2(key2, s2, 4'h2, s1, key1);
round r3(key3, s3, 4'h3, s2, key2);
round r4(key4, s4, 4'h4, s3, key3);
round r5(key5, s5, 4'h5, s4, key4);
round r6(key6, s6, 4'h6, s5, key5);
round r7(key7, s7, 4'h7, s6, key6);
round r8(key8, s8, 4'h8, s7, key7);
round r9(key9, s9, 4'h9, s8, key8);
round_last r10(key_out, state_out, 4'hA, s9, key9);

endmodule
