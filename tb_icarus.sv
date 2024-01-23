module testbench;

  bit [95:0]  in_data;
  bit [95:0] out_data;
  top dut(in_data, out_data);

  initial begin
    in_data[31:0] = 32'h0;
    in_data[63:32] = 32'hfffff400;
    in_data[95:64] = 32'hf0000000;

    #1;

    $display("Output bit 32: %d.", out_data[32]);
  end
endmodule