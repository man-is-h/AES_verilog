`include "mix_cols.v"

module MixColumns(mc_mat,mat);

input [0:127] mat;
output [0:127] mc_mat;


    mix_cols m1(mat[0:31], mc_mat[0:31]);
    mix_cols m2(mat[32:63], mc_mat[32:63]);
    mix_cols m3(mat[64:95], mc_mat[64:95]);
    mix_cols m4(mat[96:127], mc_mat[96:127]);


endmodule