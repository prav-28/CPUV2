module sl2(input  [31:0] A,
           output [31:0] Y);

  // shift left by 2
  assign Y = {A[29:0], 2'b00};
endmodule
