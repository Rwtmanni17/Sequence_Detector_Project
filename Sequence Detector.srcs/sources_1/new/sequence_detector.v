`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2026 13:48:16
// Design Name: 
// Module Name: sequence_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sequence_detector(
input clk,
input rst,
input x,
output reg y

    );
    parameter s0 = 3'b000,
              s1 = 3'b001,
              s2 = 3'b010,
              s3 = 3'b011,
              s4 = 3'b100;
             
             reg [2:0] present_state;
             reg [2:0] next_state;
            
            // state register 
     always@(posedge clk)
     begin
     if(rst)
     present_state <= s0;
     else
     present_state <= next_state;
     end
     
     // Next state logic
     always@(*)
     begin
     case(present_state)
     
     s0:
     if(x)
     next_state = s1;
     else
     next_state = s0;
     
     s1:
     if(x)
     next_state = s1;
     else
     next_state = s2;
     
     s2:
     if(x)
     next_state = s3;
     else
     next_state = s0;
     
     s3:
     if(x)
     next_state = s4;
     else
     next_state = s2;
     
     s4:
     if(x)
     next_state = s1;
     else
     next_state = s0;
     
     default:
     next_state = s0;
     endcase
     end
     // Output logic
     
     always@(*)
     begin
     case(present_state)
     
     s4:
     y = 1'b1;
     default
     y = 1'b0;
     
     endcase
     end
     
    
     endmodule
