`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 12:02:50
// Design Name: 
// Module Name: fifo
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


module fifo(
    input clk,
    input rst,
    input wr,
    input rd,
    input [7:0] din,
    output reg [7:0] dout,
    output empty,
    output full
    );

    reg [3:0] wptr =0 , rptr = 0;
    reg [4:0] cnt;
    reg [7:0] mem[15:0];

    always @(posedge clk) begin
        if(rst == 1'b1) begin
            wptr <= 4'b0;
            rptr <= 4'b0;
            cnt <= 5'b0;
        end
        else if(wr && !full) begin
            mem[wptr] <= din;
            wptr <= wptr + 1'b1;
            cnt <= cnt + 1'b1;
        end
        else if(rd && !empty) begin
            dout <= mem[rptr];
            rptr <= rptr + 1'b1;
            cnt <= cnt - 1'b1;
        end
    end

    assign empty = (cnt == 0) ? 1'b1 : 1'b0;
    assign full = (cnt == 16) ? 1'b1 : 1'b0;

endmodule

interface fifo_if;
    
    logic clk;
    logic rst;
    logic rd;
    logic wr;
    logic [7:0] din;
    logic [7:0] dout;
    logic full;
    logic empty;

endinterface