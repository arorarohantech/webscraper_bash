#!/bin/bash
################################################################################################
##########									      ##########
##################################### SIMPLE WEB SCRAPPER ######################################
##########									      ##########
################################################################################################

# TAKING INPUT FROM THE USER
FILE=$1
if [ -z $FILE ] 
then
	echo "INPUT REQUIRED !! Enter file Name containing URL's."
	echo " "
	echo "           USAGE:-   ./script.sh <file_name>"
	exit 6
else
	if [ -O $FILE ]
	then
		echo "Gathering Information from $FILE...."
		echo " "
	else
		echo "File Reading ERROR.. Check Does file exists And have Correct Permissions!!"
	fi
fi


# FOR LOOP FOR EACH URL IN A FILE TAKEN FROM USER IN A TEXT FILE
CONTENT=$(cat $FILE)
CHK=$(wc -w $FILE | cut -d ' ' -f 1 )
if [ $CHK -gt 0 ] 
then
       echo "Content of the File:-"
       for i in $CONTENT
       do
	       echo $i | cut -d ' ' -f 1 >> tmpfile
       done

	CONTENT=$(cat tmpfile)
	COUNTER=1
	for i in $CONTENT
	do
		NM=$COUNTER$(echo $i|tr -d 'www.' | cut -d '/' -f 3)
		curl -o tmp $i
		#curl -o $NM $i
		cat tmp | egrep '^<h1>' | tr -d '<h1>'| tr -d '</h1>' >> $NM
		cat tmp | egrep '^<H1>' | tr -d '<H1>'| tr -d '</H1>' >> $NM
		cat tmp | egrep '^<P>' | tr -d '<P>'| tr -d '</P>' >> $NM
		cat tmp | egrep '^<p>' | tr -d '<p>'| tr -d '</p>' >> $NM
		COUNTER=$(( $COUNTER + 1 ))
	done
fi

# CLEANING
\rm -rf tmpfile
\rm -rf tmp
