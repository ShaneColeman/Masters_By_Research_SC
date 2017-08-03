#[1]
#Recommender_System_RScript.R

#[Memory]
#https://support.rstudio.com/hc/en-us/community/posts/115000475648-Memory-limit
memory.limit()
memory.size(15000)

#[2]
#R package for recommendation - recommenderlab
if(!"recommenderlab" %in% rownames(install.packages()))
{
	install.packages("recommenderlab")
}
library(recommenderlab)
help(package = "recommenderlab")
set.seed(1)

#[3]
object.size(nvdMerge2014_2017TotalUpdated)
object.size(as(nvdMerge2014_2017TotalUpdated, "realRatingMatrix"))
object.size(as(nvdMerge2014_2017TotalUpdated, "realRatingMatrix")) / object.size(nvdMerge2014_2017TotalUpdated)

#[Test Code]
#nvd2014_2017SelectedColumns <- nvdMerge2014_2015_2016_2017Updated[c(1, 9:14, 17:18, 19:20, 2, 7:8)]
#str(nvd2014_2017SelectedColumns$CWE_ID_1)
#----------#
nvd2014_2017SelectedColumnsUpdated <- nvdMerge2014_2015_2016_2017NAUpdated[c(1, 9:14, 17:18, 19:20, 2, 7:8)]
str(nvd2014_2017SelectedColumnsUpdated)

summary(nvd2014_2017SelectedColumnsUpdated)

#[3]
object.size(nvd2014_2017SelectedColumnsUpdated)
object.size(as(nvd2014_2017SelectedColumnsUpdated, "matrix"))
object.size(as(nvd2014_2017SelectedColumnsUpdated, "matrix")) / object.size(nvd2014_2017SelectedColumnsUpdated)
#----------#
#nvd2014_2017CVEID_CVSSScore <- nvd2014_2017SelectedColumns[c(1, 13)]
#nvd2014_2017CVEID_CVSSScore
#----------#

#---------------------------------------------#
###TEST CODE - REMOVE IF IT DOES NOT WORK!!!###
View(nvd2014_2017SelectedColumnsUpdated)

nvd2014_2017Columns_1_2 <- nvd2014_2017SelectedColumnsUpdated[c(1, 2)]
View(nvd2014_2017Columns_1_2)

nvd2014_2017Columns_1_3 <- nvd2014_2017SelectedColumnsUpdated[c(1, 3)]
View(nvd2014_2017Columns_1_3)

nvd2014_2017Columns_1_4 <- nvd2014_2017SelectedColumnsUpdated[c(1, 4)]
View(nvd2014_2017Columns_1_4)

nvd2014_2017Columns_1_5 <- nvd2014_2017SelectedColumnsUpdated[c(1, 5)]
View(nvd2014_2017Columns_1_5)

nvd2014_2017Columns_1_6 <- nvd2014_2017SelectedColumnsUpdated[c(1, 6)]
View(nvd2014_2017Columns_1_6)

nvd2014_2017Columns_1_7 <- nvd2014_2017SelectedColumnsUpdated[c(1, 7)]
View(nvd2014_2017Columns_1_7)

nvd2014_2017Columns_1_8 <- nvd2014_2017SelectedColumnsUpdated[c(1, 8)]
View(nvd2014_2017Columns_1_8)

nvd2014_2017Columns_1_13 <- nvd2014_2017SelectedColumnsUpdated[c(1, 13)]
View(nvd2014_2017Columns_1_13)
#---------------------------------------------#
#---------------------------------------------#

nvd2014_2017CVEID_CVSSScoreUpdated <- nvd2014_2017SelectedColumnsUpdated[c(1, 13)]
nvd2014_2017CVEID_CVSSScoreUpdated
#str(nvd2014_2017CVEID_CVSSScore$CVSS_Score)
#nvd2014_2017CVEID_CVSSScore$CVSS_Score
#as.data.frame(nvd2014_2017CVEID_CVSSScore$CVSS_Score)
#nvd2014_2017CVEID_CVSSScore$CVSS_Score <- as.character(nvd2014_2017CVEID_CVSSScore$CVSS_Score)
#nvd2014_2017CVEID_CVSSScore$CVSS_Score
#nvd2014_2017CVEID_CVSSScore$CVSS_Score[!is.na(nvd2014_2017CVEID_CVSSScore$CVSS_Score)] <- "1"
#str(nvd2014_2017CVEID_CVSSScore$CVSS_Score)
#nvd2014_2017CVEID_CVSSScore$CVSS_Score <- as.factor(nvd2014_2017CVEID_CVSSScore$CVSS_Score)
#str(nvd2014_2017CVEID_CVSSScore)

