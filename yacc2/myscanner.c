#include <iostream>
extern int yylex();

int main(void)
{
	int ntoken=yylex();
	while(ntoken)
	{
		ntoken = yylex();
	}
}