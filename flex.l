%{
    #include "y.tab.h"
    #include <stdio.h>
    %}

SPACE [ \t ]+
LETTERS [a-zA-Z]+
DIGITS [0-9]+
text ({LETTERS}|{DIGITS}|{SPACE})
%%

"<h1>" {return HEADER_1_BEGIN;}
"</h1>" {return HEADER_1_END;}
"<h2>" {return HEADER_2_BEGIN;}
"</h2>" {return HEADER_2_END;}
"<h3>" {return HEADER_3_BEGIN;}
"</h3>" {return HEADER_3_END;}
"<h4>" {return HEADER_4_BEGIN;}
"</h4>" {return HEADER_4_END;}
"<h5>" {return HEADER_5_BEGIN;}
"</h5>" {return HEADER_5_END;}
"<h6>" {return HEADER_6_BEGIN;}
"</h6>" {return HEADER_6_END;}
"<p>"  {return PARA_BEGIN;}
"</p>" {return PARA_END;}

"<b>"  {return BOLD_BEGIN;}
"</b>"  {return BOLD_END;}
"<strong>"  {return STRONG_BEGIN;}
"</strong>"  {return STRONG_END;}

"<i>" {return ITALICS_BEGIN;}
"</i>" {return ITALICS_END;}
"<em>" {return EMPH_BEGIN;}
"</em>" {return EMPH_END;}
"<mark>" {return MARK_BEGIN;}
"</mark>" {return MARK_END;}
"<small>" {return SMALL_BEGIN;}
"</small>" {return SMALL_END;}
"<del>" {return DELETED_BEGIN;}
"</del>" {return DELETED_END;}
"<ins>" {return INSERTED_BEGIN;}
"</ins>" {return INSERTED_END;}
"<sub>" {return SUBSCRIPT_BEGIN;}
"</sub>" {return SUBSCRIPT_END;}
"<sup>" {return SUPERSCRIPT_BEGIN;}
"</sup>" {return SUPERSCRIPT_END;}
"<tr>" {return TABLEROW_BEGIN;}
"</tr>" {return TABLEROW_BEGIN;}
{text}   {return TEXT;}

%%
int main(void)
{
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Error");
    exit(1);
}
