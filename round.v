`include "ShiftRows.v"
`include "MixColumns.v"
`include "rcon.v"
`include "AddRoundKey.v"

module round(rkey, state_out, rn, state, prkey) ;

input [0:3] rn; // round number
input [0:127] state, prkey;
output [0:127] rkey, state_out;

wire [0:127] sub, sr, mixc, rkey;
wire [0:31] rcon;

// sub bytes
sbox s0(sub[0:7], state[0:7]);
sbox s1(sub[8:15], state[8:15]);
sbox s2(sub[16:23], state[16:23]);
sbox s3(sub[24:31], state[24:31]);

sbox s4(sub[32:39], state[32:39]);
sbox s5(sub[40:47], state[40:47]);
sbox s6(sub[48:55], state[48:55]);
sbox s7(sub[56:63], state[56:63]);

sbox s8(sub[64:71], state[64:71]);
sbox s9(sub[72:79], state[72:79]);
sbox s10(sub[80:87], state[80:87]);
sbox s11(sub[88:95], state[88:95]);

sbox s12(sub[96:103], state[96:103]);
sbox s13(sub[104:111], state[104:111]);
sbox s14(sub[112:119], state[112:119]);
sbox s15(sub[120:127], state[120:127]);

//SubBytes s(sub, state);
ShiftRows shr(sr, sub);
MixColumns mc(mixc, sr);
rcon r(rcon, rn);
AddRoundKey k(rkey, prkey, rcon);

assign state_out = mixc ^ rkey;

endmodule