t1 -> 
Data set, with test and train data, with mean and standard deviation variables.
Columns:	Subject: subject id
		Activity: activity name
		Accelerationmeanx
		Accelerationmeany
		Accelerationmeanz
		Accelerationstdx
		Accelerationstdy
		Accelerationstdz
		Velocitymeanx
		Velocitymeany
		Velocitymeanz
		Velocitystdx
		Velocitystdy
		Velocitystdz
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

t2 ->
Data set, with mean of all variables of t1 grouped by activity and subject.
Columns:	Category
		Subject
		Maccelerationmeanx
		Maccelerationmeany
		Maccelerationmeanz
		Maccelerationstdx
		Maccelerationstdy
		Maccelerationstdz
		MVelocitymeanx
		MVelocitymeany
		MVelocitymeanz
		MVelocitystdx
		MVelocitystdy
		MVelocitystdz
