//
//  main.c
//  Delta Encoding
//
//  Created by Adrian Hoe on 8/8/15.
//  Copyright (c) 2015 AdaLogica Software. All rights reserved.
//

#include <stdio.h>


void deltaEncode(int Data[], int Results[], int N)
{
   int Last = 0;
   
   for (int i=0; i<N; i++)
   {
      Results[i] = Data[i] - Last;
      Last = Data[i];
   }
}


int main(int argc, const char * argv[])
{

   int N;

   N = 0;
   printf("How many datum (N > 0) to encode?\n");
   
   while ( ! (N>0) )
   {
      printf("> ");
      scanf("%d", &N);

   }

   int Data [N];
   
   for (int i=0; i<N; i++)
   {
      printf("%d > ", i+1);
      scanf("%d", &Data[i]);
   }
   
   printf("\n\n\n\n\n");
   
   for (int i=0; i<N; i++)
   {
      printf("%d ", Data[i]);
   }
   
   int Results [N];
   
   deltaEncode(Data, Results, N);

   printf("\n\n\n");
   
   for (int i=0; i<N; i++)
   {
      printf("%d ", Results[i]);
   }

   return 0;
}
