#include <stdio.h>
extern long long int hash(long long int item, long long int b)

long long int table_size(){
	long long int pot_size = rand() % pow(2,13);
	bool is_prime = false;
	while(!is_prime){
    	is_prime = true;
    	for (i = 2; i <= sqrt(pot_size) / 2; i++) { 
          if (n % i == 0) { 
			is_prime = false; 
            } 
            if(is_prime&&i==sqrt(pot_size)){
            	std::cout<<"Number is prime: "<<pot_size<<std::endl;
            	return pot_size;
            }else{
            	std::cout<<"Number is NOT prime: "<<pot_size<<std::endl;
            	pot_size = rand() % pow(2,13);
            }
    }  
}
}

int main(){
	long long int table_size = table_size();
	std::cout<<"Number is : "<<table_size<<std::endl;

}