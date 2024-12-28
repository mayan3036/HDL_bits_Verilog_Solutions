module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0] sl,su;
    wire c1,c2;
    wire [31:0] k={32{sub}} ^ b;
    add16 instance1(a[15:0],k[15:0],sub,sl,c1);
    add16 instance2(a[31:16],k[31:16],c1,su,c2);
    assign sum={su,sl};
endmodule
