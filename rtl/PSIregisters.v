module PSIregisters
(
input clk,
input rstn,

output        waitrequest,     // niosSoc_inst_mm_bridge_0_m0_bfm:avs_waitrequest -> niosSoc_inst:mm_bridge_0_m0_waitrequest
output [31:0] readdata,        // niosSoc_inst_mm_bridge_0_m0_bfm:avs_readdata -> niosSoc_inst:mm_bridge_0_m0_readdata
input         debugaccess,     // niosSoc_inst:mm_bridge_0_m0_debugaccess -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_debugaccess
input  [5:0]  address,         // niosSoc_inst:mm_bridge_0_m0_address -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_address
input         read,            // niosSoc_inst:mm_bridge_0_m0_read -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_read
input  [3:0]  byteenable,      // niosSoc_inst:mm_bridge_0_m0_byteenable -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_byteenable
output        readdatavalid,   // niosSoc_inst_mm_bridge_0_m0_bfm:avs_readdatavalid -> niosSoc_inst:mm_bridge_0_m0_readdatavalid
input  [31:0] writedata,       // niosSoc_inst:mm_bridge_0_m0_writedata -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_writedata
input         write,           // niosSoc_inst:mm_bridge_0_m0_write -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_write
input  [0:0]  burstcount,      // niosSoc_inst:mm_bridge_0_m0_burstcount -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_burstcount

output [7:0]  ClockDiv,
output        Start,
output [31:0] DataIn,
input         Busy,
input  [31:0] DataOut

);


reg         Reg_Start   ;
reg  [31:0] Reg_DataIn  ;
reg  [7:0]  Reg_ClockDiv;
	
	
always @(posedge clk or negedge rstn)
	if (!rstn) Reg_Start <= 1'b0;
	 else if (Reg_Start) Reg_Start <= 1'b0;
	 else if (write && (address[5:0] == 6'h00)) Reg_Start <= writedata[0:0];

always @(posedge clk or negedge rstn)
	if (!rstn) Reg_DataIn <= 32'h00000000;
	 else if (write && (address[5:0] == 6'h02)) Reg_DataIn <= writedata;

always @(posedge clk or negedge rstn)
	if (!rstn) Reg_ClockDiv <= 8'h00;
	 else if (write && (address[5:0] == 6'h04)) Reg_ClockDiv <= writedata[7:0];
	 
	
assign readdata = (address[5:0] == 6'h00) ? {31'h00000000,Reg_Start} :	
                  (address[5:0] == 6'h04) ? {31'h00000000,Busy}      :	
                  (address[5:0] == 6'h08) ? {Reg_DataIn}             :	
                  (address[5:0] == 6'h0c) ? {DataOut}                :	
                  (address[5:0] == 6'h10) ? {24'h000000,Reg_ClockDiv}:	32'h00000000;


reg RegValid;
always @(posedge clk or negedge rstn)
	if (!rstn) RegValid <= 1'b0;
	 else RegValid <= read;
	 
assign readdatavalid = RegValid;
assign waitrequest = 1'b0;
						
assign ClockDiv = Reg_ClockDiv;
assign Start    = Reg_Start   ;
assign DataIn   = Reg_DataIn  ;

	
endmodule 