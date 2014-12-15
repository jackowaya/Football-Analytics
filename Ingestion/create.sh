#!/bin/bash
# Loads football data into a sqlite3 database.
Usage() {
    progname=`basename $0`

    exec >&2
    echo ""
    echo "Usage: create.sh <all|tables|lines|results|games> databaseName"
    echo ""
    exit 1
}

CreateTables() {
    sqlite3 $1 < create_table_scripts.sql
}

LoadLines() {
    TS=$(date +%s)
    for x in {1978..2014}
    do
	SEASONFILE=seasonLines-$x-$TS.csv
	POSTSEASONFILE=postseasonLines-$x-$TS.csv
	python preprocessLines.py $x ../RawData/Lines/nfl${x}lines.csv $SEASONFILE
	python preprocessLines.py $x ../RawData/Lines/post${x}lines.csv $POSTSEASONFILE
	sqlite3 $1 <<EOF
.mode csv
.import $SEASONFILE RawLines
.import $POSTSEASONFILE RawLines
EOF
	rm $SEASONFILE
	rm $POSTSEASONFILE
    done 
}

LoadResults() {
    TS=$(date +%s)
    for x in {1978..2014}
    do
	BOXSCOREFILE=boxScore-$x-$TS.csv
	grep -v "Week" ../AnalyticsTools/inst/extdata/BoxScores$x.csv | grep -v "W#" | grep -v "Playoffs" | while read line; do echo "$x,$line"; done > $BOXSCOREFILE
	sqlite3 $1 <<EOF
.mode csv
.import $BOXSCOREFILE RawResults
EOF
	rm $BOXSCOREFILE
    done
}

CreateGames() {
    sqlite3 $1 < convert_raw_tables.sql
}

# Main program
if [ $# -eq 0 -o $# -ne 2 ]
then
    Usage
fi

case "${1}" in
    all)
        CreateTables $2
	LoadLines $2
	LoadResults $2
	CreateGames $2
        ;;

    tables)
        CreateTables $2
        ;;

    lines)
        LoadLines $2
        ;;

    results)
	LoadResults $2
	;;
    convert)
	CreateGames $2
	;;
    usage|help)
        Usage
        ;;
    *)
        Usage
        ;;
esac
