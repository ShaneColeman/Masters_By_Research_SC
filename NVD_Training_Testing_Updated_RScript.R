#NVD_Training_Testing_Updated_RScript.R

#[31]
#https://stackoverflow.com/questions/37257572/how-can-i-combine-two-dataframes-with-different-lengths-in-r
nvdMerge2014_2015Updated <- merge(nvd2014UpdatedTotalDistinctRejectRemoved, nvd2015UpdatedTotalDistinctRejectRemoved, all = TRUE)

#[32]
nvdMerge2014_2015_2016Updated <- merge(nvdMerge2014_2015Updated, nvd2016UpdatedTotalDistinctRejectRemoved, all = TRUE)

#[32]***
nvdMerge2014_2015_2016_2017Updated <- merge(nvdMerge2014_2015_2016Updated, nvd2017UpdatedTotalDistinctRejectRemoved, all = TRUE)
nvdMerge2014_2017TotalUpdated <- nvdMerge2014_2015_2016_2017Updated 

#----------Training----------#
#[33]
nvdTrainingUpdated <- nvdMerge2014_2015_2016Updated
write.csv(nvdTrainingUpdated, "NVD_Training_Updated.csv", row.names = FALSE)

#----------Testing----------#
#[34]
nvdTestingUpdated <- nvd2017UpdatedTotalDistinctRejectRemoved
write.csv(nvdTestingUpdated, "NVD_Testing_Updated.csv", row.names = FALSE)
