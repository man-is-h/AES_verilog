module ShiftRows(sr_mat , mat);

input [0:127] mat; // matrix in column major form 4x4
output reg [0:127] sr_mat; // here combinations of 8-bits form 1 element of matrix

/*

   | -------------
   | |00|01|02|03|
   | -------------
   | |10|11|12|13|
   | -------------
   | |20|21|22|23|
   | -------------
   V |30|31|32|33|
*/


/*  [0:31] = 1st column
    [32:63] = 2nd column
    [64:95] = 3rd column
    [96:127] = 4th column */

// (a[i,j] = a[(32*j + 8*i) : upto 8 bits])
/*assign sr_mat[0:7] = mat[0:7];
assign sr_mat[8:15] = mat[40:47];
assign sr_mat[16:23] = mat[80:87];
assign sr_mat[24:31] = mat[120:127];

assign sr_mat[32:39] = mat[32:39];
assign sr_mat[40:47] = mat[48:55];
assign sr_mat[48:55] = mat[112:119];
assign sr_mat[56:63] = mat[24:31];

assign sr_mat[64:71] = mat[64:71];
assign sr_mat[72:79] = mat[104:111];
assign sr_mat[80:87] = mat[16:23];
assign sr_mat[88:95] = mat[56:63];

assign sr_mat[96:103] = mat[96:103];
assign sr_mat[104:111] = mat[8:15];
assign sr_mat[112:119] = mat[48:55];
assign sr_mat[120:127] = mat[88:95];*/

always @ (mat)
begin 
sr_mat[0:7] = mat[0:7];
sr_mat[8:15] = mat[40:47];
sr_mat[16:23] = mat[80:87];
sr_mat[24:31] = mat[120:127];

sr_mat[32:39] = mat[32:39];
sr_mat[40:47] = mat[72:79];
sr_mat[48:55] = mat[112:119];
sr_mat[56:63] = mat[24:31];

sr_mat[64:71] = mat[64:71];
sr_mat[72:79] = mat[104:111];
sr_mat[80:87] = mat[16:23];
sr_mat[88:95] = mat[56:63];

sr_mat[96:103] = mat[96:103];
sr_mat[104:111] = mat[8:15];
sr_mat[112:119] = mat[48:55];
sr_mat[120:127] = mat[88:95];
end


endmodule