#nvd2014_2017CVEID_CVSSScore_Wide <- reshape(data = nvd2014_2017CVEID_CVSSScore, 
#																		direction = "wide",
#																		idvar = "CVE_ID",
#																		timevar = "CVSS_Score",
#																		v.names = "CVSS_Score")
#head(nvd2014_2017CVEID_CVSSScore_Wide[,1:7])
#View(nvd2014_2017CVEID_CVSSScore_Wide)
#rownames(nvd2014_2017CVEID_CVSSScore_Wide) <- nvd2014_2017CVEID_CVSSScore_Wide$CVE_ID
#----------#

#---------------------------------------------#
###TEST CODE - REMOVE IF IT DOES NOT WORK!!!###
#[Columns: 1 and 2]
nvd2014_2017Columns_1_2_Wide <- reshape(data = nvd2014_2017Columns_1_2, direction = "wide", idvar = "CVE_ID",
															 timevar = "CVSS_Access_Vector", v.names = "CVSS_Access_Vector")
head(nvd2014_2017Columns_1_2_Wide)
View(nvd2014_2017Columns_1_2_Wide)
lengthColumns_1_2 <- length(nvd2014_2017Columns_1_2_Wide)
lengthColumns_1_2
#-----CVSS_Access_Vector.NETWORK-----#
str(nvd2014_2017Columns_1_2_Wide)
nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.NETWORK <- as.character(nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.NETWORK)
nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.NETWORK[!is.na(nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.NETWORK)] <- "1"
nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.NETWORK <- as.factor(nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.NETWORK)
str(nvd2014_2017Columns_1_2_Wide)
View(nvd2014_2017Columns_1_2_Wide)
#-----CVSS_Access_Vector.LOCAL-----#
str(nvd2014_2017Columns_1_2_Wide)
nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.LOCAL <- as.character(nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.LOCAL)
nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.LOCAL[!is.na(nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.LOCAL)] <- "1"
nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.LOCAL <- as.factor(nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.LOCAL)
str(nvd2014_2017Columns_1_2_Wide)
View(nvd2014_2017Columns_1_2_Wide)
#-----CVSS_Access_Vector.ADJACENT_NETWORK-----#
str(nvd2014_2017Columns_1_2_Wide)
nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.ADJACENT_NETWORK <- as.character(nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.ADJACENT_NETWORK)
nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.ADJACENT_NETWORK[!is.na(nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.ADJACENT_NETWORK)] <- "1"
nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.ADJACENT_NETWORK <- as.factor(nvd2014_2017Columns_1_2_Wide$CVSS_Access_Vector.ADJACENT_NETWORK)
str(nvd2014_2017Columns_1_2_Wide)
View(nvd2014_2017Columns_1_2_Wide)

#[Columns: 1 and 3]
nvd2014_2017Columns_1_3_Wide <- reshape(data = nvd2014_2017Columns_1_3, direction = "wide", idvar = "CVE_ID",
															 timevar = "CVSS_Access_Complexity", v.names = "CVSS_Access_Complexity")
head(nvd2014_2017Columns_1_3_Wide)
View(nvd2014_2017Columns_1_3_Wide)
lengthColumns_1_3 <- length(nvd2014_2017Columns_1_3_Wide)
lengthColumns_1_3
#-----CVSS_Access_Complexity.LOW-----#
str(nvd2014_2017Columns_1_3_Wide)
nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.LOW <- as.character(nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.LOW)
nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.LOW[!is.na(nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.LOW)] <- "1"
nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.LOW <- as.factor(nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.LOW)
str(nvd2014_2017Columns_1_3_Wide)
View(nvd2014_2017Columns_1_3_Wide)
#-----CVSS_Access_Complexity.MEDIUM-----#
str(nvd2014_2017Columns_1_3_Wide)
nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.MEDIUM <- as.character(nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.MEDIUM)
nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.MEDIUM[!is.na(nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.MEDIUM)] <- "1"
nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.MEDIUM <- as.factor(nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.MEDIUM)
str(nvd2014_2017Columns_1_3_Wide)
View(nvd2014_2017Columns_1_3_Wide)
#-----CVSS_Access_Complexity.HIGH-----#
str(nvd2014_2017Columns_1_3_Wide)
nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.HIGH <- as.character(nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.HIGH)
nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.HIGH[!is.na(nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.HIGH)] <- "1"
nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.HIGH <- as.factor(nvd2014_2017Columns_1_3_Wide$CVSS_Access_Complexity.HIGH)
str(nvd2014_2017Columns_1_3_Wide)
View(nvd2014_2017Columns_1_3_Wide)

