#include <stdio.h>


extern node* insert(int item, node* head);
extern int delete(int item, node* head);
extern node* find(int item, node*head);
 
typedef struct Node {
	int info;
	node* next;

}node;

void print_List(node* head){

	node* tmp = head;
	printf("The list:");
	while (tmp != NULL){
		printf("%d ->",tmp->info);
		tmp = tmp->next;
	}
		printf("NULL");
}
void Test_List_Functionality(node* h){
	node* head = h;
	node* addr =  insert(rand()%20, head);
	print_List(head);	
	addr =  insert(3, head);
	print_List(head);	
	addr =  insert(rand()%20, head);
	print_List(head);	
	addr =  insert(rand()%20, head);
	print_List(head);	
	addr =  insert(rand()%20, head);
	print_List(head);	
	
	
	node* elm = find(3, head);
	printf("%d is found - (3 was searched).", *elm);
	print_List(head);
		
	int elm = delete(3, head);
	printf("%d is deleted.", elm);
	print_List(head);
		
}
int main(){
	node* head = NULL;
	head = malloc(sizeof(node));
	head->info = 1;
	head->next = NULL;
	
	Test_List_Functionality(head);
	return 0;	

}
