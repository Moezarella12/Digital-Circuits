module lab5_b(
  
    input [3:0] SW,
    output LED16_B,
    output LED16_R,
    output LED16_G
);
    wire e,f,g;
    wire a1,a0,b1,b0;
    
    assign a0 = SW[0];
    assign a1 = SW[1];
    assign b0 = SW[2];
    assign b1 = SW[3];
    
    assign LED16_R = e;
    assign LED16_B = f;
    assign LED16_G = g;

    assign e = !(a1 ^ b1) & !(a0 ^ b0);
    assign f = (a1 & !b1) | ((a1 & b1) & (a0 & !b0));
    assign g = (!a1 & b1) | ((a1 & b1) & (a0 & b0));;

endmodule
