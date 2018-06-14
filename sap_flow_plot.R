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
sapflowF$'doy as decimal' = (sapflowF$'doy as decimal'+sapflowF$doy)

##plot for doy as decimal
plot(sapflowF$`doy as decimal`, sapflowF$sapflowF1, type="l", 
     main="Sensor Sap Flow", xlab="Day of Year", ylab="Sap Flow", col="red")
lines(sapflowF$`doy as decimal`, sapflowF$sapflowF2, type="l", col="orange")
lines(sapflowF$`doy as decimal`, sapflowF$sapflowF3, type="l", col="green")
lines(sapflowF$`doy as decimal`, sapflowF$sapflowF4, type="l", col="blue")
lines(sapflowF$`doy as decimal`, sapflowF$sapflowF5, type="l", col="purple")
legend('Day of Year', Sap Flow, legend = c("Sensor 1", "Sensor 2", "Sensor 3,", "Sensor 4", "Sensor 5"))
