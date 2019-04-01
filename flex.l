%{
#include "parser.tab.h"
#include <stdio.h>
int tag_open = 0;
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

{LAB}{HTML}{RAB} {    tag_open = 0; return HTML_BEGIN;    }   //html open tag
{LAB}{SLASH}{HTML}{RAB} {    tag_open = 0; return HTML_END; }  //html end tag

{LAB}{BODY}{RAB} {    tag_open = 1; return BODY_BEGIN;    }    //body begin tag
{LAB}{SLASH}{BODY}{RAB} {    tag_open = 0; return BODY_END; }  //body end tag

{LAB}{HEADER}"1"{RAB} {    return HEADER_1_BEGIN;    }   //h1 header tag
{LAB}{HEADER}"2"{RAB} {    return HEADER_2_BEGIN;    }   //h2 header tag
{LAB}{HEADER}"3"{RAB} {    return HEADER_3_BEGIN;    }   //h3 header tag
{LAB}{SLASH}{HEADER}"1"{RAB} {    return HEADER_1_END; }   //h1 end tag
{LAB}{SLASH}{HEADER}"2"{RAB} {    return HEADER_2_END; }    //h2 end tag
{LAB}{SLASH}{HEADER}"3"{RAB} {    return HEADER_3_END; }   //h3 end tag

{LAB}{PARA}{RAB} {    return PARA_BEGIN; }      //para begin tag
{LAB}{SLASH}{PARA}{RAB} {    return PARA_END; }  //para end tag

{text}       {   if(tag_open == 1) {  yylval.str = strdup(yytext); return TEXT; }    }    //text tag
.            {  return yytext[0];    }

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



%%
