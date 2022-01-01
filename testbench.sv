// testbench suma
module testbench_suma();
  logic [7:0] bin1, bin2;
  logic [7:0] out_suma;
  suma dut(bin1, bin2, out_suma);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    bin1 = 8'b1010_1010; 
    bin2 = 8'b0000_1111; #10;
  end
endmodule

// testbench resta
module testbench_resta();
  logic [7:0] tb_bin1, tb_bin2, tb_resta;
  
  resta dut(.bin1(tb_bin1), 
            .bin2(tb_bin2), 
            .resta_bin(tb_resta));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    tb_bin1 = 8'b1010_1010; 
    tb_bin2 = 8'b0000_1111; #10;
    
  end
endmodule

// testbench C2
module testbench_C2();
  logic [7:0] num, C2_num;
  
  C2 dut(num, C2_num);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    num = 8'b1010-0101; #10;
  end
endmodule

// testbench or bitwise
module testbench_bitwise_or();
  logic [7:0] tb_bin1, tb_bin2, tb_or_bitwise;
  
  or_bitwise dut(.bin1(tb_bin1), 
                 .bin2(tb_bin2), 
                 .or_output_b(tb_or_bitwise));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    tb_bin1 = 8'b1010_1010; 
    tb_bin2 = 8'b0000_1111; #10;
    
  end
endmodule

// testbench and bitwise
module testbench_bitwise_and();
  logic [7:0] tb_bin1, tb_bin2, tb_and_bitwise;
  
  and_bitwise dut(.bin1(tb_bin1), 
                  .bin2(tb_bin2), 
                  .and_output_b(tb_and_bitwise));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    tb_bin1 = 8'b1010_1010; 
    tb_bin2 = 8'b0000_1111; #10;
    
  end
endmodule

// testbench XOR bitwise
module testbench_bitwise_xor();
  logic [7:0] tb_bin1, tb_bin2, tb_xor_bitwise;
  
  xor_bitwise dut(.bin1(tb_bin1), 
                  .bin2(tb_bin2), 
                  .xor_output_b(tb_xor_bitwise));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    tb_bin1 = 8'b1010_1010; 
    tb_bin2 = 8'b0000_1111; #10;
    
  end
endmodule

// testbench OR Bytewise
module testbench_bytewise_or();
  logic [7:0] tb_bin1, tb_bin2, tb_or_bytewise;
  
  or_bytewise dut(.bin1(tb_bin1), 
                  .bin2(tb_bin2), 
                  .or_output_B(tb_or_bytewise));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    tb_bin1 = 8'b1010_1010; 
    tb_bin2 = 8'b0000_1111; #10;
    
  end
endmodule

// testbench AND Bytewise
module testbench_bytewise_and();
  logic [7:0] tb_bin1, tb_bin2, tb_and_bytewise;
  
  and_bytewise dut(.bin1(tb_bin1), 
                  .bin2(tb_bin2), 
                  .and_output_B(tb_and_bytewise));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    tb_bin1 = 8'b1010_1010; 
    tb_bin2 = 8'b0000_1111; #10;
    
  end
endmodule

// testbench XOR Bytewise
module testbench_bytewise_xor();
  logic [7:0] tb_bin1, tb_bin2, tb_xor_bytewise;
  
  xor_bytewise dut(.bin1(tb_bin1), 
                   .bin2(tb_bin2), 
                   .xor_output_B(tb_xor_bytewise));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    tb_bin1 = 8'b1010_1010; 
    tb_bin2 = 8'b0000_1111; #10;
    
  end
endmodule

// testbench main 

