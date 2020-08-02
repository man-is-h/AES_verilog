module RotWord(rotword, word);

input [0:31] word;
output reg [0:31] rotword;

always@(word)
begin
rotword[0:23] = word[8:31];
rotword[24:31] = word[0:7];
end 

endmodule