 module lab1b(
 input [7:0] SW,
   output [4:0] LED,
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

 endmodule

 module fa(
 input a, b, cin,
 output cout,
 output sum
 );

 assign cout = a&b&cin | ~a&b&cin | a&~b&cin | a&b&~cin;
 assign sum =  a&b&cin | a&~b&~cin | ~a&b&~cin | ~a&~b&cin;

 endmodule
