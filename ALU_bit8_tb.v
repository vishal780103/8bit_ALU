module bit8_alu_tb;
  reg [7:0]A;
  reg [7:0]B;
  reg [2:0]sel;
  
  wire [7:0]Result;
  wire carry;
  
  bit8_ALU DUT ( .A(A),
                .B(B),
                .sel(sel),
                .Result(Result),
                .carry(carry)
               );
  
  initial begin
    
    $dumpfile("alu.vcd");
    $dumpvars(0,bit8_alu_tb);
    
    //add
    A = 8'b00011100;
    B = 8'b00000000;
    sel = 3'b000;
    #10;
    
    //sub
    A = 8'b00000001;
    B = 8'b00010000;
    sel = 3'b001;
    #10;
    
    //and
    A = 8'b00110011;
    B = 8'b00001000;
    sel = 3'b010;
    #10;
    
    //or
    A = 8'b00100001;
    B = 8'b00101000;
    sel = 3'b011;
    #10;
    
    //xor
    A = 8'b00101010;
    B = 8'b00000010;
    sel = 3'b100;
    #10;
    
    //not
    A = 8'b11110000;
    sel = 3'b101;
    #10;
    
    // left
    sel = 3'b110;
    #10;
    
    //right
    sel = 3'b111;
    #10;
    
    $finish;
    
  end 
  
  initial begin
    $monitor("Time=%0t, A=%d, B=%d, sel=%b, Result=%d, carry=%d",$time,A,B,sel,Result,carry);
    
  end
  
endmodule
    