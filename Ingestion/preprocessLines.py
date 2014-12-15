# Preprocesses the lines files to...
# 1.) Add a year column at the beginning
# 2.) Add a date in the format that football outsiders uses at the beginning.
# 3.) If this is regular season data, add an empty column for the playoff round number
# 4.) Remove the column header
import sys
import csv
import datetime

if len(sys.argv) != 4:
    print "Usage: preprocessLines.py year inputFile outputFile"
    sys.exit(2)

def convertDate(dtStr):
    """Converts a date from a format like 01/07/1978 to a format like 7-Jan"""
    dt = datetime.datetime.strptime(dtStr, "%m/%d/%Y")
    output = dt.strftime("%d-%b")
    if output[0] == "0":
        return output[1:]
    else:
        return output

with open(sys.argv[2], "rb") as infile:
    reader = csv.reader(infile)
    headers = None
    with open(sys.argv[3], "wb") as outfile:
        writer = csv.writer(outfile)
        for inline in reader:
            if headers == None:
                headers = inline
                isPostseason = "Round" in headers
                continue

            outrow = [sys.argv[1], convertDate(inline[0]), inline.pop(0)]
            if not isPostseason:
                # Add the empty column for playoff round number.
                outrow.append("")
            outrow.extend(inline)
            writer.writerow(outrow)
