#NVD_Training_Testing_Updated_RScript.R

#[31]
#https://stackoverflow.com/questions/37257572/how-can-i-combine-two-dataframes-with-different-lengths-in-r
nvdMerge2014_2015Updated <- merge(nvd2014UpdatedTotalDistinctRejectRemoved, nvd2015UpdatedTotalDistinctRejectRemoved, all = TRUE)
