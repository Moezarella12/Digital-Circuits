`timescale 1ns / 1ps

 module lab5_a(
      input [3:0] SW,
      output [1:0] LED,
      output LED16_B,
      output LED16_G,
      output LED16_R
         input [1:0]SW,
         input BTNC,
         output[1:0] LED,
         output LED16_B,
         output LED16_R
     );
    
     assign LED[0] = !SW [0];
     assign LED[1] = SW[1];
     assign LED16_R = (SW[1] & SW[0]);
     assign LED16_B = BTNC;
    
      assign LED[0] = SW[0];
      assign LED[1] = SW[1];
    
      assign LED16_B = SW[2];
      assign LED16_G = SW[3];
      assign LED_R = 1'b1;
    
 endmodule

