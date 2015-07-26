# XSLT-CV

This is XSLT based code I used to show my CV. Basic idea was to create a easily maintenable CV where through simply XML editing I could add/edit context without worrying about formatting.

This code practically uses only browser capability to do XSLT transformation itself.

# Run instructions.

Extract the repository to your local PC, and open cv.xml in your browser (first of second line to a code). 

# Code Description

XSLT translation itself is being connected through a second line of cv.xml

<?xml-stylesheet type="text/xsl" href="templates/cv_neat.xsl" ?>

The main code that makes all the magic is exactly:
*templates/cv_neat.xsl*

further templates will be done later in the development.
