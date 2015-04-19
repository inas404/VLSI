LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

Entity PWM is
  PORT(
     CLK,RST,r_w,Enable_Bus,EN: in std_logic;   -- pwm_in is the address bus last bit
     Add_Bus : in std_logic_vector(7 downto 0);
     Data_bus : inout STD_LOGIC_VECTOR(7 DOWNTO 0);
      pwm_out   : OUT STD_LOGIC);
  end PWM;
architecture pwm_arch of PWM is
    signal  count : std_logic_vector(7 downto 0):= "00000000";
    signal duty :  std_logic_vector(7 downto 0); --duty cycle
    signal duration :  std_logic_vector(7 downto 0);
    signal start1 : std_logic;
    signal start2 : std_logic;
    signal outout : std_logic :='0';



 begin 
   pwm_out <= outout;
  process(CLK,RST,EN)
    begin

      
    if RST='1' then 
      outout<='0';
      count <= "00000000";
      duty <="00000000";
      duration <="00000000";
    elsif RST='0' then
        if EN = '1'  then
            if Add_Bus(0)='0' and r_w='0' and Enable_Bus='1' then        -- read duty from the data bus
                duty <=Data_bus;
                start1<='1';
            elsif Add_Bus(0)='1' and r_w='0' and Enable_Bus='1' then      -- read duration from the data bus
                duration <= Data_bus;
                start2<='1';
            elsif Add_Bus(0)='0' and r_w='1' and Enable_Bus='1' then        -- write duty into the data bus
                Data_bus <= duty;
            elsif Add_Bus(0)='1' and r_w='1'  and Enable_Bus='1' then       -- write duration into the data bus
                Data_bus<=duration;
					 else
					 Data_bus<=(others=>'Z');
            end if;
            
                  
-- design the output signal of the pwm
          if CLK'event and CLK='1' and start1 ='1' and start2='1' then 
            
             if conv_integer(count) < conv_integer(duration) then
                if conv_integer(count) < conv_integer(duty) then
                  outout <='1';
                  count<= count +1;
                elsif conv_integer(count) >= conv_integer(duty) then
                  outout<='0';
                  count<=count+1;
                end if;
              end if;
              if count >= conv_integer(duration) then
                 count<="00000000";
              end if;
          end if; 
        end if; 

    end if;
 end process;
 end pwm_arch;

