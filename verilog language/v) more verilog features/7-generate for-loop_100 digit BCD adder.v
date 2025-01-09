module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire cin1[99:0];
genvar i;
    bcd_fadd inst(a[3:0],b[3:0],cin,cin1[0],sum[3:0]);
    generate
        for(i=2;i<101;i=i+1) begin : bcd_fadder
            bcd_fadd inst1(a[(4*i)-1:(4*i)-4],b[(4*i)-1:(4*i)-4],cin1[i-2],cin1[i-1],sum[(4*i)-1:(4*i)-4]);
        end
    endgenerate
    assign cout=cin1[99];
endmodule
/*
module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input      cin,
    output     cout,
    output [3:0] sum );    
    reg [4:0] m;  
    
    always @(*) begin
        m = a + b + cin;   
        if (m > 9) begin
            m = m + 6;      
        end
    end   
    assign cout = m[4];     
    assign sum = m[3:0];    
endmodule
*/