#[Columns: 1 and 4]
nvd2014_2017Columns_1_4_Wide <- reshape(data = nvd2014_2017Columns_1_4, direction = "wide", idvar = "CVE_ID",
																timevar = "CVSS_Authentication", v.names = "CVSS_Authentication")
head(nvd2014_2017Columns_1_4_Wide)
View(nvd2014_2017Columns_1_4_Wide)
lengthColumns_1_4 <- length(nvd2014_2017Columns_1_4_Wide)
lengthColumns_1_4
#-----CVSS_Authentication.NONE-----#
str(nvd2014_2017Columns_1_4_Wide)
nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.NONE <- as.character(nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.NONE)
nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.NONE[!is.na(nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.NONE)] <- "1"
nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.NONE <- as.factor(nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.NONE)
str(nvd2014_2017Columns_1_4_Wide)
View(nvd2014_2017Columns_1_4_Wide)
#-----CVSS_Authentication.SINGLE_INSTANCE-----#
str(nvd2014_2017Columns_1_4_Wide)
nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.SINGLE_INSTANCE <- as.character(nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.SINGLE_INSTANCE)
nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.SINGLE_INSTANCE[!is.na(nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.SINGLE_INSTANCE)] <- "1"
nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.SINGLE_INSTANCE <- as.factor(nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.SINGLE_INSTANCE)
str(nvd2014_2017Columns_1_4_Wide)
View(nvd2014_2017Columns_1_4_Wide)
#-----CVSS_Authentication.MULTIPLE_INSTANCES-----#
str(nvd2014_2017Columns_1_4_Wide)
nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.MULTIPLE_INSTANCES <- as.character(nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.MULTIPLE_INSTANCES)
nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.MULTIPLE_INSTANCES[!is.na(nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.MULTIPLE_INSTANCES)] <- "1"
nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.MULTIPLE_INSTANCES <- as.factor(nvd2014_2017Columns_1_4_Wide$CVSS_Authentication.MULTIPLE_INSTANCES)
str(nvd2014_2017Columns_1_4_Wide)
View(nvd2014_2017Columns_1_4_Wide)

#[Columns: 1 and 5]
nvd2014_2017Columns_1_5_Wide <- reshape(data = nvd2014_2017Columns_1_5, direction = "wide", idvar = "CVE_ID",
																				timevar = "CVSS_Confidentiality_Impact", v.names = "CVSS_Confidentiality_Impact")
head(nvd2014_2017Columns_1_5_Wide)
View(nvd2014_2017Columns_1_5_Wide)
lengthColumns_1_5 <- length(nvd2014_2017Columns_1_5_Wide)
lengthColumns_1_5
#-----CVSS_Confidentiality_Impact.PARTIAL-----#
str(nvd2014_2017Columns_1_5_Wide)
nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.PARTIAL <- as.character(nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.PARTIAL)
nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.PARTIAL[!is.na(nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.PARTIAL)] <- "1"
nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.PARTIAL <- as.factor(nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.PARTIAL)
str(nvd2014_2017Columns_1_5_Wide)
View(nvd2014_2017Columns_1_5_Wide)
#-----CVSS_Confidentiality_Impact.COMPLETE-----#
str(nvd2014_2017Columns_1_5_Wide)
nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.COMPLETE <- as.character(nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.COMPLETE)
nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.COMPLETE[!is.na(nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.COMPLETE)] <- "1"
nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.COMPLETE <- as.factor(nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.COMPLETE)
str(nvd2014_2017Columns_1_5_Wide)
View(nvd2014_2017Columns_1_5_Wide)
#-----CVSS_Confidentiality_Impact.NONE-----#
str(nvd2014_2017Columns_1_5_Wide)
nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.NONE <- as.character(nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.NONE)
nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.NONE[!is.na(nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.NONE)] <- "1"
nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.NONE <- as.factor(nvd2014_2017Columns_1_5_Wide$CVSS_Confidentiality_Impact.NONE)
str(nvd2014_2017Columns_1_5_Wide)
View(nvd2014_2017Columns_1_5_Wide)

