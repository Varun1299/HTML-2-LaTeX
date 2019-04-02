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

{LAB}{BOLD}{RAB}        {return BOLD_BEGIN;}
{LAB}{SLASH}{BOLD}{RAB} {return BOLD_END;}

{LAB}{STRONG}{RAB} {return STRONG_BEGIN;}
{LAB}{SLASH}{STRONG}{RAB} {return STRONG_END;}



{LAB}{ITALIC}{RAB} {return ITALIC_BEGIN;}
{LAB}{SLASH}{ITALIC}{RAB} {return ITALIC_END;}



{LAB}{EMPH}{RAB} {return EMPH_BEGIN;}
{LAB}{SLASH}{EMPH}{RAB} {return EMPH_END;}



{LAB}{MARK}{RAB} {return MARK_BEGIN;}
{LAB}{SLASH}{MARK}{RAB} {return MARK_END;}


{LAB}{SMALL}{RAB} {return SMALL_BEGIN;}
{LAB}{SLASH}{SMALL}{RAB} {return SMALL_END;}

{LAB}{DEL}{RAB} {return DEL_BEGIN;}
{LAB}{SLASH}{DEL}{RAB} {return DEL_END;}

{LAB}{INS}{RAB} {return INS_BEGIN;}
{LAB}{SLASH}{INS}{RAB} {return INS_END;}

{LAB}{SUB}{RAB} {return SUB_BEGIN;}
{LAB}{SLASH}{SUB}{RAB} {return SUB_END;}

{LAB}{SUP}{RAB} {return SUP_BEGIN;}
{LAB}{SLASH}{SUP}{RAB} {return SUP_END;}

{LAB}{TABLE}{RAB} {return TABLE_BEGIN;}
{LAB}{SLASH}{TABLE}{RAB} {return TABLE_END;}

{LAB}{TR}{RAB} {return TR_BEGIN;}
{LAB}{SLASH}{TR}{RAB} {return TR_END;}


{LAB}{TH}{RAB} {return TH_BEGIN;}
{LAB}{SLASH}{TH}{RAB} {return TH_END;}


{LAB}{TD}{RAB} {return TD_BEGIN;}
{LAB}{SLASH}{TD}{RAB} {return TD_END;}


{LAB}{CAPTION}{RAB} {return CAPTION_BEGIN;}
{LAB}{SLASH}{CAPTION}{RAB} {return CAPTION_END;}



%%
