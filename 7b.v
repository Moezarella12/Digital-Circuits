module lab7_b(
    input CLK100MHZ,
    output [1:2] JD,
    output [1:0] LED
    
    );
    
    wire CLK_10HZ;    
    
    // the brigntnesses on these two pins should differ
    assign LED[0] = 1'b1;
    assign LED[1] = CLK_10HZ;
    assign LED[2] = CLK100MHZ;
             
  // sending oth clocks to the PMOD pins on the lower JA header
    assign JD[1] = CLK100MHZ;
    assign JD[2] = CLK_10HZ;
 
    create_10HZ_clock  gate0(CLK100MHZ, CLK_10HZ);
 
endmodule
 
module create_10HZ_clock(
    input incoming_CLK100MHZ,
    output reg outgoing_CLK10HZ
    );
    
    // 100MHZ is 10ns cycles.  If I want 100HZ output, 
    // I need to count 100M/100 = 1e6 cycles = 1_000_000 cycles 10_000_000
    // 2^20 = 1_048_576
    
    reg [24:0] ctr=0;
    
    always @ (posedge incoming_CLK100MHZ) begin
        if(ctr==4_999_999) begin
            outgoing_CLK10HZ <= 1'b0;
            ctr <= ctr + 1;            
        end else if(ctr==9_999_999) begin
            outgoing_CLK10HZ <= 1'b1;
            ctr <= 0;
        end else begin
            ctr <= ctr + 1;
        end         
    end
endmodule
