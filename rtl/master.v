module master
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

output SCLK,
output MOSI,
input  MISO,
output SS_n

);


wire [7:0]  ClockDiv;
wire        Start   ;
wire [31:0] DataIn  ;
wire        Busy    ;
wire [31:0] DataOut ;

SPIregisters Master_Registers_inst
(
.clk (clk ),
.rstn(rstn),

.waitrequest  (waitrequest  ),     // niosSoc_inst_mm_bridge_0_m0_bfm:avs_waitrequest -> niosSoc_inst:mm_bridge_0_m0_waitrequest
.readdata     (readdata     ),        // niosSoc_inst_mm_bridge_0_m0_bfm:avs_readdata -> niosSoc_inst:mm_bridge_0_m0_readdata
.debugaccess  (debugaccess  ),     // niosSoc_inst:mm_bridge_0_m0_debugaccess -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_debugaccess
.address      (address      ),         // niosSoc_inst:mm_bridge_0_m0_address -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_address
.read         (read         ),            // niosSoc_inst:mm_bridge_0_m0_read -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_read
.byteenable   (byteenable   ),      // niosSoc_inst:mm_bridge_0_m0_byteenable -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_byteenable
.readdatavalid(readdatavalid),   // niosSoc_inst_mm_bridge_0_m0_bfm:avs_readdatavalid -> niosSoc_inst:mm_bridge_0_m0_readdatavalid
.writedata    (writedata    ),       // niosSoc_inst:mm_bridge_0_m0_writedata -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_writedata
.write        (write        ),           // niosSoc_inst:mm_bridge_0_m0_write -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_write
.burstcount   (burstcount   ),      // niosSoc_inst:mm_bridge_0_m0_burstcount -> niosSoc_inst_mm_bridge_0_m0_bfm:avs_burstcount

.ClockDiv(ClockDiv),
.Start   (Start   ),
.DataIn  (DataIn  ),
.Busy    (Busy    ),
.DataOut (DataOut )

);


MasterSPI MasterSPI_inst
(
.clk (clk ),
.rstn(rstn),

.ClockDiv(ClockDiv),
.Start   (Start   ),
.DataIn  (DataIn  ),
.Busy    (Busy    ),
.DataOut (DataOut ),

.SCLK(SCLK),
.MOSI(MOSI),
.MISO(MISO),
.SS_n(SS_n)

);

endmodule
