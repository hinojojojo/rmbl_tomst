library(ggplot2)


#####
# Almont down
#####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_AlmontDown_94296912"

# Read the file and set column names
data <- read.csv("tomst_data/AlmontDown_data_94296912_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black") +
	scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020.

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Month == 9 & data$Year == 2020, ], 100)

# Then just put here the row numer
data <- data[3325:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)





#####
# Almont up
#####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_AlmontUp_94206011"

# Read the file and set column names
data <- read.csv("tomst_data/AlmontUp_data_94206011_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black") +
	scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020.

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2020 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[3325:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)




#####
# CBT between shrubs
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_CbtBetweenShrubs_94206017"

# Read the file and set column names
data <- read.csv("tomst_data/Cbt_BetweenShrubs_data_94206017_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black") +
	scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2021.

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2021 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[38365:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)





#####
# CBT Shrub Phenocam
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_CbtShrubPhenocam_94206008"

# Read the file and set column names
data <- read.csv("tomst_data/Cbt_ShrubPhenocam_data_94206008_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black") +
	scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from July 15 2022.

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2022 & data$Month == 7 & data$Day == 15, ], 1000)

# Then just put here the row numer
data <- data[68797:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)





#####
# Road Down
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_RoadDown_94206009"

# Read the file and set column names
data <- read.csv("tomst_data/Road_Down_data_94206009_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black") +
	scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2020 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[3325:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)





#####
# Road Up
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_RoadUp_94206015"

# Read the file and set column names
data <- read.csv("tomst_data/Road_Up_data_94206015_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black") +
	scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2020 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[3325:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)





#####
# Pfeiler Left
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_PfeilerLeft_94206020"

# Read the file and set column names
data <- read.csv("tomst_data/Pfeiler_Left_data_94206020_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black")
	#scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2020 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[3325:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)





#####
# Pfeiler Right
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_PfeilerRight_94206013"

# Read the file and set column names
data <- read.csv("tomst_data/Pfeiler_Right_data_94206013_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black")
	#scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2020 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[3325:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)





#####
# PBM NearPhenocamClose
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_PbmNearPhenocamClose_94206010"

# Read the file and set column names
data <- read.csv("tomst_data/PBM_NearPhenocamClose_data_94206010_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black")
	#scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2021 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[38365:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)





#####
# PBM PhenocamRightFar
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_PbmPhenocamRightFar_94206006"

# Read the file and set column names
data <- read.csv("tomst_data/PBM_PhenocamRightFar_data_94206006_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black")
	#scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2020 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[3325:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)






#####
# Cinnamon Left
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_CinnamonLeft_94206018"

# Read the file and set column names
data <- read.csv("tomst_data/Cinnamon_Left_data_9406018_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black")
	#scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2020 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[3325:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)





#####
# Cinnamon Right
####

# First, set an ID for the site/sensor/location
ID <- "Enquist_Gradient_CinnamonRight_94206014"

# Read the file and set column names
data <- read.csv("tomst_data/Cinnamon_Right_data_94206014_0.csv", sep = ";", header = FALSE)
colnames(data) <- c("index", "date", "X", "T1", "T2", "T3", "Soil_moisture_raw", "shake", "errFlag", "x")

# Extract date info to populate Year, Month, Day and Time columns
data$datePOSIXct <- as.POSIXct(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
dates <- strptime(x = data$date, tz = "GMT", format = "%Y.%m.%d %H:%M")
data$Year <- dates$year + 1900
data$Month <- dates$mon + 1
data$Day <- dates$mday
data$"Time (24h)" <- paste(sprintf(fmt = "%02d", dates$hour), sprintf(fmt = "%02d", dates$min), sep = ":")

# Use these lines to explore the data and figure out when the sensor was installed or when do we have good data
ggplot(data = data, mapping = aes(x = datePOSIXct)) +
	geom_line(aes(y = T1), color = "blue") +
	geom_line(aes(y = T1), color = "green") +
	geom_line(aes(y = T1), color = "red") +
	geom_line(aes(y = Soil_moisture_raw/100), color = "black")
	#scale_x_datetime(limits = c(as.POSIXct("2020-10-01"), as.POSIXct("2020-10-02")))

# In the following line, note the date when the good data starts:w
# We will take as good data from September 01 2020

# Subset to keep only the real meteo data
# Use and ajust the next line to figure out the row numer of the start of good data
head(data[data$Year == 2020 & data$Month == 9 & data$Day == 1, ], 1000)

# Then just put here the row numer
data <- data[3325:nrow(data), ]
head(data)  # Check that the file starts where it should

# Check if there is any data with errFlag not equal to 0 which may indicate an error
data[data$errFlag != 0, ]

# add the ID as a column
data$Raw_data_identifier <- ID

# Keep only the required columns
data <- data[, c("Raw_data_identifier", "Year", "Month", "Day", "Time (24h)", "T1", "T2", "T3", "Soil_moisture_raw")]

# Write the file with the proper name
write.csv(x = data, file = paste0("final_files/", ID, ".csv"), row.names = FALSE)

