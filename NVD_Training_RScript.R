#NVD_Training_RScript.R

#----------Training----------#
#[30]
#https://stackoverflow.com/questions/37257572/how-can-i-combine-two-dataframes-with-different-lengths-in-r
nvdMerge2014_2015 <- merge(nvd2014TotalDistinctNARemoved, nvd2015TotalDistinctNARemoved, all = TRUE)

#[31]
nvdMerge2014_2015_2016 <- merge(nvdMerge2014_2015, nvd2016TotalDistinctNARemoved, all = TRUE)

#[32]
nvdTraining <- nvdMerge2014_2015_2016
write.csv(nvdTraining, "NVD_Training.csv", row.names = FALSE)

#----------Testing----------#
nvdTesting <- nvd2017TotalDistinctNARemoved
write.csv(nvdTesting, "NVD_Testing.csv", row.names = FALSE)
