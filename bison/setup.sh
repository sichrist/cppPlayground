#!/bin/sh

FOLDERS=$(find -maxdepth 1 -not -empty -type d)
LEXFILES=$(find -name *.l)
BISONFILES=$(find -name *.y)
BUILDFOLDER="build"
BUILDSUBFOLDER=""

#lex compile files
LEX="lex"
LEX_FLAGS="-d -o"

#compile bison/yacc files
BISON="bison"
BISON_FLAGS="-d"

#C compiler
CC="cc"
CFLAGS="-lfl -o "

all()
{

	build ${BUILDFOLDER}

	echo "Compiling Lexfiles..."
	for file in $LEXFILES
	do
		echo ""
		lexfile=$(echo $file | sed "s/.*\///g")
		lexfile=$(echo $lexfile | sed "s/\.l//g")
		build "${BUILDFOLDER}/${lexfile#"./"}"
		compile_lex ${lexfile}

		BUILDSUBFOLDER+=$(echo ${lexfile} | sed "s/\/.*//g" )" "
	
	done

	echo ""
	echo "Compiling Bisonfiles..."

	for file in $BISONFILES
	do
		bisonfile=$(echo $file | sed "s/.*\///g")
		bisonfile=$(echo $bisonfile | sed "s/\.y//g")
		compile_bison $bisonfile
	done

	echo ""
	echo "Compile C-files..."
	for folder in $BUILDSUBFOLDER
	do
		CFILES=$(find ${BUILDFOLDER}/$folder/ -name *.c)
		compile_c $folder "${CFILES}"
	done

}

build()
{
	echo "Creating folder $1..."
	mkdir -p $1
}

compile_lex()
{
	lexfile="$1/$1.l"
	outputfile="${BUILDFOLDER}/$1/$1.yy.c"
	echo $lexfile " >>> " $outputfile
	$LEX $LEX_FLAGS $outputfile $lexfile
}

compile_bison()
{
	bisonfile="$1/$1.y"
	outputfile="${BUILDFOLDER}/$1/"
	echo $bisonfile " >>> " $outputfile
	$BISON $BISON_FLAGS $bisonfile
	mv *.tab.* $outputfile
}

compile_c()
{
	build $BUILDFOLDER/bin
	bin=$1
	deps=$2
	echo $($CC $CFLAGS $BUILDFOLDER/bin/$bin $deps)
}

clean()
{
	rm -rf build *yy.c *.tab.*
}
case "$1" in
	"all" )
		clean
		all
		;;
	"clean" )
		clean
		;;
	*)
	all
esac
