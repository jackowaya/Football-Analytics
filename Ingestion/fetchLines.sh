#!/bin/bash
for x in {1..17}
do
    wget -O ../RawData/Lines/RawLinesWeek$x.html http://www.footballlocks.com/nfl_odds_week_$x.shtml
    sleep 30
done
