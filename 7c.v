`timescale 1ns / 1ps
 
module lab7_c(
    input CLK100MHZ,
    output CA,
    output CB,
    output CC,
    output CD,
    output CE,
    output CF,
    output CG,
    output DP,
    output [7:0] AN
);
 
    wire CLK_1kHZ;    
 
    create_1kHZ_clock gate0(
        .incoming_CLK100MHZ(CLK100MHZ), 
        .outgoing_CLK1kHZ(CLK_1kHZ)
    );
 
    wire [7:0] CAS;
    assign CA = CAS[0];
    assign CB = CAS[1];
    assign CC = CAS[2];
    assign CD = CAS[3]; 
    assign CE = CAS[4];
    assign CF = CAS[5];
    assign CG = CAS[6];
    assign DP = CAS[7];
    
    drive_7seg_static gate1(
        .clk(CLK_1kHZ), .anodes_7seg(AN), .cathodes_7seg(CAS)
    );
 
endmodule
 
module drive_7seg_static(
    input clk,
    output reg [7:0] anodes_7seg,
    output reg [7:0] cathodes_7seg
);
 
    //8 anodes requires 3 bits  
    reg [2:0] ctr = 3'b000; 
 
    always @(posedge clk) begin
        case (ctr)
          3'b000: begin
                anodes_7seg <= 8'b1111_1110;
                cathodes_7seg <= 8'b1001_1000; // 9
            end
            3'b001: begin
                anodes_7seg <= 8'b1111_1101;
                cathodes_7seg <= 8'b1100_0000; // 0
            end
            3'b010: begin
                anodes_7seg <= 8'b1111_1011;
                cathodes_7seg <= 8'b1011_0000; // 3
            end
            3'b011: begin
                anodes_7seg <= 8'b1111_0111;
                cathodes_7seg <= 8'b1001_0010; // 5
            end
            3'b100: begin
                anodes_7seg <= 8'b1110_1111;
                cathodes_7seg <= 8'b1111_1000; // 7
            end
            3'b101: begin
                anodes_7seg <= 8'b1101_1111;
                cathodes_7seg <= 8'b1000_0011; // 6
            end
            3'b110: begin
                anodes_7seg <= 8'b1011_1111;
                cathodes_7seg <= 8'b1000_0000; // 8
            end
            default: begin
                // Do nothing
            end
        endcase
 
        if (ctr == 7)
            ctr <= 0;
        else
            ctr <= ctr + 1;
    end
endmodule
 
module create_1kHZ_clock(
    input incoming_CLK100MHZ,
    output reg outgoing_CLK1kHZ
);
 
    reg [17:0] ctr = 0;

    always @(posedge incoming_CLK100MHZ) begin
        if (ctr == 99_999) begin
            outgoing_CLK1kHZ <= ~outgoing_CLK1kHZ;
            ctr <= 0;
        end else begin
            ctr <= ctr + 1;
        end
    end
endmodule
