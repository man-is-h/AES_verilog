module rcon(rcon, round);

input [0:3]round;
output reg [0:31] rcon;

always@(round)
    case(round)
        4'h1: rcon= {8'h01, 8'h00, 8'h00, 8'h00};
        4'h2: rcon= {8'h02, 8'h00, 8'h00, 8'h00};
        4'h3: rcon= {8'h04, 8'h00, 8'h00, 8'h00};
        4'h4: rcon= {8'h08, 8'h00, 8'h00, 8'h00};
        4'h5: rcon= {8'h10, 8'h00, 8'h00, 8'h00};
        4'h6: rcon= {8'h20, 8'h00, 8'h00, 8'h00};
        4'h7: rcon= {8'h40, 8'h00, 8'h00, 8'h00};
        4'h8: rcon= {8'h80, 8'h00, 8'h00, 8'h00};
        4'h9: rcon= {8'h1B, 8'h00, 8'h00, 8'h00};
        4'hA: rcon= {8'h36, 8'h00, 8'h00, 8'h00};
        default : rcon= {8'h00, 8'h00, 8'h00, 8'h00};
    endcase   

endmodule