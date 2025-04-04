module moore_seq_det(
  input clk,rst,in,
  output reg [2:0] present_state,
  output reg out
);
  parameter s0=3'd0;
  parameter s1=3'd1;
  parameter s2=3'd2;
  parameter s3=3'd3;
  parameter s4=3'd4;
  reg [2:0] next_state;
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      present_state<=s0;
      out<=0;
    end
    else begin
      present_state<=next_state;
      if(present_state==s4)
        out<=1;
      else 
        out<=0;
    end
  end
  always@(*) begin
    next_state=present_state;
    case(present_state)
      s0: begin
        if(in==1)
          next_state=s1;
        else
          next_state=s0;
      end
      s1: begin
        if(in==1)
          next_state=s2;
        else
          next_state=s0;
      end
      s2: begin
        if(in==0)
          next_state=s3;
        else
          next_state=s2;
      end
      s3: begin
        if(in==1)
          next_state=s4;
        else
          next_state=s0;
      end
      s4: begin
        if(in==1)
          next_state=s2;
        else
          next_state=s0;
      end
      default:next_state=s0;
    endcase
  end
endmodule