#[Columns: 1 and 6]
nvd2014_2017Columns_1_6_Wide <- reshape(data = nvd2014_2017Columns_1_6, direction = "wide", idvar = "CVE_ID",
																				timevar = "CVSS_Integrity_Impact", v.names = "CVSS_Integrity_Impact")
head(nvd2014_2017Columns_1_6_Wide)
View(nvd2014_2017Columns_1_6_Wide)
lengthColumns_1_6 <- length(nvd2014_2017Columns_1_6_Wide)
lengthColumns_1_6
#-----CVSS_Integrity_Impact.PARTIAL-----#
str(nvd2014_2017Columns_1_6_Wide)
nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.PARTIAL <- as.character(nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.PARTIAL)
nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.PARTIAL[!is.na(nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.PARTIAL)] <- "1"
nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.PARTIAL <- as.factor(nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.PARTIAL)
str(nvd2014_2017Columns_1_6_Wide)
View(nvd2014_2017Columns_1_6_Wide)
#-----CVSS_Integrity_Impact.COMPLETE-----#
str(nvd2014_2017Columns_1_6_Wide)
nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.COMPLETE <- as.character(nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.COMPLETE)
nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.COMPLETE[!is.na(nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.COMPLETE)] <- "1"
nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.COMPLETE <- as.factor(nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.COMPLETE)
str(nvd2014_2017Columns_1_6_Wide)
View(nvd2014_2017Columns_1_6_Wide)
#-----CVSS_Integrity_Impact.NONE-----#
str(nvd2014_2017Columns_1_6_Wide)
nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.NONE <- as.character(nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.NONE)
nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.NONE[!is.na(nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.NONE)] <- "1"
nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.NONE <- as.factor(nvd2014_2017Columns_1_6_Wide$CVSS_Integrity_Impact.NONE)
str(nvd2014_2017Columns_1_6_Wide)
View(nvd2014_2017Columns_1_6_Wide)

#[Columns: 1 and 7]
nvd2014_2017Columns_1_7_Wide <- reshape(data = nvd2014_2017Columns_1_7, direction = "wide", idvar = "CVE_ID",
																				timevar = "CVSS_Availability_Impact", v.names = "CVSS_Availability_Impact")
head(nvd2014_2017Columns_1_7_Wide)
View(nvd2014_2017Columns_1_7_Wide)
lengthColumns_1_7 <- length(nvd2014_2017Columns_1_7_Wide)
lengthColumns_1_7
#-----CVSS_Availability_Impact.PARTIAL-----#
str(nvd2014_2017Columns_1_7_Wide)
nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.PARTIAL <- as.character(nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.PARTIAL)
nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.PARTIAL[!is.na(nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.PARTIAL)] <- "1"
nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.PARTIAL <- as.factor(nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.PARTIAL)
str(nvd2014_2017Columns_1_7_Wide)
View(nvd2014_2017Columns_1_7_Wide)
#-----CVSS_Availability_Impact.COMPLETE-----#
str(nvd2014_2017Columns_1_7_Wide)
nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.COMPLETE <- as.character(nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.COMPLETE)
nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.COMPLETE[!is.na(nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.COMPLETE)] <- "1"
nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.COMPLETE <- as.factor(nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.COMPLETE)
str(nvd2014_2017Columns_1_7_Wide)
View(nvd2014_2017Columns_1_7_Wide)
#-----CVSS_Availability_Impact.NONE-----#
str(nvd2014_2017Columns_1_7_Wide)
nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.NONE <- as.character(nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.NONE)
nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.NONE[!is.na(nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.NONE)] <- "1"
nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.NONE <- as.factor(nvd2014_2017Columns_1_7_Wide$CVSS_Availability_Impact.NONE)
str(nvd2014_2017Columns_1_7_Wide)
View(nvd2014_2017Columns_1_7_Wide)

