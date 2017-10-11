#[1]
#NVD_2017_Updated_References_RScript.R

#[Memory]
#https://support.rstudio.com/hc/en-us/community/posts/115000475648-Memory-limit
memory.size()
memory.limit()
memory.size(15000)

#[2]
#install.packages("plyr")
#install.packages("dplyr")

library(plyr)
library(dplyr)

#-----FIRST-----#
references1_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs, data.frame)
colnames(references1_2017_DataFrame) <- "External_Reference_1"
View(references1_2017_DataFrame)
#references1_2017_DataFrame$External_Reference_1 <- as.character(references1_2017_DataFrame$External_Reference_1)
#references1_2017_DataFrame$External_Reference_1[is.na(references1_2017_DataFrame$External_Reference_1)] <- "REMOVEABLE"
#references1_2017_DataFrame$External_Reference_1 <- as.factor(references1_2017_DataFrame$External_Reference_1)
class(references1_2017_DataFrame)
str(references1_2017_DataFrame)
#references1_2017_DataFrame <- as.data.frame(references1_2017_DataFrame)
cveIDReferences1_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references1_2017_DataFrame)
View(cveIDReferences1_2017_DataFrame)
class(cveIDReferences1_2017_DataFrame)
str(cveIDReferences1_2017_DataFrame)
rm(cveIDReferences1_2017_DataFrame)

cveIDReferences1_2017_AggregateDataFrame <- aggregate(External_Reference_1 ~ CVE_ID, data = cveIDReferences1_2017_DataFrame, 
																				 paste, collapse = ",", na.action = na.pass)
cveIDReferences1_2017_AggregateDataFrame$External_Reference_1 <- as.factor(cveIDReferences1_2017_AggregateDataFrame$External_Reference_1)
View(cveIDReferences1_2017_AggregateDataFrame)
str(cveIDReferences1_2017_AggregateDataFrame)
rm(cveIDReferences1_2017_AggregateDataFrame)
#-----FIRST-----#

#-----SECOND-----#
references2_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.1, data.frame)
colnames(references2_2017_DataFrame) <- "External_Reference_2"
View(references2_2017_DataFrame)
class(references2_2017_DataFrame)
str(references2_2017_DataFrame)

cveIDReferences2_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references2_2017_DataFrame)
View(cveIDReferences2_2017_DataFrame)
class(cveIDReferences2_2017_DataFrame)
str(cveIDReferences2_2017_DataFrame)
rm(cveIDReferences2_2017_DataFrame)

cveIDReferences2_2017_AggregateDataFrame <- aggregate(External_Reference_2 ~ CVE_ID, data = cveIDReferences2_2017_DataFrame, 
																											paste, collapse = ",", na.action = na.pass)
cveIDReferences2_2017_AggregateDataFrame$External_Reference_2 <- as.factor(cveIDReferences2_2017_AggregateDataFrame$External_Reference_2)
View(cveIDReferences2_2017_AggregateDataFrame)
str(cveIDReferences2_2017_AggregateDataFrame)

levels(cveIDReferences2_2017_AggregateDataFrame$External_Reference_2)[levels(cveIDReferences2_2017_AggregateDataFrame$External_Reference_2) == "NA,NA"] <- "NA"
View(cveIDReferences2_2017_AggregateDataFrame)
str(cveIDReferences2_2017_AggregateDataFrame)
rm(cveIDReferences2_2017_AggregateDataFrame)
#-----SECOND-----#

#-----THIRD-----#
references3_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.2, data.frame)
colnames(references3_2017_DataFrame) <- "External_Reference_3"
View(references3_2017_DataFrame)
class(references3_2017_DataFrame)
str(references3_2017_DataFrame)

cveIDReferences3_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references3_2017_DataFrame)
View(cveIDReferences3_2017_DataFrame)
class(cveIDReferences3_2017_DataFrame)
str(cveIDReferences3_2017_DataFrame)
rm(cveIDReferences3_2017_DataFrame)

cveIDReferences3_2017_AggregateDataFrame <- aggregate(External_Reference_3 ~ CVE_ID, data = cveIDReferences3_2017_DataFrame, 
																											paste, collapse = ",", na.action = na.pass)
