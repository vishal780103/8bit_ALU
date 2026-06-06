module bit8_ALU(
  input [7:0] A,
  input [7:0] B,
  input [2:0] sel,
  output reg [7:0] Result,
  output reg carry
);
  
  always @(*) begin
    
    carry = 1'b0;
    
    case(sel)
      
      3'b000: begin // addition
        {carry,Result} = A+B;
      end
      
      3'b001: begin // subtraction
        {carry,Result} = A-B;
      end 
      
      3'b010: begin // and gate
        Result = A&B;
      end
      
      3'b011: begin // or gate
        Result = A|B;
      end 
      
      3'b100: begin // xor gate
        Result = A^B;
      end
      
      3'b101: begin // not gate
        Result = ~A;
      end
      
      3'b110: begin // left shift
        Result = A<<1;
      end
      
      3'b111: begin // right shift
        Result = A>>1;
      end
      
      default: begin
        Result = 8'b00000000;
        carry = 1'b0;
      end
      
    endcase
    
  end 
  
endmodule
      
        