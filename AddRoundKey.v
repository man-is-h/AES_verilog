`include "RotWord.v"
`include "sbox.v"

module AddRoundKey(rk, prk, rcon);

input [0:127] prk;
input [0:31] rcon; // round constant = (2exp(round -1) in hexadecimal) eg. for round 5 rcon = 10 00 00 00
output reg [0:127] rk; // calculated key for this round

wire [0:31] x;
wire [0:31] y;
wire [0:31] z;

RotWord r(x, prk[96:127]); // A B C D becomes B C D A

sbox sub1(y[0:7], x[0:7]); // substitution using sbox
sbox sub2(y[8:15], x[8:15]);
sbox sub3(y[16:23], x[16:23]);
sbox sub4(y[24:31], x[24:31]);

assign z = y^rcon; //Auxiliary function used to calculate key for this round.

always@(z or prk)
begin
    
    rk[0:31] = z ^ prk[0:31];
    rk[32:63] = rk[0:31] ^ prk[32:63];
    rk[64:95] = rk[32:63] ^ prk[64:95];
    rk[96:127] = rk[64:95] ^ prk[96:127];

end

endmodule