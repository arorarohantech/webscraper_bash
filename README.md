
<h1>Bash simple Web Scraper</h1>


Writing a Basic Web Scraper
 
<b> Requirements:</b><br>
  ◦ Basic Bash Scripting knowledge<br>
	◦	Linux knowledge<br>

<b>Project Idea:</b>
1) This will combine your bash scripting knowledge with commands such as ‘curl’, ‘grep’, and ‘tr’. 
2) You will make a simple web scraper that will take a file of URLs as an input (use variables) and pull the main text from each of those sites  automatically. 
3) This script will allow us to quickly reformat multiple websites into text documents that are saved on our virtual machines. 

<b>Here is what script should be doing:</b><br>
	•	Accept a file of URLs as the input from the user.<br>
	•	Each URL should exist on its own line.<br>
	•	A for loop to loop through the URLs.<br>
 
 <b>Project Logic:</b><br>
For each loop through a URL do the following :<br>
	•	Use ‘curl’ to download the HTML file<br>
	•	Use ‘grep’ to only pull the "\<h1>" and "\<p>" tags <br>
	•	With ‘tr’, trim the output and cut away the tags <br>
	•	Save this output to a file name (make sure to increment this with a counter variable so each filename is unique) <br>
	•	‘cat’ the file to verify that your script was successful <br>
  
