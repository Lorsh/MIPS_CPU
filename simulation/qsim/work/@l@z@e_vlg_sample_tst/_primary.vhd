library verilog;
use verilog.vl_types.all;
entity LZE_vlg_sample_tst is
    port(
        in1             : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end LZE_vlg_sample_tst;