cveIDReferences3_2017_AggregateDataFrame$External_Reference_3 <- as.factor(cveIDReferences3_2017_AggregateDataFrame$External_Reference_3)
View(cveIDReferences3_2017_AggregateDataFrame)
str(cveIDReferences3_2017_AggregateDataFrame)

levels(cveIDReferences3_2017_AggregateDataFrame$External_Reference_3)[levels(cveIDReferences3_2017_AggregateDataFrame$External_Reference_3) == "NA,NA"] <- "NA"
View(cveIDReferences3_2017_AggregateDataFrame)
str(cveIDReferences3_2017_AggregateDataFrame)
rm(cveIDReferences3_2017_AggregateDataFrame)
#-----THIRD-----#

#-----FOURTH-----#
references4_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.3, data.frame)
colnames(references4_2017_DataFrame) <- "External_Reference_4"
View(references4_2017_DataFrame)
class(references4_2017_DataFrame)
str(references4_2017_DataFrame)

cveIDReferences4_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references4_2017_DataFrame)
View(cveIDReferences4_2017_DataFrame)
class(cveIDReferences4_2017_DataFrame)
str(cveIDReferences4_2017_DataFrame)
rm(cveIDReferences4_2017_DataFrame)

cveIDReferences4_2017_AggregateDataFrame <- aggregate(External_Reference_4 ~ CVE_ID, data = cveIDReferences4_2017_DataFrame, 
																											paste, collapse = ",", na.action = na.pass)
cveIDReferences4_2017_AggregateDataFrame$External_Reference_4 <- as.factor(cveIDReferences4_2017_AggregateDataFrame$External_Reference_4)
View(cveIDReferences4_2017_AggregateDataFrame)
str(cveIDReferences4_2017_AggregateDataFrame)

levels(cveIDReferences4_2017_AggregateDataFrame$External_Reference_4)[levels(cveIDReferences4_2017_AggregateDataFrame$External_Reference_4) == "NA,NA"] <- "NA"
View(cveIDReferences4_2017_AggregateDataFrame)
str(cveIDReferences4_2017_AggregateDataFrame)
rm(cveIDReferences4_2017_AggregateDataFrame)
#-----FOURTH-----#

#-----FIFTH-----#
references5_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.4, data.frame)
colnames(references5_2017_DataFrame) <- "External_Reference_5"
View(references5_2017_DataFrame)
class(references5_2017_DataFrame)
str(references5_2017_DataFrame)

cveIDReferences5_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references5_2017_DataFrame)
View(cveIDReferences5_2017_DataFrame)
class(cveIDReferences5_2017_DataFrame)
str(cveIDReferences5_2017_DataFrame)
rm(cveIDReferences5_2017_DataFrame)

cveIDReferences5_2017_AggregateDataFrame <- aggregate(External_Reference_5 ~ CVE_ID, data = cveIDReferences5_2017_DataFrame, 
																											paste, collapse = ",", na.action = na.pass)
cveIDReferences5_2017_AggregateDataFrame$External_Reference_5 <- as.factor(cveIDReferences5_2017_AggregateDataFrame$External_Reference_5)
View(cveIDReferences5_2017_AggregateDataFrame)
str(cveIDReferences5_2017_AggregateDataFrame)

levels(cveIDReferences5_2017_AggregateDataFrame$External_Reference_5)[levels(cveIDReferences5_2017_AggregateDataFrame$External_Reference_5) == "NA,NA"] <- "NA"
View(cveIDReferences5_2017_AggregateDataFrame)
str(cveIDReferences5_2017_AggregateDataFrame)
rm(cveIDReferences5_2017_AggregateDataFrame)
#-----FIFTH-----#

#-----SIXTH-----#
references6_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.5, data.frame)
colnames(references6_2017_DataFrame) <- "External_Reference_6"
View(references6_2017_DataFrame)
class(references6_2017_DataFrame)
str(references6_2017_DataFrame)

