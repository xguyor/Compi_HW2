%{
	/* Declarations */
	#include <stdio.h>
    #include <iostream>
    
    // source.tab.hpp is created by Bison
    #include "output.hpp"
    #include "parser.tab.hpp"

%}

%option yylineno
%option noyywrap

digit		([0-9])
PositiveDigit	([1-9])
letter		([a-zA-Z])
CRLF		(\r\n)
LF			(\n)
CR			(\r)
whitespace	({LF}|{CR}|\ |\t)
NewLine 	({LF}|{CR}|{CRLF})

%% 
void					            return VOID;
int						            return INT;
byte					            return BYTE;
b				                    return B;
or						            return OR;
and						            return AND;
bool					            return BOOL;
not						            return NOT;
true					            return TRUE;
false					            return FALSE;
return					            return RETURN;
if						            return IF;
else					            return ELSE;
while					            return WHILE;
break					            return BREAK;
continue				            return CONTINUE;
\;						            return SC;
,						            return COMMA;
\(						            return LPAREN;
\)                                  return RPAREN;
\{                                  return LBRACE;
\}                                  return RBRACE;
=                                   return ASSIGN;
(==)|(!=)                           return LP_RELOP;
(<)|(>)|(<=)|(>=)                   return HP_RELOP;
\+|\-	    			            return LP_BINOP;
\*|\/	                            return HP_BINOP;
{letter}({letter}|{digit})*	        return ID;
0|({PositiveDigit}{digit}*)         return NUM;
\"([^\n\r\"\\]|\\[rnt\"\\])+\"         return STRING;
\/\/[^\r\n]*[\r|\n|\r\n]?              {};
{whitespace}|{NewLine}              {};
.                       { output::errorLex(yylineno); exit(0);};
%%

