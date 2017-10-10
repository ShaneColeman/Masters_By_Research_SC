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
references1_2017_DataFrame$External_Reference_1 <- as.character(references1_2017_DataFrame$External_Reference_1)
references1_2017_DataFrame$External_Reference_1[is.na(references1_2017_DataFrame$External_Reference_1)] <- "REMOVEABLE"
references1_2017_DataFrame$External_Reference_1 <- as.factor(references1_2017_DataFrame$External_Reference_1)
class(references1_2017_DataFrame)
str(references1_2017_DataFrame)
references1_2017_DataFrame <- as.data.frame(references1_2017_DataFrame)
testReferences2017DataFrame <- cbind(cveID2017UpdatedDataFrame, references1_2017_DataFrame)
View(testReferences2017DataFrame)
class(testReferences2017DataFrame)
str(testReferences2017DataFrame)

testReferences2017DataFrameAggregate <- aggregate(External_Reference_1 ~ CVE_ID, data = testReferences2017DataFrame, 
																				 paste, collapse = ",", na.action = na.pass)
View(testReferences2017DataFrameAggregate)
rm(testReferences2017DataFrameAggregate)

testCombine2017DataFrame <- merge(nvd2017UpdatedTotalDistinctLastRowRemoved, testReferences2017DataFrameAggregate,
																	by = "CVE_ID")
View(testCombine2017DataFrame)
rm(testCombine2017DataFrame)

#testReferences2017DataFrame <- as.character(testReferences2017DataFrame)
#testReferences2017DataFrame[is.na(testReferences2017DataFrame)] <- "BLANK"
#testReferences2017DataFrame <- as.data.frame(testReferences2017DataFrame)
#testReferences2017DataFrameSubset <- subset(testReferences2017DataFrame, nchar(as.character(testReferences2017DataFrame$External_Reference_1)) == 2)
#testReferences2017DataFrame <- as.character(testReferences2017DataFrame)
#testReferences2017DataFrame$External_Reference_1[testReferences2017DataFrame$External_Reference_1 == ""] <- "BLANK"
#testReferences2017DataFrame$External_Reference_1 <- as.character(testReferences2017DataFrame$External_Reference_1)
#testReferences2017DataFrame$External_Reference_1[testReferences2017DataFrame$External_Reference_1 == ""] <- "BLANK"
#levels(testReferences2017DataFrame$External_Reference_1)[levels(testReferences2017DataFrame$External_Reference_1) == ""] <- "BLANK"

testReferences2017DataFrameAggregate <- testReferences2017DataFrameAggregate[rep(1: nrow(testReferences2017DataFrameAggregate), each = 2),]
View(testReferences2017DataFrameAggregate)
rm(testReferences2017DataFrame)

#testReferences2017DataFrame1 <- testReferences2017DataFrame[grepl("http", testReferences2017DataFrame$External_Reference_1),]
#testReferences2017DataFrame2 <- testReferences2017DataFrame[grepl("REMOVEABLE", testReferences2017DataFrame$External_Reference_1),]
#rm(testReferences2017DataFrame1)
#rm(testReferences2017DataFrame2)

#testReferences2017DataFrameMerge <- merge(testReferences2017DataFrame1, testReferences2017DataFrame2)
#rm(testReferences2017DataFrameMerge)

#testReferences2017DataFrame1 <- distinct(testReferences2017DataFrame1)
#testReferences2017DataFrame2 <- distinct(testReferences2017DataFrame2)

testReferences2017DataFrame <- testReferences2017DataFrame[rowSums(is.na(testReferences2017DataFrame)) == 0,]