cveIDReferences6_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references6_2017_DataFrame)
View(cveIDReferences6_2017_DataFrame)
class(cveIDReferences6_2017_DataFrame)
str(cveIDReferences6_2017_DataFrame)
rm(cveIDReferences6_2017_DataFrame)

cveIDReferences6_2017_AggregateDataFrame <- aggregate(External_Reference_6 ~ CVE_ID, data = cveIDReferences6_2017_DataFrame, 
																											paste, collapse = ",", na.action = na.pass)
cveIDReferences6_2017_AggregateDataFrame$External_Reference_6 <- as.factor(cveIDReferences6_2017_AggregateDataFrame$External_Reference_6)
View(cveIDReferences6_2017_AggregateDataFrame)
str(cveIDReferences6_2017_AggregateDataFrame)

levels(cveIDReferences6_2017_AggregateDataFrame$External_Reference_6)[levels(cveIDReferences6_2017_AggregateDataFrame$External_Reference_6) == "NA,NA"] <- "NA"
View(cveIDReferences6_2017_AggregateDataFrame)
str(cveIDReferences6_2017_AggregateDataFrame)
rm(cveIDReferences6_2017_AggregateDataFrame)
#-----SIXTH-----#

#-----SEVENTH-----#
references7_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.6, data.frame)
colnames(references7_2017_DataFrame) <- "External_Reference_7"
View(references7_2017_DataFrame)
class(references7_2017_DataFrame)
str(references7_2017_DataFrame)

cveIDReferences7_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references7_2017_DataFrame)
View(cveIDReferences7_2017_DataFrame)
class(cveIDReferences7_2017_DataFrame)
str(cveIDReferences7_2017_DataFrame)
rm(cveIDReferences7_2017_DataFrame)

cveIDReferences7_2017_AggregateDataFrame <- aggregate(External_Reference_7 ~ CVE_ID, data = cveIDReferences7_2017_DataFrame, 
																											paste, collapse = ",", na.action = na.pass)
cveIDReferences7_2017_AggregateDataFrame$External_Reference_7 <- as.factor(cveIDReferences7_2017_AggregateDataFrame$External_Reference_7)
View(cveIDReferences7_2017_AggregateDataFrame)
str(cveIDReferences7_2017_AggregateDataFrame)

levels(cveIDReferences7_2017_AggregateDataFrame$External_Reference_7)[levels(cveIDReferences7_2017_AggregateDataFrame$External_Reference_7) == "NA,NA"] <- "NA"
View(cveIDReferences7_2017_AggregateDataFrame)
str(cveIDReferences7_2017_AggregateDataFrame)
rm(cveIDReferences7_2017_AggregateDataFrame)
#-----SEVENTH-----#

#-----EIGHT-----#
references8_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.7, data.frame)
colnames(references8_2017_DataFrame) <- "External_Reference_8"
View(references8_2017_DataFrame)
class(references8_2017_DataFrame)
str(references8_2017_DataFrame)

cveIDReferences8_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references8_2017_DataFrame)
View(cveIDReferences8_2017_DataFrame)
class(cveIDReferences8_2017_DataFrame)
str(cveIDReferences8_2017_DataFrame)
rm(cveIDReferences8_2017_DataFrame)

cveIDReferences8_2017_AggregateDataFrame <- aggregate(External_Reference_8 ~ CVE_ID, data = cveIDReferences8_2017_DataFrame, 
																											paste, collapse = ",", na.action = na.pass)
cveIDReferences8_2017_AggregateDataFrame$External_Reference_8 <- as.factor(cveIDReferences8_2017_AggregateDataFrame$External_Reference_8)
View(cveIDReferences8_2017_AggregateDataFrame)
str(cveIDReferences8_2017_AggregateDataFrame)

levels(cveIDReferences8_2017_AggregateDataFrame$External_Reference_8)[levels(cveIDReferences8_2017_AggregateDataFrame$External_Reference_8) == "NA,NA"] <- "NA"
View(cveIDReferences8_2017_AggregateDataFrame)
str(cveIDReferences8_2017_AggregateDataFrame)
rm(cveIDReferences8_2017_AggregateDataFrame)
#-----EIGHT-----#

