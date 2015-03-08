# exploredata-courseproject1
Create graphs of electricity consumption using georges.hebrail's Electric power consumption data stored on UCI Machine Learning Repository

The script exploredataproject1_electricityconsumption.R
 1. Creates a subdirectory 'data' in the current working directory
 2. Downloads the entire electric power consumption data set and saves both the zip in the data directory
 3. Expands the dataset and saves it as household_power_consumption.txt in current working directory.
 4. Produces 480 x 480 pixel plots tiled plot1.png, plot2.png, plot3.png and plot4.png and saves them in the current working directory. 
 
The plots depict household how electricity consumption varies over a household energy usage varies over a 2-day period in February, 2007.


-----
Environment details

Script written for a unix-like environment and uses:
* method = "wget" to download the https file 
* and X11() as the graphics device.

------

Data Credits:

Original data collected by: 

Georges HÃ©brail (georges.hebrail '@' edf.fr), Senior Researcher, EDF R&D, Clamart, France
Alice BÃ©rard, TELECOM ParisTech Master of Engineering Internship at EDF R&D, Clamart, France

Metadata details available from:

https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

Graphs prepared with the assistance of 

Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.

