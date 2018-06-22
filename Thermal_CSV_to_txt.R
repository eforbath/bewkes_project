## CSV to txt
Thermal.txt <- read.csv("/Volumes/data/data_repo/field_data/bewkes/Drone/Thermal Imagery/RawData/0620_Thermal_187_raster.csv")
write.table(Thermal.txt, file= "ThermalData.txt")
