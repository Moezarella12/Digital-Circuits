 module lab1(
 input a, b,
 input cin,
 output cout,
 output sum
 );

 fa add0(.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

 endmodule

 module fa(
 input a, b, cin,
 output cout,
 output sum
 );

 assign cout = a&b&cin | ~a&b&cin | a&~b&cin | a&b&~cin;
 assign sum =  a&b&cin | a&~b&~cin | ~a&b&~cin | ~a&~b&cin;

 endmodule
