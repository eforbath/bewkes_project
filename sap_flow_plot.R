##Bewkes Project
os.flag <- 2
source("/Users/elenaforbath/Documents/GitHub/bewkes_field/sapflux_process.r")
metA <- read.csv("/Volumes/data/data_repo/field_data/bewkes/sensor/decagon/met_air.csv")
plot(sapflowF$doy, sapflowF$sapflowF1, type = "p")
