library verilog;
use verilog.vl_types.all;
entity UZE_vlg_check_tst is
    port(
        result          : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end UZE_vlg_check_tst;
