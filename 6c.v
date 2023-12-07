 module lab1c(
   
      input [3:0] SW,
      output [3:0] LED,
      output CA,
      output CB,
      output CC,
      output CD,
      output CE,
      output CF,
      output CG,
   output [7:0] AN,
     );
     
     assign AN[7:0] = 8'b1111_1110;  
     assign LED[3:0] = SW[3:0];
    
     display_drive d0(
         .s3(SW[3]), .s2(SW[2]), .s1(SW[1]), .s0(SW[0]),
         .A(CA),.B(CB),.C(CC),.D(CD),.E(CE),.F(CF),.G(CG)	);
 endmodule

 module display_drive(
   
     input s0, s1, s2, s3,
     output A, output B, output C, output D, output E, output F, output G
     );
   
     wire zero, one, two, three, four, five, six, seven, eight, nine, h10, h11, h12, h13, h14, h15;
   
     assign zero = ~s3 & ~s2 & ~s1 & ~s0;
     assign one = ~s3 & ~s2 & ~s1 & s0;
     assign two = ~s3 & ~s2 & s1 & ~s0;
     assign three = ~s3 & ~s2 & s1 & s0;
     assign four = ~s3 & s2 & ~s1 & ~s0;
     assign five = ~s3 & s2 & ~s1 & s0;
     assign six = ~s3 & s2 & s1 & ~s0;
     assign seven = ~s3 & s2 & s1 & s0;
     assign eight = s3 & ~s2 & ~s1 & ~s0;
     assign nine = s3 & ~s2 & ~s1 & s0;
     assign h10 = s3 & ~s2 & s1 & ~s0;
     assign h11 = s3 & ~s2 & s1 & s0;
     assign h12 = s3 & s2 & ~s1 & ~s0;
     assign h13 = s3 & s2 & ~s1 & s0;
     assign h14 = s3 & s2 & s1 & ~s0;
     assign h15 = s3 & s2 & s1 & s0;
   
     assign A = one | four | h10 | h11 | h12 | h13;
     assign B = five | six | h10 | h11 | h12 | h14 | h15;
     assign C = two | h12 | h14 | h15;
     assign D = one | four | seven | nine | h15;
     assign E = one | three | four | five | seven | nine;
     assign F = one | two | three | seven | h10 | h12 | h13;
     assign G = zero | one | seven;   
 endmodule
