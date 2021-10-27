--creating a guessing game numbers
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Guess is
	subtype Small_Number is Integer range 1 .. 100;
	package Random_Secret is new Ada.Numerics.Discrete_Random (Small_Number);
	
	Seed : Random_Secret.Generator;
   Secret_Number : Small_Number;
begin
	Random_Secret.Reset (Seed);
   Secret_Number := Random_Secret.Random (Seed);
   
	Put_Line ("Guess the number!");
	Game:loop
     Put_Line ("Please input your guess.");

   declare
      Input : constant String := Get_Line;
	  Guess : constant Small_Number := Small_Number'Value (Input);
   begin
      Put_Line ("You guessed: " &  Small_Number'Image (Guess));
		if Guess < Secret_Number then
         Put_Line ("Your guess was too low!");
      elsif Guess > Secret_Number then
         Put_Line ("Your guess was too high!");
      else
         Put_Line ("Wow, That is your lucky dip!");
		 exit Game;
      end if;
	  end;
   end loop Game;
   
   Put_Line ("The secret number was: " & Small_Number'Image (Secret_Number));
 
end Guess;
