module lab1d(
  
    input [7:0] SW,
     output [4:0] LED,
     output CA,
     output CB,
     output CC,
     output CD,
     output CE,
     output CF,
     output CG,
  output [7:0] AN,
    );
        
    wire cin;
    wire [3:0] a,b;
    wire [3:0] cout;
    wire [3:0] sum;
  
    assign a[0] = SW[0];
    assign a[1] = SW[1];
    assign a[2] = SW[2];
    assign a[3] = SW[3];
    
    assign b[0] = SW[4];
    assign b[1] = SW[5];
    assign b[2] = SW[6];
    assign b[3] = SW[7];
    
    
    fa add0(.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum(sum[0]));
    fa add1(.a(a[1]), .b(b[1]), .cin(cout[0]), .cout(cout[1]), .sum(sum[1]));
    fa add2(.a(a[2]), .b(b[2]), .cin(cout[1]), .cout(cout[2]), .sum(sum[2]));
    fa add3(.a(a[3]), .b(b[3]), .cin(cout[2]), .cout(cout[3]), .sum(sum[3]));
    
    assign LED[0] = sum[0];
    assign LED[1] = sum[1];
    assign LED[2] = sum[2];
    assign LED[3] = sum[3];
    assign LED[4] = cout[3];


    assign AN[7:0] = 8'b1111_1110;  
    
    display_drive d0(
        .s3(sum[3]), .s2(sum[2]), .s1(sum[1]), .s0(sum[0]),
        .A(CA),.B(CB),.C(CC),.D(CD),.E(CE),.F(CF),.G(CG)	);
endmodule

module fa(
input a, b, cin,
output cout,
output sum
);
  
assign cout = a&b&cin | ~a&b&cin | a&~b&cin | a&b&~cin;
assign sum =  a&b&cin | a&~b&~cin | ~a&b&~cin | ~a&~b&cin;
  
endmodule

module display_drive(
    input s3, s2, s1, s0,
    output A, output B, output C, output D, output E, output F, output G
    );
    wire zero, one, two, three, four, five, six, seven, eight, nine;
    wire h10, h11, h12, h13, h14, h15, h16, h17, h18, h19;
    
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

