module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] q1,q2,q3;
    my_dff8 instance1(clk,d,q1);
    my_dff8 instance2(clk,q1,q2);
    my_dff8 instance3(clk,q2,q3);

    
always @(*)
begin
    if(sel==2'b00) 
        begin
            q=d;
        end
    if(sel==2'b01)
        begin 
            q=q1; 
        end
    if(sel==2'b10)
        begin 
            q=q2;
        end
    if(sel==2'b11) 
        begin 
            q=q3; 
        end
end
    
endmodule
