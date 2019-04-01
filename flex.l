%{
 // #include "y.tab.h"
 #include <stdio.h>
%}

SPACE [ \t ]+
LETTERS [a-zA-Z]+
DIGITS [0-9]+
text ({LETTERS}|{DIGITS}|{SPACE})
LAB [<]
RAB [>]
SLASH [/]
HTML [Hh][Tt][mM][lL]
BODY [bB][oO][Dd][yY]
HEADER [Hh]
PARA [Pp]
BOLD [bB]
STRONG [Ss][Tt][Rr][Oo][Nn][Gg]
ITALIC [Ii]
EMPH [eE][mM]
MARK [Mm][aA][rR][Kk]
SMALL [Ss][Mm][Aa][Ll][Ll]
DEL [Dd][Ee][Ll]
INS [Ii][Nn][Ss]
SUB [Ss][Uu][Bb]
SUP [Ss][Uu][Pp]
TABLE [Tt][aA][bB][lL][Ee]
TD [Tt][dD]
TR [tT][Rr]
TH [Tt][Hh]
CAPTION [Cc][aA][pP][tT][Ii][Oo][nN]


%%

{LAB}{HTML}{RAB} {printf("H\n");}
{LAB}{SLASH}{HTML}{RAB} {printf("H\n");}

{LAB}{BODY}{RAB} {printf("p\n");}
{LAB}{SLASH}{BODY}{RAB} {printf("p\n");}


{LAB}{HEADER}"1"{RAB} {printf("G");}
{LAB}{HEADER}"2"{RAB} {printf("G");}
{LAB}{HEADER}"3"{RAB} {printf("G");}
{LAB}{SLASH}{HEADER}"1"{RAB} {printf("G");}
{LAB}{SLASH}{HEADER}"2"{RAB} {printf("G");}
{LAB}{SLASH}{HEADER}"3"{RAB} {printf("G");}

{LAB}{PARA}{RAB} {printf("p\n");}
{LAB}{SLASH}{PARA}{RAB} {printf("p\n");}


{LAB}{BOLD}{RAB} {printf("p\n");}
{LAB}{SLASH}{BOLD}{RAB} {printf("p\n");}


{LAB}{STRONG}{RAB} {printf("s\n");}
{LAB}{SLASH}{STRONG}{RAB} {printf("s\n");}



{LAB}{ITALIC}{RAB} {printf("s\n");}
{LAB}{SLASH}{ITALIC}{RAB} {printf("s\n");}



{LAB}{EMPH}{RAB} {printf("s\n");}
{LAB}{SLASH}{EMPH}{RAB} {printf("s\n");}



{LAB}{MARK}{RAB} {printf("s\n");}
{LAB}{SLASH}{MARK}{RAB} {printf("s\n");}


{LAB}{SMALL}{RAB} {printf("s\n");}
{LAB}{SLASH}{SMALL}{RAB} {printf("s\n");}

{LAB}{DEL}{RAB} {printf("s\n");}
{LAB}{SLASH}{DEL}{RAB} {printf("s\n");}

{LAB}{INS}{RAB} {printf("s\n");}
{LAB}{SLASH}{INS}{RAB} {printf("s\n");}

{LAB}{SUB}{RAB} {printf("s\n");}
{LAB}{SLASH}{SUB}{RAB} {printf("s\n");}

{LAB}{SUP}{RAB} {printf("s\n");}
{LAB}{SLASH}{SUP}{RAB} {printf("s\n");}

{LAB}{TABLE}{RAB} {printf("s\n");}
{LAB}{SLASH}{TABLE}{RAB} {printf("s\n");}

{LAB}{TR}{RAB} {printf("s\n");}
{LAB}{SLASH}{TR}{RAB} {printf("s\n");}


{LAB}{TH}{RAB} {printf("s\n");}
{LAB}{SLASH}{TH}{RAB} {printf("s\n");}


{LAB}{TD}{RAB} {printf("s\n");}
{LAB}{SLASH}{TD}{RAB} {printf("s\n");}


{LAB}{CAPTION}{RAB} {printf("C\n");}
{LAB}{SLASH}{CAPTION}{RAB} {printf("C\n");}

. {}
%%
int main(void)
{
    yylex();
    return 0;
}

int yyerror(char *s)
{
    printf("Error");
    exit(1);
}
