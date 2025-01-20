`timescale 1ns / 1ps


module LFSR(  input clk , rst,output reg out3,out2,out1,out0 );
     
     wire feedback;
      
       assign feedback = out3 ^ out2 ;
       
       always @ (posedge clk or posedge rst)
          begin 
            if (rst) begin
            out3 <= 1'b1; 
            out2 <= 1'b0;
            out1 <= 1'b1;
            out0 <= 1'b0;
        end else begin
            out3 <= out2;    // Shift from Q2 to Q3
            out2 <= out1;    // Shift from Q1 to Q2
            out1 <= out0;    // Shift from Q0 to Q1
            out0 <= feedback; // Feedback goes to Q0
        end
    end
   
endmodule
