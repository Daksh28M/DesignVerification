`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 17:08:14
// Design Name: 
// Module Name: dff
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


module dff(dff_if vif);

    always @(posedge vif.clk) begin
        if(vif.rst)
            vif.dout <= 1'b0;
        else if (vif.din >= 1'b0)
            vif.dout <= vif.din;
        else
            vif.dout <= 1'b0;
    end
endmodule

interface dff_if;
    logic clk;
    logic rst;
    logic din;
    logic dout;
endinterface