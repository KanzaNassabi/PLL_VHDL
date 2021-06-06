library IEEE, Disciplines;
use IEEE.std_logic_1164.all;
use Disciplines.electrical_system. all;
entity ComparatorHyst is
generic (vlo, vhi: REAL; -- thresholds
timeout: DELAY_ LENGTH);
port (terminal ain, ref: electrical;
signal dout: out std_ logic);
end entity ComparatorHyst;
architecture Hysteresis of ComparatorHyst is
type states is (unknown, zero, one, unstable);
quantity vin across ain to ref;
function level( vin, vlo, vhi: REAL) return states is
begin
if vin < vlo then return zero;
elsif vin > vhi then return one;
else return unknown; end if;
end function level;
begin
process
variable state: states := level( vin, vlo, vhi);
begin
case state is
when one => dout <= ’1’;
wait on vin’Above( vhi);  state := unstable;
when zero => dout <= ’0’;
wait on vin’Above( vlo); 
state := unstable;
when unknown => dout <= ’X’;
wait on vin’Above( vhi), vin’Above( vlo);
state := level( vin, vlo, vhi);
when unstable =>  wait on vin’Above( vhi), vin’Above( vlo) for timeout;
state := level( vin, vlo, vhi);
end case;
end process;
end architecture Hysteresis;