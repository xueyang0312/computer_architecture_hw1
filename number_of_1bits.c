#include<stdio.h>
#include<stdint.h>

int number_of_1bits(uint32_t n){
	int count = 0;
	while(n!=0){
		n = n&(n-1);
		count++;
	}
	return count;
}

int main()
{
	//printf("%d\n",number_of_1bits(00000000000000000000000000001011));
	return 0;
}
