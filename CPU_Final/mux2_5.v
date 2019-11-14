module mux2_5(input  [4:0] A, B, 
              input        S, 
              output [4:0] Y);

  assign Y = S ? B : A; 
endmodule
