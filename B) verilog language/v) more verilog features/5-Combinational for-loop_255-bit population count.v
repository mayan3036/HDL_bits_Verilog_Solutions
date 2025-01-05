module top_module( 
    input [254:0] in,
    output reg [7:0] out );
integer i;   
always @(in)begin
    out=1'b0;
    for(i=0;i<255;i=i+1)begin
        if(in[i]==1'b1)
            out=out+1'b1;
    end
end
endmodule
// we can also declare a reg element "count" and do operation on it and later make out=count;