#-----NINTH-----#
references9_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.8, data.frame)
colnames(references9_2017_DataFrame) <- "External_Reference_9"
View(references9_2017_DataFrame)
class(references9_2017_DataFrame)
str(references9_2017_DataFrame)

cveIDReferences9_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references9_2017_DataFrame)
View(cveIDReferences9_2017_DataFrame)
class(cveIDReferences9_2017_DataFrame)
str(cveIDReferences9_2017_DataFrame)
rm(cveIDReferences9_2017_DataFrame)

cveIDReferences9_2017_AggregateDataFrame <- aggregate(External_Reference_9 ~ CVE_ID, data = cveIDReferences9_2017_DataFrame, 
																											paste, collapse = ",", na.action = na.pass)
cveIDReferences9_2017_AggregateDataFrame$External_Reference_9 <- as.factor(cveIDReferences9_2017_AggregateDataFrame$External_Reference_9)
View(cveIDReferences9_2017_AggregateDataFrame)
str(cveIDReferences9_2017_AggregateDataFrame)

levels(cveIDReferences9_2017_AggregateDataFrame$External_Reference_9)[levels(cveIDReferences9_2017_AggregateDataFrame$External_Reference_9) == "NA,NA"] <- "NA"
View(cveIDReferences9_2017_AggregateDataFrame)
str(cveIDReferences9_2017_AggregateDataFrame)
rm(cveIDReferences9_2017_AggregateDataFrame)
#-----NINTH-----#

#-----TENTH-----#
references10_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.9, data.frame)
colnames(references10_2017_DataFrame) <- "External_Reference_10"
View(references10_2017_DataFrame)
class(references10_2017_DataFrame)
str(references10_2017_DataFrame)

cveIDReferences10_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references10_2017_DataFrame)
View(cveIDReferences10_2017_DataFrame)
class(cveIDReferences10_2017_DataFrame)
str(cveIDReferences10_2017_DataFrame)
rm(cveIDReferences10_2017_DataFrame)

cveIDReferences10_2017_AggregateDataFrame <- aggregate(External_Reference_10 ~ CVE_ID, data = cveIDReferences10_2017_DataFrame, 
																											paste, collapse = ",", na.action = na.pass)
cveIDReferences10_2017_AggregateDataFrame$External_Reference_10 <- as.factor(cveIDReferences10_2017_AggregateDataFrame$External_Reference_10)
View(cveIDReferences10_2017_AggregateDataFrame)
str(cveIDReferences10_2017_AggregateDataFrame)

levels(cveIDReferences10_2017_AggregateDataFrame$External_Reference_10)[levels(cveIDReferences10_2017_AggregateDataFrame$External_Reference_10) == "NA,NA"] <- "NA"
View(cveIDReferences10_2017_AggregateDataFrame)
str(cveIDReferences10_2017_AggregateDataFrame)
rm(cveIDReferences10_2017_AggregateDataFrame)
#-----TENTH-----#

#-----ELEVENTH-----#
references11_2017_DataFrame <- ldply(dataNVD2017Updated$references.reference..attrs.10, data.frame)
colnames(references11_2017_DataFrame) <- "External_Reference_11"
View(references11_2017_DataFrame)
class(references11_2017_DataFrame)
str(references11_2017_DataFrame)

cveIDReferences11_2017_DataFrame <- cbind(cveID2017UpdatedDataFrame, references11_2017_DataFrame)
View(cveIDReferences11_2017_DataFrame)
class(cveIDReferences11_2017_DataFrame)
str(cveIDReferences11_2017_DataFrame)
rm(cveIDReferences11_2017_DataFrame)

cveIDReferences11_2017_AggregateDataFrame <- aggregate(External_Reference_11 ~ CVE_ID, data = cveIDReferences11_2017_DataFrame, 
																											 paste, collapse = ",", na.action = na.pass)
cveIDReferences11_2017_AggregateDataFrame$External_Reference_11 <- as.factor(cveIDReferences11_2017_AggregateDataFrame$External_Reference_11)
View(cveIDReferences11_2017_AggregateDataFrame)
str(cveIDReferences11_2017_AggregateDataFrame)

