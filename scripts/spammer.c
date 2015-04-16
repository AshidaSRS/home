#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main (void){
int fd[2];
pipe(fd);
switch(fork()){
case 0:close (0);
	dup (fd[0]);
	close (fd[0]);
	close (fd[1]);
	break;
default:
	close (1);
	dup(fd[1]);
	close (fd[1]);
	close (fd[0]);
	//telegram
	execlp ("cat","cat",NULL);
	exit(1);
}
int leidos;
char* buffer = malloc(1024 * sizeof(char));

//while (1)
//	write(1,"msg Mognom spam",5);

system ("echo $(ls)");
return 0;
}
