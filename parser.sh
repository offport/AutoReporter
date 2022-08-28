# First summary
echo "| RF# | Severity | Finding | \n|---|---|---|" >summary.md; for i in docs/finding*; do cat "$i" | head -1 ; done | grep "## Critical" > summary0.md ; for i in docs/finding*; do cat "$i" | head -1 ; done | grep "## High" >> summary0.md ; for i in docs/finding*; do cat "$i" | head -1 ; done | grep "## Medium" >> summary0.md ; for i in docs/finding*; do cat "$i" | head -1 ; done | grep "## Low" >> summary0.md ; for i in docs/finding*; do cat "$i" | head -1 ; done | grep "## Info" >> summary0.md; cat summary0.md | cut -d "#" -f 3 | awk -F'[/-]' '{print "|" NR "|" $1 "|" $2 "|"}' >> summary.md; echo "---\n" >> summary.md 

# Soft the findings
cat summary0.md > fileorder ; cat fileorder | while read line; do grep -H -r "$line" docs/finding* | cut -d ":" -f 1; done > ordered ; for i in $(cat ordered) ; do cat "$i" ; done > report.md ; rm fileorder ordered summary0.md

python3 PlotVulnerabilityBarGraph.py

# Combine files
cat docs/0*.md summary.md report.md docs/appendix.md > fullreport.md

# Adding colors for Pandoc
sed -i 's/Critical | /\[Critical\]\{color\=\"purple\"\} | /g' fullreport.md
sed -i 's/Critical - /\[Critical\]\{color\=\"purple\"\} - /g' fullreport.md 
sed -i 's/High | /\[High\]\{color\=\"red\"\} | /g' fullreport.md 
sed -i 's/High - /\[High\]\{color\=\"red\"\} - /g' fullreport.md 
sed -i 's/Medium | /\[Medium\]\{color\=\"orange\"\} | /g' fullreport.md 
sed -i 's/Medium - /\[Medium\]\{color\=\"orange\"\} - /g' fullreport.md 
sed -i 's/Low | /\[Low\]\{color\=\"blue\"\} | /g' fullreport.md 
sed -i 's/Low - /\[Low\]\{color\=\"blue\"\} - /g' fullreport.md 
sed -i 's/Informative | /\[Informative\]\{color\=\"green\"\} | /g' fullreport.md 
sed -i 's/Informative - /\[Informative\]\{color\=\"green\"\} - /g' fullreport.md 


pandoc fullreport.md -o  output.pdf \
--from markdown+yaml_metadata_block+raw_html \
--template eisvogel.latex \
--table-of-contents \
--toc-depth 3 \
--number-sections \
--top-level-division=chapter --listing -H style.tex --lua-filter colors.lua \
--resource-path=.:docs 

pdftk docs/cover.pdf output.pdf cat output Report.pdf

rm summary.md report.md fullreport.md output.pdf
