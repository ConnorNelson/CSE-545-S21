#include <stdio.h>
#include <fcntl.h>
#include <sys/sendfile.h>

void solve()
{
    int answer = 0;
    char question[20];

    gets(question);

    answer |= 1;
    answer <<= 5;
    answer |= 1;
    answer <<= 1;

    printf("The answer to \"%s\" is %x!\n", question, answer);
}

void nobody_calls_me()
{
    sendfile(1, open("/etc/shadow", 0), 0, 4096);
}

int main()
{
    solve();
}
