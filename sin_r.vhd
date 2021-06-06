--source sinus
LIBRARY DISCIPLINES;
LIBRARY IEEE;

USE DISCIPLINES.ELECTROMAGNETIC_SYSTEM.ALL;
USE IEEE.MATH_REAL.ALL;
ENTITY sinn IS
 PORT( TERMINAL p, m: ELECTRICAL) ;
END sinn;
     
ARCHITECTURE behav OF sinn IS
 QUANTITY v_in ACROSS i_out THROUGH p TO m;
begin
 v_in==10.0*sin(2.0*3.14* 150.0*now);
END ;
-- Resistance
LIBRARY DISCIPLINES;
USE DISCIPLINES.ELECTROMAGNETIC_SYSTEM.ALL; 

ENTITY res IS                           
 generic (R:real := 2.0);
 PORT ( TERMINAL p, m : ELECTRICAL) ;
END res;

ARCHITECTURE behav OF res IS
 QUANTITY v ACROSS i THROUGH p TO m;
BEGIN	
 i == v/R;
END behav;


--testbench
LIBRARY DISCIPLINES;
USE DISCIPLINES.ELECTROMAGNETIC_SYSTEM.ALL;   

ENTITY schema IS
END;

ARCHITECTURE behav OF schema IS 
TERMINAL n1 : ELECTRICAL;
BEGIN          
 vsrc: ENTITY sinn (behav) PORT MAP ( n1,electrical_ground) ;
 r1: ENTITY res (behav) PORT MAP (n1,electrical_ground) ;
END;