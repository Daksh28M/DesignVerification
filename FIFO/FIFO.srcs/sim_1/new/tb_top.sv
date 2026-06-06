`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 13:34:21
// Design Name: 
// Module Name: tb_top
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

class transaction
    rand bit oper;

    bit clk;
    bit rst;
    bit wr;
    bit rd;
    bit [7:0] din;
    bit [7:0] dout;
    bit empty;
    bit full;

    function void display(input string tag);
        $display("[%0s] : wr : %0b rd: %0b data_in: %0d data_out: %0d empty: %0b full: %0b",tag,wr,rd,din,dout,empty,full);
    endfunction

    constraint oper_ctrl {
        oper dist{1:/50 , 0:/50};
    }
endclass

class generator
    transaction tr;
    mailbox #(transaction) mbx;

    int count = 0;
    int i = 0;

    event next;
    event done;

    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
        tr = new();
    endfunction

    task run();
        repeat(count) begin
            assert(tr.randomize) else $display("Randomiaztion Failed.");
            i++;
            mbx.put(tr);
            $display("[GEN]: Oper: %0d iteration: %0d",tr.oper,i);
            @(next);
        end
        ->done;
    endtask
endclass

class driver;
    virtual fifo_if fif;
    mailbox #(transaction) mbx;

    transaction datac;

    event next;

    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task reset();
        fif.rst <= 1'b1;
        fif.rd <= 1'b0;
        fif.wr <= 1'b0;
        fif.din <= 8'b0;
        repeat(5) @(posedge fif.clk);
        fif.rst <= 1'b0;
        $display("[DRV]: RESET DONE");
        $display("---------------------------------");
    endtask

    task write();
        @(posedge fif.clk);
        fif.rst <= 1'b0;
        fif.rd <= 1'b0;
        fif.wr <= 1'b1;
        fif.din <= urandom_range([1:255]);
        @(posedge fif.clk);
        fif.wr <= 1'b0;
        $display("[DRV]: DATA WRITE data: %0d",fif.din);
        @(posedge fif.clk);
    endtask

    task read();
        @(posedge fif.clk);
        fif.rst <= 1'b0;
        fif.rd <= 1'b1;
        fif.wr <= 1'b0;
        @(posedge fif.clk);
        fif.rd <= 1'b0;
        $display("[DRV]: DATA READ");
        @(posedge fif.clk);
    endtask

    task run();
        forever begin
            mbx.get(datac);
            if(datac.oper == 1'b1)
                write();
            else
                read();
        end
    endtask

endclass

class monitor;
    virtual fifo_if fif;
    mailbox #(transaction) mbx;
    transaction tr;

    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task run();
        tr = new();

        forever begin
            repeat(2) @(posedge fif.clk);
            tr.wr = fif.wr;
            tr.rd = fif.rd;
            tr.din = fif.din;
            tr.full = fif.full;
            tr.empty = fif.empty;
            @(posedge fif.clk);
            tr.dout = fif.dout;

            mbx.put(tr);
            $display("[MON]: wr: %0d rd: %0d din: %0d dout: %0d full: %0d empty: %0d",tr.wr,tr.rd,tr.din,tr.dout,tr.full,tr.empty);
        end
    endtask
endclass

class scoreboard;
    transaction tr;
    mailbox #(transaction) mbx;

    event next;

    bit [7:0] din[$]; //queue
    bit[7:0] temp;
    int err = 0;

    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task run();
        forever begin
            mbx.get(tr);
            $display("[SCO]: wr: %0d rd: %0d din: %0d dout: %0d full: %0d empty: %0d",tr.wr,tr.rd,tr.din,tr.dout,tr.full,tr.empty);

            if(tr.wr == 1'b1) begin
                if(tr.full == 1'b0) begin
                    din.push_front(tr.din);
                    $display("[SCO]: DATA STORED IN QUEUE data_in: %0d",tr.din);
                end
                else begin
                    $display("[SCO]: FIFO IS FULL");
                end
                $display("---------------------------------");
            end

            if(tr.rd == 1'b1) begin
                if(tr.empty == 1'b0) begin
                    temp = din.pop_back();
                    if(tr.dout == temp)
                        $display("[SCO]: DATA MATCH");
                    else begin
                        $display("[SCO]: DATA MISMATCH");
                        err++;
                    end
                end
                else begin
                    $display("[SCO]: FIFO IS EMPTY");
                end

                $display("---------------------------------");
            end

            -> next;
        end
    endtask
endclass


class environment;
    generator gen;
    driver drv;

    monitor mon;
    scoreboard sco;

    mailbox #(transaction) gdmbx;
    mailbox #(transaction) msmbx;

    event nextgs;

    virtual fifo_if vif;
    
    function new(virtual fifo_if vif);
        gdmbx = new();
        gen = new(gdmbx);
        drv = new(gdmbx);

        msmbx = new();
        mon = new(msmbx);
        sco = new(msmbx);

        this.fif = fif;

        drv.fif = this.fif;
        mon.fif = this.fif;

        gen.next = nextgs;
        sco.next = nextgs;
    endfunction 

task pre_test();
    drv.reset();
endtask

task test();
    fork
        gen.run();
        drv.run();
        mon.run();
        sco.run();
    join_any
endtask

task post_test();
    wait(gen.done.triggered);
    $display("---------------------------------");
    $display("Error Count: %0d", sco.err);
    $display("---------------------------------");

    $finish();
endtask

task run();
    pre_test();
    test();
    post_test();
endtask

endclass

module tb_top(
    fifo_if fif();

    fifo dut(
        .clk(fif.clk),
        .rst(fif.rst),
        .wr(fif.wr),
        .rd(fif.rd),
        .din(fif.din),
        .dout(fif.dout),
        .empty(fif.empty),
        .full(fif.full)
    );

    initial begin
        fif.clk <= 1'b0;
    end

    always #10 fif.clk = ~fif.clk;

    environment env;

    initial begin
        env = new(fif);
        env.gen.count(50);
        env.run();
    end
    
    initial begin
        $dumpfile("fifo_dump.vcd");
        $dumpvars();
    end


    );
endmodule
