#include <stdio.h>


extern int* insert(int item, int size, int* hash_table_loci)
extern int delete(int item, int size, int* hash_table_loci)

struct Node {
	int info;
	Node* next;

	Node(){}
	Node(int i, Node* n):info(i), next(NULL){}

};
int main(){
	Node* head = NULL;

	int* addr_1 =  insert(1, head);
	int* addr_3 =  insert(3, head);
	int* addr_9 =  insert(9, head);
	
	delete(3, head);
	
	

}