levels(cveIDReferences11_2017_AggregateDataFrame$External_Reference_11)[levels(cveIDReferences11_2017_AggregateDataFrame$External_Reference_11) == "NA,NA"] <- "NA"
View(cveIDReferences11_2017_AggregateDataFrame)
str(cveIDReferences11_2017_AggregateDataFrame)
rm(cveIDReferences11_2017_AggregateDataFrame)
#-----ELEVENTH-----#


#----------#
cveID2017LastRowRemoved <- as.data.frame(cveIDReferences1_2017_AggregateDataFrame$CVE_ID)
reference1_2017LastRowRemoved <- as.data.frame(cveIDReferences1_2017_AggregateDataFrame$External_Reference_1)
reference2_2017LastRowRemoved <- as.data.frame(cveIDReferences2_2017_AggregateDataFrame$External_Reference_2)
reference3_2017LastRowRemoved <- as.data.frame(cveIDReferences3_2017_AggregateDataFrame$External_Reference_3)
reference4_2017LastRowRemoved <- as.data.frame(cveIDReferences4_2017_AggregateDataFrame$External_Reference_4)
reference5_2017LastRowRemoved <- as.data.frame(cveIDReferences5_2017_AggregateDataFrame$External_Reference_5)
reference6_2017LastRowRemoved <- as.data.frame(cveIDReferences6_2017_AggregateDataFrame$External_Reference_6)
reference7_2017LastRowRemoved <- as.data.frame(cveIDReferences7_2017_AggregateDataFrame$External_Reference_7)
reference8_2017LastRowRemoved <- as.data.frame(cveIDReferences8_2017_AggregateDataFrame$External_Reference_8)
reference9_2017LastRowRemoved <- as.data.frame(cveIDReferences9_2017_AggregateDataFrame$External_Reference_9)
reference10_2017LastRowRemoved <- as.data.frame(cveIDReferences10_2017_AggregateDataFrame$External_Reference_10)
reference11_2017LastRowRemoved <- as.data.frame(cveIDReferences11_2017_AggregateDataFrame$External_Reference_11)

testCombine2017DataFrame <- cbind(cveID2017LastRowRemoved, reference1_2017LastRowRemoved,
																	reference2_2017LastRowRemoved, reference3_2017LastRowRemoved,
																	reference4_2017LastRowRemoved, reference5_2017LastRowRemoved,
																	reference6_2017LastRowRemoved, reference7_2017LastRowRemoved,
																	reference8_2017LastRowRemoved, reference9_2017LastRowRemoved,
																	reference10_2017LastRowRemoved, reference11_2017LastRowRemoved)
colnames(testCombine2017DataFrame) <- c("CVE_ID", "External_Reference_1", "External_Reference_2", 
																				"External_Reference_3", "External_Reference_4", "External_Reference_5",
																				"External_Reference_6", "External_Reference_7", "External_Reference_8",
																				"External_Reference_9", "External_Reference_10", "External_Reference_11")
View(testCombine2017DataFrame)
write.csv(testCombine2017DataFrame, "External_References_2017_Updated.csv", row.names = FALSE)

#1
testMerge2017DataFrame1 <- merge(nvd2017UpdatedTotalDistinctLastRowRemoved, testCombine2017DataFrame,
																	by = "CVE_ID")
View(testMerge2017DataFrame1)
rm(testMerge2017DataFrame1)

#2
testMerge2017DataFrame2 <- merge(testMerge2017DataFrame1, testVSPLDataFrame,
																 by = "CVE_ID")
View(testMerge2017DataFrame2)
rm(testMerge2017DataFrame2)
#----------#


testReferences2017DataFrameAggregate <- testReferences2017DataFrameAggregate[rep(1: nrow(testReferences2017DataFrameAggregate), each = 2),]
View(testReferences2017DataFrameAggregate)
rm(testReferences2017DataFrame)

testReferences2017DataFrame <- testReferences2017DataFrame[rowSums(is.na(testReferences2017DataFrame)) == 0,]
