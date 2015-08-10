with Ada;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;



procedure Delta_Encoding is
   
   N : Integer;

   type Int_Array is array ( Integer range <> ) of Integer;
   
   
   function Delta_Encode ( Data : Int_Array ) return Int_Array is
      
      Encoded_Data : Int_Array ( 1 .. Data'Size );
      Last         : Integer;
      
   begin
      
      Last := 0;
      
      for I in 1 .. Data'Size loop
         
         Encoded_Data ( I ) := Data ( I ) - Last;
         Last := Data ( I );
         
      end loop;
         
      return Encoded_Data;
   
   end Delta_encode;


begin
   
   N := 0;
   
   while not ( N > 0 ) loop
      Put_Line ( "How many datum (N > 0) to encode?" );
      Put ( "> " );
      Get ( N );
   end loop;
   
   New_Line ( 2 );
   
   declare

      Data    : Int_Array ( 1 .. N );
      Results : Int_Array ( 1 .. N );   
      
   begin
      
      for I in 1 .. N loop
         
         Put ( I );
         Put ( " > " );
         Get  ( Data ( I ) );
         New_Line;
         
      end loop;
      
      New_Line ( 5 ) ;
      Results := Delta_Encode ( Data );
      
      for I in 1 .. N loop
         
         Put ( Data ( I ) );
         Put ( " " );
      
      end loop;
      
      New_Line ( 3 );   
      
      for I in 1 .. N loop
         
         Put ( Results ( I ) );
         Put ( " " );
      
      end loop;

   end;
   
   New_Line ( 3 );
   
end Delta_Encoding;