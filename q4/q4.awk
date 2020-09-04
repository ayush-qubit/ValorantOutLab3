#!/bin/awk -f


BEGIN { sum = 0}

{

if(filename != FILENAME) 
{ 

filename = FILENAME;
num++; 
 }

if(num == 1)
{

for(i = 2; i <= NF; ++i)
{ 
 lena[$1]=NF;
 ira[$1]=$1;
 irb[$1,i-1]=$i;

  }
  
   }


if(num == 2) 
{ 

if(ira[$1]==$1)
 {
 
  if(NF <lena[$1])
    {
       len = NF;
    }
    else
    {
     len = lena[$1];
    }
    
     for(i = 2; i <= len; ++i)
     {
     	if(irb[$1,i-1] == $i)
     	{
     	
     	  sum = sum +1;
     	}
     }
 
 
   } 
   
    }
    
    }
 
  END {
      print sum;
   }


