##Bewkes Project
os.flag <- 2
source("/Users/elenaforbath/Documents/GitHub/bewkes_field/sapflux_process.r")
metA <- read.csv("/Volumes/data/data_repo/field_data/bewkes/sensor/decagon/met_air.csv")
plot(sapflowF$hour, sapflowF$sapflowF1, type = "p")

#add new column, divide hours up by 24 and add to doy
sapflowF$newcolumn <- (sapflowF$hour / 24)
colnames(sapflowF)[colnames(sapflowF)=="newcolumn"] <- "hour as decimal"
sapflowF$newcolumn <- NA
colnames(sapflowF)[colnames(sapflowF)=="newcolumn"] <- "doy as decimal"
sapflowF$'doy as decimal' = (sapflowF$'hour as decimal'+sapflowF$doy)

##plot for doy as decimal
plot(sapflowF$`doy as decimal`, sapflowF$sapflowF1, type="l", 
     main="Sensor Sap Flow", xlab="Day of Year", ylab="Sap Flow", col="red")
lines(sapflowF$`doy as decimal`, sapflowF$sapflowF2, type="l", col="orange")
lines(sapflowF$`doy as decimal`, sapflowF$sapflowF3, type="l", col="green")
lines(sapflowF$`doy as decimal`, sapflowF$sapflowF4, type="l", col="blue")
lines(sapflowF$`doy as decimal`, sapflowF$sapflowF5, type="l", col="purple")
legend("center", c("Sensor 1", "Sensor 2", "Sensor 3,", "Sensor 4", "Sensor 5"), 
       col = c("red", "orange", "green", "blue", "purple"), lty = 1, bty = "n")

##plot for air
metA$newcolumn <- (metA$hour/24)
colnames(metA)[colnames(metA)== "newcolumn"] <- "hour as decimal"
metA$newcolumn <- NA
colnames(metA)[colnames(metA)=="newcolumn"] <- "doy as decimal"
metA$'doy as decimal' <- (metA$'hour as decimal' + metA$doy)
plot(metA$'doy as decimal', metA$temp, type = "l", main = "Change in Temperature",
     xlab="Day of Year", ylab="Temperature", col="red")

## plot for air for, just days 162 and 163
plot(metA$'doy as decimal'[metA$doy== "161"], metA$temp[metA$doy== "161"],
     type = "l", main = "Change in Temperature", col="red")
lines(metA$'doy as decimal'[metA$doy== "162"], metA$temp[metA$doy== "162"],
      type ="l", col= "red")
