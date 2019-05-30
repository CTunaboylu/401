#include <stdio.h>


extern int try_mem(int* item);


int main(){
	
	int anchor = 9;
	int * start = &anchor;

	int slot = try_mem(start);
	printf("Try_mem executed %d times, so cache size is %d bytes.", slot, slot*8 );

	return 0;
}