#[Columns: 1 and 8]
nvd2014_2017Columns_1_8_Wide <- reshape(data = nvd2014_2017Columns_1_8, direction = "wide", idvar = "CVE_ID",
																				timevar = "CWE_ID_1", v.names = "CWE_ID_1")
head(nvd2014_2017Columns_1_8_Wide[,1:6])
View(nvd2014_2017Columns_1_8_Wide)
length(nvd2014_2017Columns_1_8_Wide)
lengthColumns_1_8 <- length(nvd2014_2017Columns_1_8_Wide)
lengthColumns_1_8

#[Columns: 1 and 13]
nvd2014_2017Columns_1_13_Wide <- reshape(data = nvd2014_2017Columns_1_13, direction = "wide", idvar = "CVE_ID",
																				timevar = "CVSS_Score", v.names = "CVSS_Score")
head(nvd2014_2017Columns_1_13_Wide[,1:6])
View(nvd2014_2017Columns_1_13_Wide)
lengthColumns_1_13 <- length(nvd2014_2017Columns_1_13_Wide)
lengthColumns_1_13

#[Length of Columns (Total)]
lengthColumnsTotal <- lengthColumns_1_2 + lengthColumns_1_3 + lengthColumns_1_4 + 
											lengthColumns_1_5 + lengthColumns_1_6 + lengthColumns_1_7 +
											lengthColumns_1_8 + lengthColumns_1_13
lengthColumnsTotal
lengthColumnsTotalUpdated <- lengthColumnsTotal - 7
lengthColumnsTotalUpdated


#https://stackoverflow.com/questions/16666643/merging-more-than-2-dataframes-in-r-by-rownames
library(plyr)
nvd2014_2017ColumnsTotal <- join_all(list(nvd2014_2017Columns_1_2_Wide, nvd2014_2017Columns_1_3_Wide,
																 nvd2014_2017Columns_1_4_Wide, nvd2014_2017Columns_1_5_Wide,
																 nvd2014_2017Columns_1_6_Wide, nvd2014_2017Columns_1_7_Wide,
																 nvd2014_2017Columns_1_8_Wide, nvd2014_2017Columns_1_13_Wide), 
																 by = "CVE_ID", type = "full")
str(nvd2014_2017ColumnsTotal)
View(nvd2014_2017ColumnsTotal)
#---------------------------------------------#
#---------------------------------------------#
###
#
#
#
#
#
#
#
#
#
#
###
nvd2014_2017CVEID_CVSSScore_WideUpdated <- reshape(data = nvd2014_2017CVEID_CVSSScoreUpdated, 
																						direction = "wide",
																						idvar = "CVE_ID",
																						timevar = "CVSS_Score",
																						v.names = "CVSS_Score")
head(nvd2014_2017CVEID_CVSSScore_WideUpdated[,1:7])
View(nvd2014_2017CVEID_CVSSScore_WideUpdated)
#rownames(nvd2014_2017CVEID_CVSSScore_Wide) <- nvd2014_2017CVEID_CVSSScore_Wide$CVE_ID

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.5 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.5)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.5[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.5)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.5 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.5)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.9 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.9)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.9[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.9)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.9 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.9)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.6 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.6)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.6[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.6)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.6 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.6)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.3 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.3)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.3[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.3)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.3 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.3)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.0 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.0)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.0[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.0)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.0 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.0)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.5 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.5)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.5[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.5)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.5 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.5)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.8 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.8)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.8[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.8)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.8 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.8)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.4 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.4)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.4[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.4)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.4 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.4)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.1.9 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.1.9)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.1.9[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.1.9)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.1.9 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.1.9)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.0 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.0)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.0[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.0)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.0 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.0)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.3 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.3)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.3[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.3)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.3 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.3)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.6 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.6)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.6[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.6)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.6 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.6)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.4 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.4)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.4[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.4)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.4 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.4)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.1 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.1)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.1[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.1)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.1 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.1)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.5 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.5)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.5[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.5)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.5 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.5)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.9 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.9)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.9[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.9)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.9 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.9)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.6 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.6)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.6[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.6)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.6 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.6)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.2 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.2)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.2[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.2)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.2 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.2)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.4 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.4)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.4[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.4)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.4 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.4)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.8 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.8)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.8[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.8)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.8 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.8)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.3 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.3)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.3[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.3)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.3 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.3)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.1 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.1)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.1[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.1)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.1 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.1)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.2 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.2)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.2[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.2)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.2 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.2)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.0 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.0)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.0[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.0)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.0 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.0)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.6 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.6)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.6[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.6)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.6 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.6)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.9 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.9)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.9[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.9)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.9 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.9)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.1 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.1)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.1[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.1)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.1 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.1)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.5 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.5)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.5[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.5)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.5 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.5)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.2 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.2)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.2[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.2)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.2 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.2)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.0 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.0)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.0[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.0)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.0 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.9.0)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.8 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.8)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.8[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.8)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.8 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.8)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.10.0 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.10.0)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.10.0[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.10.0)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.10.0 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.10.0)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.4 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.4)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.4[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.4)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.4 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.5.4)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.1 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.1)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.1[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.1)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.1 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.1)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.9 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.9)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.9[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.9)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.9 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.9)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.0 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.0)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.0[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.0)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.0 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.3.0)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.8 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.8)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.8[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.8)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.8 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.2.8)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.1 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.1)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.1[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.1)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.1 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.4.1)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.6 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.6)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.6[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.6)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.6 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.7.6)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.3 <- as.character(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.3)
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.3[!is.na(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.3)] <- "1"
nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.3 <- as.factor(nvd2014_2017CVEID_CVSSScore_WideUpdated$CVSS_Score.6.3)
str(nvd2014_2017CVEID_CVSSScore_WideUpdated)

