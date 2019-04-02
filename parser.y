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
#include "helper.h"  /* Contains definition of `symrec' */

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
        | HTML_BEGIN BODY HTML_END      { FILE *filePtr = fopen("output.tex", "w");fprintf(filePtr, "%s\n", $2); fclose(filePtr);}
        | error '\n' {  yyerrok; }
;

BODY:                                    { $$ = strdup(""); }
        | BODY_BEGIN TAG_TEXT BODY_END   { $$ = join(join("\\documentclass[]{article}\\usepackage[utf8]{inputenc}\\usepackage{ulem, fixltx2e, color, soul}\\title{compilers} \\author{ARSV} \\date{April 2019} \\begin{document}\n", $2), "\\end{document}"); }     

TAG_TEXT:                   { $$ = strdup(""); }
        | TEXT TAG_TEXT     { $$ = join($1, join(" ",$2)); }    
        | HEADER_1_BEGIN TEXT_STR HEADER_1_END TAG_TEXT { $$ = join(join("\\section{",$2), join("}",$4)); }
        | HEADER_2_BEGIN TEXT_STR HEADER_2_END TAG_TEXT { $$ = join(join("\\subsection{",$2), join("}",$4)); }
        | HEADER_3_BEGIN TEXT_STR HEADER_3_END TAG_TEXT { $$ = join(join("\\subsubsection{",$2), join("}",$4)); }
        | PARA_BEGIN TAG_TEXT PARA_END TAG_TEXT { $$ = join(join(" \\par \\noindent ",$2), join("\n",$4)); }
	| BOLD_BEGIN TAG_TEXT BOLD_END TAG_TEXT { $$ = join(join("\\textbf{", $2), join("}", $4)); }
	| ITALIC_BEGIN TAG_TEXT ITALIC_END TAG_TEXT { $$ = join(join("\\textit{", $2), join("}", $4)); }
	| EMPH_BEGIN TAG_TEXT EMPH_END TAG_TEXT { $$ = join(join("\\textit{", $2),join("}", $4)); }
	| DEL_BEGIN TAG_TEXT DEL_END TAG_TEXT { $$ = join(join("\\sout{", $2), join("}", $4)); }
	| STRONG_BEGIN TAG_TEXT STRONG_END TAG_TEXT { $$ = join(join("\\textbf{", $2), join("}", $4)); }
	| SUB_BEGIN TAG_TEXT SUB_END TAG_TEXT { $$ = join(join("\\textsubscript{", $2),  join("}", $4)); }
	| SUP_BEGIN TAG_TEXT SUP_END TAG_TEXT { $$ = join(join("\\textsuperscript{", $2), join("}", $4)); }
	| MARK_BEGIN TAG_TEXT MARK_END TAG_TEXT { $$ = join(join("\\hl{", $2), join("}", $4)); }
	| INS_BEGIN TAG_TEXT INS_END TAG_TEXT { $$ = join(join("\\underline{", $2), join("}", $4)); }
	| SMALL_BEGIN TAG_TEXT SMALL_END TAG_TEXT { $$ = join(join("\\small{", $2), join("}", $4)); }
	| TABLE_BEGIN TAG_TEXT TABLE_END TAG_TEXT { $$ = join(join("\\begin{table}[h] \\begin{center}", $2), join("\\end{center} \\end{table}", $4)); }
	| TR_BEGIN TAG_TEXT TR_END TAG_TEXT { $$ = join($2,join("  \\\\ ", $4));}
	| TH_BEGIN TAG_TEXT TH_END TAG_TEXT { $$ = join(join("\\textbf{", $2), join("} &", $4)); }
	| TD_BEGIN TAG_TEXT TD_END TAG_TEXT { $$ = join($2, join(" &", $4)); }
	| CAPTION_BEGIN TAG_TEXT CAPTION_END TAG_TEXT { $$ = join(join("\\caption{",$2), join("}",$4)); }



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
