#include <stdio.h>
#include <stdlib.h>

#define T_SIZE 11

extern int hash(int item, int size)
extern int insert(int item, int size, int* hash_table_loci)
extern int delete(int item, int size, int* hash_table_loci)

void print_hash(int h[]){
	for(int i=0; i < T_SIZE; i++){
		printf(h[i]); 
	}
}
int main(){
	
	int hashTable[T_SIZE];
	for(int i=0; i < T_SIZE; i++){
		hashTable[i] = i+1; // make sure that the algorithm accepts every element as empty for initial conditions
	}
	// get the head of the hashtable 
	int* head = &hashTable[0];
	print_hash(hashTable);

	int addr_1 =  insert_int(1, T_SIZE, head);
	print_hash(hashTable);
	
	int addr_3 =  insert_int(3, T_SIZE, head);
	print_hash(hashTable);

	int addr_9 =  insert_int(9, T_SIZE, head);
	print_hash(hashTable);

	int addr_89 =  insert_int(89, T_SIZE, head); // expected collision at &1
	print_hash(hashTable);
	
	int deleted =  delete(3, T_SIZE, head);
	print_hash(hashTable);




	return 0;
}