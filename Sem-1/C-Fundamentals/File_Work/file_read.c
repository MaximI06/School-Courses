#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main(void){

    FILE*pF = fopen("poem.txt", "r");
    char buffer[255];

    if(pF == NULL){
        printf("Unable to open file!\n");
    }
    else{
        while (fgets(buffer, 255, pF) != NULL){
        printf("%s", buffer);
        }
    }
    
    fclose(pF);
    return 0;
}
