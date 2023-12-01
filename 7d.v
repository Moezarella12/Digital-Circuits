
module lab7_d( 
 
    input CLK100MHZ, 
    output [1:2] JD, 
    output LED16_R,
    output LED16_G,
    output LED16_B, 
    input [11:0]SW
    ); 
 
wire CLK_10HZ;     
reg [4:0] ctr=0; 
reg red;  
reg green; 
reg blue;
 
assign LED16_R = red;
assign LED16_G = green;
assign LED16_B = blue;
 
create_10HZ_clock  gate0(CLK100MHZ, CLK_10HZ); 
 
      always @(posedge CLK_10HZ) begin 
        if(ctr == 0) begin 
        if(SW[3:0] != 0) begin
        red <= 1'b1;
        end
        if(SW[7:4] != 0) begin
        green <= 1'b1;
        end
         if(SW[11:8] != 0) begin
        blue <= 1'b1;
        end
            ctr <= ctr + 1;             
        end
        
         if(ctr == SW[3:0]) begin 
            red <= 1'b0;
            
         end
         if(ctr == SW[7:4]) begin 
   
            green <= 1'b0;
        end
        
        if(ctr == SW[11:8]) begin 
            blue <= 1'b0;
            
          end
         if(ctr == 15) begin 
 
            red <= 1'b0;
            blue <= 1'b0;
            green <= 1'b0;
 
            ctr <= ctr + 1; 
            
        end else if(ctr == 31) begin 
        //all off
        ctr <= 0; 
        end else begin 
            ctr <= ctr + 1; 
        end          
    end 

    wire CLK_10HZ;   
  
endmodule 
 
module create_10HZ_clock( 
 
    input incoming_CLK100MHZ, 
    output reg outgoing_CLK10HZ
    ); 
 
    // 100MHZ is 10ns cycles.  If I want 100HZ output,  
    // I need to count 100M/100 = 1e6 cycles = 1_000_000 cycles 10_000_000 
    // 2^20 = 1_048_576 
 
  reg [14:0] ctr=0; 
  
    always @ (posedge incoming_CLK100MHZ) begin 
 
        if(ctr == 0_0000) begin 
            outgoing_CLK10HZ <= 1'b1; 
            ctr <= ctr + 1;             
        end else if(ctr == 4999) begin 
            outgoing_CLK10HZ <=1'b0; 
            ctr <= ctr + 1; 
        end else if(ctr == 9999) begin 
        //all off 
        outgoing_CLK10HZ <= 1'b1; 
        ctr <= 0; 
        end else begin 
            ctr <= ctr + 1; 
        end          
    end 
endmodule
