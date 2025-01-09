module fadder(
    input a,b,cin,
    output cout,sum
);
    assign sum=a^b^cin;
    assign cout=(a&b)|(b&cin)|(cin&a);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    fadder inst1(a[0],b[0],cin,cout[0],sum[0]);
    generate
        for(i=1;i<100;i=i+1)begin :fa_block
            fadder inst(a[i],b[i],cout[i-1],cout[i],sum[i]);
        end
    endgenerate
endmodule
/*the generate statement is used to create repetitive or conditional hardware structures during synthesis. It allows for the instantiation of modules, blocks, or logic based on parameters, loops (genvar with for), or conditional directives (if-generate or case-generate), making designs more modular and scalable. 