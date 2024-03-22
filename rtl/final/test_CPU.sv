`timescale 1ns / 1ps

module tb_CPU;

  logic clk, reset;
  logic [31:0] iaddr;
  logic [31:0] pcinc;
  logic [31:0] x31;

  // Instantiate the CPU module
  CPU uut (.* );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    // Initialize inputs
    reset = 1;
    // Apply reset
    #10 reset = 0;

    #100 reset = 0;

  #500 $finish;

  end
    // Monitor signals
    always @(posedge clk) begin
        // Display important signals
        $display("Time=%0t iaddr_tb=%h pc_tb=%h x31_tb=%h", $time, iaddr, pcinc, x31);
    end

 endmodule
