# A stupid way to parse out the historical lines from footballlocks.com
# Fortunately, they are reliably formatted.

import sys
import csv
import re

MONEY_LINE_PATTERN = re.compile("([+-]\$\d+)\s*([+-]\$\d+)")

NAME_TRANSLATIONS = {
    "Arizona": "Arizona Cardinals",
    "Atlanta": "Atlanta Falcons",
    "Baltimore": "Baltimore Ravens",
    "Buffalo": "Buffalo Bills",
    "Carolina": "Carolina Panthers",
    "Chicago": "Chicago Bears",
    "Cincinnati": "Cincinnati Bengals",
    "Cleveland": "Cleveland Browns",
    "Dallas": "Dallas Cowboys",
    "Denver": "Denver Broncos",
    "Detroit": "Detroit Lions",
    "Green Bay": "Green Bay Packers",
    "Houston": "Houston Texans",
    "Indianapolis": "Indianapolis Colts",
    "Jacksonville": "Jacksonville Jaguars",
    "Kansas City": "Kansas City Chiefs",
    "Miami": "Miami Dolphins",
    "Minnesota": "Minnesota Vikings",
    "New England": "New England Patriots",
    "New Orleans": "New Orleans Saints",
    "NY Giants": "New York Giants",
    "NY Jets": "New York Jets",
    "Oakland": "Oakland Raiders",
    "Philadelphia": "Philadelphia Eagles",
    "Pittsburgh": "Pittsburgh Steelers",
    "San Diego": "San Diego Chargers",
    "San Francisco": "San Francisco 49ers",
    "Seattle": "Seattle Seahawks",
    "St. Louis": "St. Louis Rams",
    "Tampa Bay": "Tampa Bay Buccaneers",
    "Tennessee": "Tennessee Titans",
    "Washington": "Washington Redskins"
}

def getCellContent(line):
    # Why does one file randomly have </D>? Who knows?
    return line.replace("<TD>", "").replace("</TD>", "").replace("</D>", "").replace("</TD >", "").replace("<br>", "").replace("<I>", "").strip()

def getTeamForOutput(team):
    try:
        return NAME_TRANSLATIONS[team.replace("At ", "")]
    except KeyError:
        return None

def getSpread(spread):
    spread = spread.replace("&nbsp;", "")
    if "PK" in spread:
        return 0
    else:
        return float(spread)

def parseMoneyLine(moneyLines):
    m = MONEY_LINE_PATTERN.search(moneyLines.replace("&nbsp;", ""))
    if m:
        favorite = int(m.group(1).replace("$", ""))
        underdog = int(m.group(2).replace("$", ""))
        return favorite, underdog
    else:
        print "Couldn't handle money line " + moneyLines
        return "", ""
    
outputFile = open("../RawData/Lines/Lines.csv", "wb")
writer = csv.writer(outputFile)
writer.writerow(["Year", "Week", "Favorite", "Underdog", "Line", "Favorite Home", "Over Under", "Favorite Money Line", "Underdog Money Line"])
for week in range(1, 18):
    print "Handling week " + str(week)
    inputFile = open("../RawData/Lines/RawLinesWeek%d.html" % week)
    lines = inputFile.readlines()
    inputFile.close()
    currentYear = None
    lineNum = 0;
    while lineNum < len(lines):
        line = lines[lineNum]
        if "Closing Las Vegas" in line:
            currentYear = line.strip()[-4:]

        if "<TR>" in line:
            # Check for a game line.
            lineNum += 2
            favoriteTeamContent = getCellContent(lines[lineNum])
            favoriteTeam = getTeamForOutput(favoriteTeamContent)
            if favoriteTeam is None:
                continue
            lineNum += 1
            # Possibly step past a (At London) or similar weird thing
            while "<TD>" not in lines[lineNum]:
                lineNum += 1
            spread = getSpread(getCellContent(lines[lineNum]))
            lineNum += 1
            underdog = getTeamForOutput(getCellContent(lines[lineNum]))
            lineNum += 1
            # Possibly step past a (At London) or similar weird thing
            while "<TD>" not in lines[lineNum]:
                lineNum += 1
            overUnder = float(getCellContent(lines[lineNum]))
            lineNum += 1
            favoriteMoneyLine, underdogMoneyLine = parseMoneyLine(getCellContent(lines[lineNum]))
            writer.writerow([currentYear, week, favoriteTeam, underdog, spread, "At" in favoriteTeamContent, overUnder, favoriteMoneyLine, underdogMoneyLine])
        lineNum += 1

outputFile.close()
            
