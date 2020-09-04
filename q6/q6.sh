#!/bin/bash

fileName=$1
startTime=$2
Endtime=$3



awk -F"\t" -v startTime="$startTime" -v Endtime="$Endtime" 'function compare(time1, time2){
   
   split(time1,temp1,":");
   hours=temp1[1];
   minutes=temp1[2];
   seconds=temp1[3];
   
   totalsecs1 = hours*3600+minutes*60+seconds;
   split(time2,temp2,":");
   hours=temp2[1];
   minutes=temp2[2];
   seconds=temp2[3];
   totalsecs2 = hours*3600+minutes*60+seconds;
   
   
   if(totalsecs1<totalsecs2)
   {
   
   
   return 1;
   }
   else
   {
   return 2;
   }
}


function difference(time1, time2){


   split(time1,temp1,":");
   hours=temp1[1];
   minutes=temp1[2];
   seconds=temp1[3];
   totalsecs1 = hours*3600+minutes*60+seconds;
   split(time2,temp2,":");
   hours=temp2[1];
   minutes=temp2[2];
   seconds=temp2[3];
   totalsecs2 = hours*3600+minutes*60+seconds;
  
   return (totalsecs1-totalsecs2)
}

BEGIN {
FS="\t";
printf("%s\t%s\n", "Name", "TotalTime");
}


{
if(NR>1)
{

 if($2 == "Joined")
 {
 
 split($3,b,",");
 split(b[2],c," ");
 time = c[1];
 
 if(compare(time,startTime)==1)
 {
 
 a[$1] =startTime ;
 }
 else
 {
 
 a[$1] = time;
 }
 
 status[$1] = "Joined";
 lasttimejoined[$1] = time;
 
 }
 
 else if($2 == "Left")
 {
 split($3,b,",");
 split(b[2],c," ");
 time = c[1];
 
 if(compare(time, Endtime)==2)
 {
 
 time =Endtime ;
 }
 status[$1] = "Left";
 lasttimeleft[$1] = time;
 arrtime[$1] =  arrtime[$1] + difference(time,a[$1]);
 }
 
}


}

END{
for(i in a )
{

   if(status[i] != "Left")
   {
   
     arrtime[i] =  arrtime[i] + difference(Endtime,lasttimejoined[i]);
   }
   
   hours=int(arrtime[i]/3600);
   minutes=int((arrtime[i]-hours*3600)/60);
   seconds=(arrtime[i]-hours*3600-minutes*60);
   
   
   printf("%s\t%s:%s:%s\n", i, hours,minutes,seconds);
}
}' "$fileName" > "temp1"


awk -F"\t" 'BEGIN{cmd="sort"}
NR==1{printf("%s\n",$0);next}
{printf("%s\t%s\n",$1,$2) | cmd}
END{close(cmd)}' "temp1" > "out01"

rm "temp1"




 

