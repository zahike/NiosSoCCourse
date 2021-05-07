`timescale 1ns/10ps
module SPI_tb();

reg clk;
reg rstn;
initial begin 
clk  = 1'b0;
rstn = 1'b0;
#100;
rstn = 1'b1;
end 

always #10 clk = ~clk;


wire [7:0]  ClockDiv = 8'h04;
wire [31:0] MDataIn   = 32'h81234563;
reg        Start;
wire        MBusy    ;
wire [31:0] MDataOut ;
wire [31:0] SDataIn   = 32'h89876543;
wire        SBusy    ;
wire [31:0] SDataOut ;

initial begin 
Start = 1'b0;
@(posedge rstn);
#100;
@(posedge clk);
Start = 1'b1;
@(posedge clk);
Start = 1'b0;
end 

wire SCLK;
wire MOSI;
wire MISO;
wire SS_n;


MasterSPI MasterSPI_inst
(
.clk (clk ),
.rstn(rstn),

.ClockDiv(ClockDiv),
.Start   (Start   ),
.DataIn  (MDataIn  ),
.Busy    (MBusy    ),
.DataOut (MDataOut ),

.SCLK(SCLK),
.MOSI(MOSI),
.MISO(MISO),
.SS_n(SS_n)

);


SlaveSPI SlaveSPI_inst
(
.clk (clk ),
.rstn(rstn),

.DataIn (SDataIn),
.Busy   (SBusy   ),
.DataOut(SDataOut),

.SCLK(SCLK),
.MOSI(MOSI),
.MISO(MISO),
.SS_n(SS_n)

);


endmodule
