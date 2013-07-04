#include <stdio.h>

int factorial(int number);

int main()
{
  printf("%d\n",factorial(3));

}

int factorial(int number)
{
  if(number <= 1)
  {
    return 1;
  }
  else
  {
    return number * factorial(number-1);
  }

}
