#reading thermal images
list.files("/Volumes/data/data_repo/field_data/bewkes/Drone/Thermal Imagery/Imagery/Subset_06_20")
getwd()
setwd("/Volumes/data/data_repo/field_data/bewkes/Drone/Thermal Imagery/Imagery")
getwd()
      
#GPS coordinates of drone flight
read.table("/Volumes/data/data_repo/field_data/bewkes/Drone/RBG Imagery/RawData/bewkes_flight_2.txt")
setwd("/Volumes/data/data_repo/field_data/bewkes/Drone/RBG Imagery/RawData")
RGB.GPS <- read.table("bewkes_flight_2.txt", sep=",", header = FALSE)
colnames(RGB.GPS)[colnames(RGB.GPS)=="V1"] <- "Name"
colnames(RGB.GPS)[colnames(RGB.GPS)=="V2"] <- "Longitude"
colnames(RGB.GPS)[colnames(RGB.GPS)=="V3"] <- "Latitude"
colnames(RGB.GPS)[colnames(RGB.GPS)=="V4"] <- "Altitude"
colnames(RGB.GPS)[colnames(RGB.GPS)=="V5"] <- "Yaw"
colnames(RGB.GPS)[colnames(RGB.GPS)=="V6"] <- "Pitch"
colnames(RGB.GPS)[colnames(RGB.GPS)=="V7"] <- "Roll"
colnames(RGB.GPS)[colnames(RGB.GPS)=="V8"] <- "TimeID"


Thermal.GPS <- data.frame(name = list.files("/Volumes/data/data_repo/field_data/
                                            bewkes/Drone/Thermal Imagery/Imagery/Subset_06_20"))
Thermal.GPS$temp.name <- gsub("\\0620_Thermal _", "", Thermal.GPS$name)
Thermal.GPS$temp.name2 <- gsub(".JPG", "", Thermal.GPS$temp.name)
Thermal.GPS$temp.name3 <- as.numeric(gsub("\\D", "", Thermal.GPS$temp.name2))
Thermal.GPS <- Thermal.GPS[order(Thermal.GPS$temp.name3), ]
Thermal.GPS$newcolumn <- NA
colnames(Thermal.GPS)[colnames(Thermal.GPS)=="newcolumn"] <- "TimeID"

#joining RGB and Thermal Tables
RGB.GPS$TimeID <- seq(1, dim(RGB.GPS)[1], by= 1)
Thermal.GPS$TimeID <- seq(1, 157[1], by= 0.5)
install.packages("plyr")
All.GPS <- join(RGB.GPS, Thermal.GPS, by= c("TimeID"), type= "full")

