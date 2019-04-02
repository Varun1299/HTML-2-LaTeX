/* How to compile 
$bison calc.c
$gcc calc.tab.c -lm
Reference: http://dinosaur.compilertools.net/bison/bison_5.html
*/

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h> 
#include <string.h>
#include "calc.h"  /* Contains definition of `symrec' */

int  yylex(void);
void yyerror (char  *);
%}

%union {
    char *str;
}

%token HTML_BEGIN
%token HTML_END
%token BODY_BEGIN
%token BODY_END
%token HEADER_1_BEGIN
%token HEADER_1_END
%token HEADER_2_BEGIN
%token HEADER_2_END
%token HEADER_3_BEGIN
%token HEADER_3_END
%token PARA_BEGIN
%token PARA_END
%token BOLD_BEGIN
%token BOLD_END
%token STRONG_BEGIN
%token STRONG_END
%token ITALIC_BEGIN
%token ITALIC_END
%token EMPH_BEGIN
%token EMPH_END
%token MARK_BEGIN
%token MARK_END
%token SMALL_BEGIN
%token SMALL_END
%token DEL_BEGIN
%token DEL_END
%token INS_BEGIN
%token INS_END
%token SUB_BEGIN
%token SUB_END
%token SUP_BEGIN
%token SUP_END
%token TABLE_BEGIN
%token TABLE_END
%token TR_BEGIN
%token TR_END
%token TH_BEGIN
%token TH_END
%token TD_BEGIN
%token TD_END
%token CAPTION_BEGIN
%token CAPTION_END
%token <str> TEXT

%type  <str> TEXT_STR
%type  <str> TAG_TEXT
%type  <str> BODY


/* Grammar follows */

%%
START:    
        | HTML_BEGIN BODY HTML_END      { printf("%s\n", $2);}
        | error '\n' {  yyerrok; }
;

BODY:                                    { $$ = strdup(""); }
        | BODY_BEGIN TAG_TEXT BODY_END   { $$ = join(join("\\begin{document}\n", $2), "\\end{document}"); }     

TAG_TEXT:                   { $$ = strdup(""); }
        | TEXT TAG_TEXT     { $$ = join($1, $2); }    
        | HEADER_1_BEGIN TEXT_STR HEADER_1_END TAG_TEXT { $$ = join(join("\\section{",$2), join("}",$4)); }
        | HEADER_2_BEGIN TEXT_STR HEADER_2_END TAG_TEXT { $$ = join(join("\\subsection{",$2), join("}",$4)); }
        | HEADER_3_BEGIN TEXT_STR HEADER_3_END TAG_TEXT { $$ = join(join("\\subsubsection{",$2), join("}",$4)); }
        | PARA_BEGIN TEXT_STR PARA_END TAG_TEXT { $$ = join(join("\n",$2), join("\n",$4)); }
;

TEXT_STR:               { $$ = strdup(""); }
        | TEXT_STR TEXT { $$ = join($1, $2); }

/* End of grammar */
%%

int main ()
{
   yyparse ();
}

void yyerror (char *s)  /* Called by yyparse on error */
{
  printf ("%s\n", s);
}