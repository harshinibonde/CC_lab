%{
#include<stdio.h>
int StrToNum(char str[]){
    int n=0;
    for(int i=0;str[i]!='\0';i++){
        n=n*10;
        n=n+str[i]-'0';
    }
    return n;
}

void DecToHex(int num){
    int rem;
    if(num==0){
        return;
    }
    rem=num%16;
    DecToHex(num/16);
    if(rem<10)
        putchar(rem+'0');
    else
        putchar(rem-10+'A');
}

int HexToDec(char str[]){
    int n=0,val;
    for(int i=0;str[i]!='\0';i++){
        if(str[i]>='0' && str[i]<='9')
            val=str[i]-'0';
        else if(str[i]>='A' && str[i]<='F')
            val=str[i]-'A'+10;
        else
            val=str[i]-'a'+10;
        n=n*16+val;
    }
    return n;
}
%}

%%
[0-9]+ {int num=StrToNum(yytext); DecToHex(num);}
[0-9A-Fa-f]+ {int num=HexToDec(yytext); printf("%d",num);}
%%

int main(){
    printf("Enter a decimal/hexadecimal num: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}

