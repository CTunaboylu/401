#include <stdio.h>
extern int* hash(int item, int size)

extern int* insert_int(int item, int size, int* hash_table_loci)
extern int delete(int item, int size, int* hash_table_loci)


int main(){
	int table_size = 11;
	int head = 1;
	int* table_addr_head = &head;

	int* addr_1 =  insert_int(head, table_size, table_addr_head)
	int* addr_3 =  insert_int(3, table_size, table_addr_head)
	int* addr_9 =  insert_int(9, table_size, table_addr_head)
	int* addr_89 =  insert_int(89, table_size, table_addr_head) // expected collision at &1
	
	int deleted_elm =  delete(3, table_size, table_addr_head)

}