LIBRARY DISCIPLINES;    
USE IEEE.ELECTRICAL_SYSTEMS.ALL;                                                                                                                   
USE DISCIPLINES.ELECTROMAGNETIC_SYSTEM.ALL; 
                                        
entity  det is                                                                               
generic( Vref : real );
Port(terminal  entree : electrical; 
     signal clk,reset:in bit ;
     signal plein :out bit);  
ARCHITECTURE arch OF det IS
quantity vin ACROSS entree to electrrical_ground;                                
Begin
process(vin'obove(vref),reset)
begin
if vin'obove(vref)then                                                                              
plein <= '1';
else if reset ='1'then
plein <= '0';
end if;  
end process;                                                 
Break on clk When vin'obove(vref)=false; 
end arch  ;