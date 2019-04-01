/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
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
     TEXT = 270
   };
#endif
/* Tokens.  */
#define HTML_BEGIN 258
#define HTML_END 259
#define BODY_BEGIN 260
#define BODY_END 261
#define HEADER_1_BEGIN 262
#define HEADER_1_END 263
#define HEADER_2_BEGIN 264
#define HEADER_2_END 265
#define HEADER_3_BEGIN 266
#define HEADER_3_END 267
#define PARA_BEGIN 268
#define PARA_END 269
#define TEXT 270




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 18 "parser.y"
{
    char *str;
}
/* Line 1529 of yacc.c.  */
#line 83 "parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

