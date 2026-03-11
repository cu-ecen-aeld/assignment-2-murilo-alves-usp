#include<stdio.h>
#include<string.h>
#include<syslog.h>

int main(int argc, char* argv[]) {

    FILE *fp=NULL;
    size_t written_amount=0;
    
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);
    
    if ( argc != 3 ) {
        syslog(LOG_ERR, "Filepath and/or string not specified\n");
        return 1;
    }

    char* filepath=argv[1];
    fp = fopen(filepath, "w");
    if ( fp == NULL ) {
        syslog(LOG_ERR, "Error opening file\n");
        return 1;
    }

    char* writestr=argv[2];
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, filepath);
    written_amount = fwrite(writestr, sizeof(char), strlen(writestr), fp);
    if ( written_amount != strlen(writestr) ) {
        syslog(LOG_ERR, "Failed to write %s to %s", writestr, filepath);
        return 1;
    }

    return 0;
}