#NVD_Training_Testing_Updated_RScript.R

#[31]
#https://stackoverflow.com/questions/37257572/how-can-i-combine-two-dataframes-with-different-lengths-in-r
nvdMerge2014_2015Updated <- merge(nvd2014UpdatedTotalDistinctRejectRemoved, nvd2015UpdatedTotalDistinctRejectRemoved, all = TRUE)
View(nvdMerge2014_2015Updated)
#---[NAs Removed]---#
nvdMerge2014_2015NAUpdated <- merge(nvd2014UpdatedTotalDistinctNARemoved, nvd2015UpdatedTotalDistinctNARemoved, all = TRUE)
View(nvdMerge2014_2015NAUpdated)

#[32]
nvdMerge2014_2015_2016Updated <- merge(nvdMerge2014_2015Updated, nvd2016UpdatedTotalDistinctRejectRemoved, all = TRUE)
View(nvdMerge2014_2015_2016Updated)
#---[NAs Removed]---#
nvdMerge2014_2015_2016NAUpdated <- merge(nvdMerge2014_2015NAUpdated, nvd2016UpdatedTotalDistinctNARemoved, all = TRUE)
View(nvdMerge2014_2015_2016NAUpdated)

#[32]*** (Year 2017 is included / added along with the years 2014, 2015 and 2016)
nvdMerge2014_2015_2016_2017Updated <- merge(nvdMerge2014_2015_2016Updated, nvd2017UpdatedTotalDistinctRejectRemoved, all = TRUE)
View(nvdMerge2014_2015_2016_2017Updated)
nvdMerge2014_2017TotalUpdated <- nvdMerge2014_2015_2016_2017Updated 
View(nvdMerge2014_2017TotalUpdated)
#---[NAs Removed]---#
nvdMerge2014_2015_2016_2017NAUpdated <- merge(nvdMerge2014_2015_2016NAUpdated, nvd2017UpdatedTotalDistinctNARemoved, all = TRUE)
View(nvdMerge2014_2015_2016_2017NAUpdated)
nvdMerge2014_2017TotalNAUpdated <- nvdMerge2014_2015_2016_2017NAUpdated
View(nvdMerge2014_2017TotalNAUpdated)

#----------Training----------#
#[33]
nvdTrainingUpdated <- nvdMerge2014_2015_2016Updated
write.csv(nvdTrainingUpdated, "NVD_Training_Updated.csv", row.names = FALSE)

#----------Testing----------#
#[34]
nvdTestingUpdated <- nvd2017UpdatedTotalDistinctRejectRemoved
write.csv(nvdTestingUpdated, "NVD_Testing_Updated.csv", row.names = FALSE)
