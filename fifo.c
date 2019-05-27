#include <stdio.h>
#include <stdlib.h>


void push(struct queue ** obj, long long int value);  // function declarations
long long int pop(struct queue ** obj);


struct queue
{
  long long int* head;  // storing the beginning of the queue
  long long int* tail;  // storing the end of the queue
};


int main(void)
{

	long long int add = 4278190048;
	
	struct queue * fifo;

	fifo = 3755990991;
	fifo -> head = &add;
	fifo -> tail = &add;
	
	while(1){
		int value = 3;
		push(&fifo, value);
		//value = pop(&fifo);
		int x = value;
	}
}




