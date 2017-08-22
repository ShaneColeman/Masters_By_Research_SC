#NVD_Training_Testing_Updated_RScript.R

#----------Merge Data Frames (2014, 2015, 2016 and 2017)----------#
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


#----------2017 Selected Columns Ordered (NA Removed)----------#
nvd2017SelectedColumnsNARemoved <- nvd2017UpdatedTotalDistinctNARemoved[c(1, 9:14, 17:18, 19:20, 2, 7:8)]
str(nvd2017SelectedColumnsNARemoved)
View(nvd2017SelectedColumnsNARemoved)
summary(nvd2017SelectedColumnsNARemoved)
#----------#
nvd2017SelectedColumnsNARemovedOrdered <- nvd2017SelectedColumnsNARemoved[c(1, 2:4, 5:7, 8, 13)]
View(nvd2017SelectedColumnsNARemovedOrdered)

#----------2016 Selected Columns Ordered (NA Removed)----------#
nvd2016SelectedColumnsNARemoved <- nvd2016UpdatedTotalDistinctNARemoved[c(1, 9:14, 17:18, 19:20, 2, 7:8)]
str(nvd2016SelectedColumnsNARemoved)
View(nvd2016SelectedColumnsNARemoved)
summary(nvd2016SelectedColumnsNARemoved)
#----------#
nvd2016SelectedColumnsNARemovedOrdered <- nvd2016SelectedColumnsNARemoved[c(1, 2:4, 5:7, 8, 13)]
View(nvd2016SelectedColumnsNARemovedOrdered)

#----------2015 Selected Columns Ordered (NA Removed)----------#
nvd2015SelectedColumnsNARemoved <- nvd2015UpdatedTotalDistinctNARemoved[c(1, 9:14, 17:18, 19:20, 2, 7:8)]
str(nvd2015SelectedColumnsNARemoved)
View(nvd2015SelectedColumnsNARemoved)
summary(nvd2015SelectedColumnsNARemoved)
#----------#
nvd2015SelectedColumnsNARemovedOrdered <- nvd2015SelectedColumnsNARemoved[c(1, 2:4, 5:7, 8, 13)]
View(nvd2015SelectedColumnsNARemovedOrdered)

#----------2014 Selected Columns Ordered (NA Removed)----------#
nvd2014SelectedColumnsNARemoved <- nvd2014UpdatedTotalDistinctNARemoved[c(1, 9:14, 17:18, 19:20, 2, 7:8)]
str(nvd2014SelectedColumnsNARemoved)
View(nvd2014SelectedColumnsNARemoved)
summary(nvd2014SelectedColumnsNARemoved)
#----------#
nvd2014SelectedColumnsNARemovedOrdered <- nvd2014SelectedColumnsNARemoved[c(1, 2:4, 5:7, 8, 13)]
View(nvd2014SelectedColumnsNARemovedOrdered)
