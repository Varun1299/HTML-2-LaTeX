/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    HTML_BEGIN = 258,
    HTML_END = 259,
    BODY_BEGIN = 260,
    BODY_END = 261,
    HEADER_1_BEGIN = 262,
    HEADER_1_END = 263,
    HEADER_2_BEGIN = 264,
    HEADER_2_END = 265,
    HEADER_3_BEGIN = 266,
    HEADER_3_END = 267,
    PARA_BEGIN = 268,
    PARA_END = 269,
    BOLD_BEGIN = 270,
    BOLD_END = 271,
    STRONG_BEGIN = 272,
    STRONG_END = 273,
    ITALIC_BEGIN = 274,
    ITALIC_END = 275,
    EMPH_BEGIN = 276,
    EMPH_END = 277,
    MARK_BEGIN = 278,
    MARK_END = 279,
    SMALL_BEGIN = 280,
    SMALL_END = 281,
    DEL_BEGIN = 282,
    DEL_END = 283,
    INS_BEGIN = 284,
    INS_END = 285,
    SUB_BEGIN = 286,
    SUB_END = 287,
    SUP_BEGIN = 288,
    SUP_END = 289,
    TABLE_BEGIN = 290,
    TABLE_END = 291,
    TR_BEGIN = 292,
    TR_END = 293,
    TH_BEGIN = 294,
    TH_END = 295,
    TD_BEGIN = 296,
    TD_END = 297,
    CAPTION_BEGIN = 298,
    CAPTION_END = 299,
    TEXT = 300
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 21 "parser.y" /* yacc.c:1909  */

    char *str;

#line 104 "parser.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
