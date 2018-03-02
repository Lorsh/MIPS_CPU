library verilog;
use verilog.vl_types.all;
entity FullAdder_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        Sum             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end FullAdder_vlg_check_tst;