#https://stackoverflow.com/questions/18580506/recommenderlab-error-in-asmethodobject-invalid-class-na-to-dup-mmatrix-as
nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated <- as.matrix(nvd2014_2017CVEID_CVSSScore_WideUpdated[2:41])
nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated[is.na(nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated)] <- 0
nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated <- sapply(data.frame(nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated), as.numeric)
nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated[nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated == 2] <- 3
nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated[nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated == 1] <- 0
nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated[nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated == 3] <- 1
str(nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated)

testRealMatrixUpdated <- as(nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated, "binaryRatingMatrix")
testRealMatrixUpdated
image(testRealMatrixUpdated[1:40, 1:40], main = "Binary Rating Matrix")

#str(nvd2014_2017CVEID_CVSSScore_Wide_Matrix)
#nvd2014_2017CVEID_CVSSScore_Wide_Matrix[is.na(nvd2014_2017CVEID_CVSSScore_Wide_Matrix)] <- 0
#testMatrix <- as(nvd2014_2017CVEID_CVSSScore_Wide_Matrix, "realRatingMatrix")
#View(nvd2014_2017CVEID_CVSSScore_Wide_Matrix)
#----------#
#nvd2014_2017CVEID_CWEID1 <- nvd2014_2017SelectedColumns[c(1, 8)]
#nvd2014_2017CVEID_CWEID1

#nvd2014_2017CVEID_CWEID1_Wide <- reshape(data = nvd2014_2017CVEID_CWEID1, 
#																						direction = "wide",
#																						idvar = "CVE_ID",
#																						timevar = "CWE_ID_1",
#																						v.names = "CWE_ID_1")
#head(nvd2014_2017CVEID_CWEID1_Wide[,1:7])
#View(nvd2014_2017CVEID_CWEID1_Wide)
#nvd2014_2017CVEID_CWEID1_Wide_Matrix <- as.matrix(nvd2014_2017CVEID_CWEID1_Wide)
#View(nvd2014_2017CVEID_CWEID1_Wide_Matrix)
#----------#
#nvd2014_2017CVEID_CWEID1Description <- nvd2014_2017SelectedColumns[c(1, 9)]
#nvd2014_2017CVEID_CWEID1Description

#nvd2014_2017CVEID_CWEID1Description_Wide <- reshape(data = nvd2014_2017CVEID_CWEID1Description, 
#																						 direction = "wide",
#																						 idvar = "CVE_ID",
#																						 timevar = "CWE_ID_1_Description",
#																						 v.names = "CWE_ID_1_Description")
#head(nvd2014_2017CVEID_CWEID1Description_Wide[,1:7])
#View(nvd2014_2017CVEID_CWEID1Description_Wide)
#nvd2014_2017CVEID_CWEID1Description_Wide_Matrix <- as.matrix(nvd2014_2017CVEID_CWEID1Description_Wide)
#View(nvd2014_2017CVEID_CWEID1Description_Wide_Matrix)
