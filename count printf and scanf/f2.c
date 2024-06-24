#include <stdio.h>
int main() {   
    int number;
    writef("Enter an integer: ");  
    readf("%d", &number);
    writef("You entered: %d", number);
    return 0;
}
