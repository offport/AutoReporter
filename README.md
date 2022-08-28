# Auto Reporter
## Markdown to Final PDF Report Really Quick!!
### Automatic report generation flexible enough to add custom sections

![](screenshots/logo.png)

![](screenshots/reportexample.png)

- You will not restricted to fields and items. You are not filling a form. It is just Markdown.
- Do not worry about formatting. You will never position an image again.
- Meant for penetration testers. Can be easily modified for other purposes.
- Document each finding/vulnerability in one Markdown file then compile the report.

### Features
- [x] Automatic table of contents 
- [x] Automatic sorting vulnerabilities by severity 
- [x] Automatic creation of summary of findings table
- [x] Python script to create a summary graph included
- [x] Colored keywords
- [x] Well-fromatted code blocks

### Limitations
- This only works on Linux

## Requirements

- Install Panda and Latex
		
	Ubuntu: `apt install texlive-latex-recommended texlive-fonts-extra texlive-latex-extra pandoc p7zip-full`
	
- Install python and matplotlib if you want to create a graph summary

	```
	apt-get install python3
	apt-get install python3-pip
	pip install matplotlib
	```	
- install pdftk

	`sudo apt install pdftk`

## Installation

- clone the repo

	`git clone https://github.com/offport/AutoReporter.git`
	
- Fill in your work in dir `doc`
	
- run the parsing script

	```
	chmod +x parser.sh
	./parser.sh
	```

## Recommendations

- Learn Markdown. It is mandatory. It is easy.
- When you create a Markdown table leave an empty line before and after the table.
- Do not copy and paste bullet points from Work to Markdown. It will mess up the parsing.
- When you use a breaker `---` leave two empty lines afterwards.
- The finding/vulnerability files must start with `##` followed by space.
- Order of findings/vulnerabilities in the final report is the alphabetical order of what comes after the ## in the file content in the first line.
	- Example: if the file starts with `## High - Bad Vulnerability` and a file starts with `## Critical - Worse Vulnerability`, the critical one will be first in the report.
	- Example: if the file starts with `## 192.168.0.2` and a file starts with `## 192.168.0.2`, the second one will go first in the report.
- If you are working with a team, sync your files to a central location.
	- Example: Github, Google Drive, oneDrive.. 

## Inspiring projects
- https://github.com/noraj/OSCP-Exam-Report-Template-Markdown
- https://github.com/Wandmalfarbe/pandoc-latex-template#installation


