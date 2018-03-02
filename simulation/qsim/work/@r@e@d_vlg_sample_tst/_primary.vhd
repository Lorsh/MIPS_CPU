library verilog;
use verilog.vl_types.all;
entity RED_vlg_sample_tst is
    port(
        input1          : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end RED_vlg_sample_tst;
