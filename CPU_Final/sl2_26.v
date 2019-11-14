module sl2_26(input  [25:0] A,
              output [27:0] Y);

  // shift left by 2
  assign Y = {A[25:0], 2'b00};
endmodule
