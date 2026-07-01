`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2026 23:21:23
// Design Name: 
// Module Name: sequence_det_tb
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


module sequence_det_tb();
reg clk,rst,x;
wire y;

sequence_detector dut(clk,rst,x,y);

initial
begin
clk = 0;
end

always #5 clk = ~clk;
initial
begin
$monitor("clk is %b,rst is %b,x is %b,y is %b",clk,rst,x,y);

rst = 1; // giving reset 
x = 0;
#10;

rst = 0; // now the clk is reset
// 1011 sequence
x = 1;
#10;
x = 0;
#10;
x = 1;
#10;
x = 1;
#10
//another sequence for testing purpose
x = 0;
#10;
x = 1;
#10;
x = 0;
#10;
x = 1;
#10;
x = 1;
#10;

#20;
$finish;

end
    
endmodule
