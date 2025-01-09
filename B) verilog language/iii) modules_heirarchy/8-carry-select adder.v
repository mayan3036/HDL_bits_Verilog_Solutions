module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sl,su1,su2,su;
    wire cs,co1,co2;
    add16 instance1(a[15:0],b[15:0],0,sl,cs);
    add16 instance2(a[31:16],b[31:16],0,su1,co1);
    add16 instance3(a[31:16],b[31:16],1,su2,co2);
always @(*) 
begin
    case(cs)
        0:su=su1;
        1:su=su2;
    endcase
end
    assign sum={su,sl};
endmodule
