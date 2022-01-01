// Code your design here

// auxiliar de suma
module sumador(input logic bit1, bit2, prev_carry, 
               output logic out_bit, next_carry);
  assign out_bit = (~bit1 &  bit2 & ~prev_carry) |
    			   ( bit1 & ~bit2 & ~prev_carry) |
    			   (~bit1 & ~bit2 &  prev_carry) |
    			   ( bit1 &  bit2 &  prev_carry);
  	assign next_carry =  bit1 &  bit2 & ~prev_carry |
      					 bit1 & ~bit2 &  prev_carry |
      					~bit1 &  bit2 &  prev_carry |
      					 bit1 &  bit2 &  prev_carry;
endmodule: sumador

// suma binaria
module suma(bin1, bin2, suma_bin);
  input logic [7:0] bin1; 
  input logic [7:0] bin2;
  output logic [7:0] suma_bin;
  
  supply0 ground;
  logic carry0, carry1, carry2, carry3, 
		carry4, carry5, carry6, carry7;
  
  sumador sum0(bin1[0], bin2[0], ground, suma_bin[0], carry0);
  sumador sum1(bin1[1], bin2[1], carry0, suma_bin[1], carry1);
  sumador sum2(bin1[2], bin2[2], carry1, suma_bin[2], carry2);
  sumador sum3(bin1[3], bin2[3], carry2, suma_bin[3], carry3);
  sumador sum4(bin1[4], bin2[4], carry3, suma_bin[4], carry4);
  sumador sum5(bin1[5], bin2[5], carry4, suma_bin[5], carry5);
  sumador sum6(bin1[6], bin2[6], carry5, suma_bin[6], carry6);
  sumador sum7(bin1[7], bin2[7], carry6, suma_bin[7], carry7);
  
endmodule: suma

// complemento 2 de un numero binario (num)
module C2(num, C2_output);
  input logic [7:0] num;
  output logic [7:0] C2_output;
  
  logic [7:0] C1_num;
  
  assign C1_num[0] = ~num[0];
  assign C1_num[1] = ~num[1];
  assign C1_num[2] = ~num[2];
  assign C1_num[3] = ~num[3];
  assign C1_num[4] = ~num[4];
  assign C1_num[5] = ~num[5];
  assign C1_num[6] = ~num[6];
  assign C1_num[7] = ~num[7];
  
  suma suma_1(C1_num, 8'b0000_0001, C2_output);
  
endmodule: C2

// resta binaria con C2
module resta(bin1, bin2, resta_output);
  input logic [7:0] bin1;
  input logic [7:0] bin2;
  output logic [7:0] resta_output;
  
  logic [7:0] C2_bin2;
  
  C2 complemento2_bin2(bin2, C2_bin2);
  
  suma resta_C2(bin1, C2_bin2, resta_output);
  
endmodule: resta

// and bitwise
module and_bitwise(bin1, bin2, and_output_b);
  input logic [7:0] bin1;
  input logic [7:0] bin2;
  output logic [7:0] and_output_b;
  
  assign and_output_b[0] = bin1[0] & bin2[0];
  assign and_output_b[1] = bin1[1] & bin2[1];
  assign and_output_b[2] = bin1[2] & bin2[2];
  assign and_output_b[3] = bin1[3] & bin2[3];
  assign and_output_b[4] = bin1[4] & bin2[4];
  assign and_output_b[5] = bin1[5] & bin2[5];
  assign and_output_b[6] = bin1[6] & bin2[6];
  assign and_output_b[7] = bin1[7] & bin2[7];
  
endmodule: and_bitwise

// or bitwise
module or_bitwise(bin1, bin2, or_output_b);
  input logic [7:0] bin1;
  input logic [7:0] bin2;
  output logic [7:0] or_output_b;
  
  assign or_output_b[0] = bin1[0] | bin2[0];
  assign or_output_b[1] = bin1[1] | bin2[1];
  assign or_output_b[2] = bin1[2] | bin2[2];
  assign or_output_b[3] = bin1[3] | bin2[3];
  assign or_output_b[4] = bin1[4] | bin2[4];
  assign or_output_b[5] = bin1[5] | bin2[5];
  assign or_output_b[6] = bin1[6] | bin2[6];
  assign or_output_b[7] = bin1[7] | bin2[7];
  
endmodule: or_bitwise

// xor bitwise
module xor_bitwise(bin1, bin2, xor_output_b);
  input logic [7:0] bin1;
  input logic [7:0] bin2;
  output logic [7:0] xor_output_b;
  
  assign xor_output_b[0] = bin1[0] ^ bin2[0];
  assign xor_output_b[1] = bin1[1] ^ bin2[1];
  assign xor_output_b[2] = bin1[2] ^ bin2[2];
  assign xor_output_b[3] = bin1[3] ^ bin2[3];
  assign xor_output_b[4] = bin1[4] ^ bin2[4];
  assign xor_output_b[5] = bin1[5] ^ bin2[5];
  assign xor_output_b[6] = bin1[6] ^ bin2[6];
  assign xor_output_b[7] = bin1[7] ^ bin2[7];
  
endmodule: xor_bitwise

// and bytewise
module and_bytewise(bin1, bin2, and_output_B);
  input logic [7:0] bin1;
  input logic [7:0] bin2;
  output logic [7:0] and_output_B;
  logic [7:0] result_bitwise;
  
  and_bitwise a_bitwise(bin1, bin2, result_bitwise);
  
  assign and_output_B = &result_bitwise; 
  
endmodule

// or bytewise
module or_bytewise(bin1, bin2, or_output_B);
  input logic [7:0] bin1;
  input logic [7:0] bin2;
  output logic [7:0] or_output_B;
  logic [7:0] result_bitwise;
  
  or_bitwise o_bitwise(bin1, bin2, result_bitwise);
  
  assign or_output_B = |result_bitwise; 
  
endmodule

// xor bytewise
module xor_bytewise(bin1, bin2, xor_output_B);
  input logic [7:0] bin1;
  input logic [7:0] bin2;
  output logic [7:0] xor_output_B;
  logic [7:0] result_bitwise;
  
  xor_bitwise x_bitwise(bin1, bin2, result_bitwise);
  
  assign xor_output_B = ^result_bitwise; 
  
endmodule


module main(numero1, numero2, clk, selector, salida);
  input logic [7:0] numero1;
  input logic [7:0] numero2;
  input logic clk;
  input logic [2:0] selector;
  output logic [7:0] salida;
 
  always_comb
      case(selector)
        3'b000 : begin suma ope_suma(numero1, numero2, salida); end
        3'b001 : begin resta ope_resta(numero1, numero2, salida); end
        3'b010 : begin or_bitwise o_bitwise(numero1, numero2, salida); end
        3'b011 : begin and_bitwise a_bitwise(numero1, numero2, salida); end
        3'b100 : begin xor_bitwise x_bitwise(numero1, numero2, salida); end
        3'b101 : begin or_bytewise o_bytewise(numero1, numero2, salida); end
        3'b011 : begin and_bytewise a_bytewise(numero1, numero2, salida); end
        3'b111 : begin xor_bytewise x_bytewise(numero1, numero2, salida); end
        default : $display("ERROR IN SELECT");
      endcase
    //end
endmodule