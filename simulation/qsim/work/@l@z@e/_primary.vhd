library verilog;
use verilog.vl_types.all;
entity LZE is
    port(
        in1             : in     vl_logic_vector(15 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end LZE;
