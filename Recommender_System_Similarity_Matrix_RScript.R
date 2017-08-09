#[1]
#Recommender_System_Similarity_Matrix_RScript.R

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
#[Columns: 1 and 2] - CVE_ID & CVSS_Access_Vector
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

#[Columns: 1 and 3] - CVE_ID & CVSS_Access_Complexity
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

#[Columns: 1 and 4] - CVE_ID & CVSS_Authentication
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

#[Columns: 1 and 5] - CVE_ID & CVSS_Confidentiality_Impact
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

#[Columns: 1 and 6] - CVE_ID & CVSS_Integrity_Impact
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

#[Columns: 1 and 7] - CVE_ID & CVSS_Availability_Impact
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

#[Columns: 1 and 8] CVE_ID & CWE_ID_1
nvd2014_2017Columns_1_8_Wide <- reshape(data = nvd2014_2017Columns_1_8, direction = "wide", idvar = "CVE_ID",
																				timevar = "CWE_ID_1", v.names = "CWE_ID_1")
head(nvd2014_2017Columns_1_8_Wide[,1:6])
View(nvd2014_2017Columns_1_8_Wide)
lengthColumns_1_8 <- length(nvd2014_2017Columns_1_8_Wide)
lengthColumns_1_8
#-----`CWE_ID_1.CWE-119`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-119` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-119`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-119`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-119`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-119` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-119`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-264`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-264` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-264`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-264`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-264`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-264` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-264`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-200`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-200` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-200`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-200`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-200`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-200` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-200`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----CWE_ID_1.NA-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$CWE_ID_1.NA <- as.character(nvd2014_2017Columns_1_8_Wide$CWE_ID_1.NA)
nvd2014_2017Columns_1_8_Wide$CWE_ID_1.NA[!is.na(nvd2014_2017Columns_1_8_Wide$CWE_ID_1.NA)] <- "1"
nvd2014_2017Columns_1_8_Wide$CWE_ID_1.NA <- as.factor(nvd2014_2017Columns_1_8_Wide$CWE_ID_1.NA)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-255`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-255` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-255`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-255`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-255`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-255` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-255`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-352`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-352` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-352`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-352`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-352`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-352` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-352`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-287`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-287` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-287`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-287`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-287`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-287` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-287`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-332`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-332` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-332`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-332`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-332`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-332` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-332`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-310`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-310` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-310`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-310`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-310`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-310` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-310`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-20`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-20` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-20`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-20`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-20`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-20` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-20`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-59`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-59` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-59`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-59`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-59`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-59` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-59`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-189`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-189` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-189`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-189`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-189`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-189` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-189`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-79`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-79` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-79`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-79`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-79`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-79` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-79`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-94`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-94` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-94`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-94`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-94`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-94` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-94`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-362`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-362` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-362`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-362`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-362`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-362` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-362`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-89`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-89` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-89`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-89`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-89`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-89` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-89`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-399`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-399` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-399`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-399`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-399`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-399` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-399`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-22`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-22`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-22`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-611`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-611` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-611`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-611`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-611`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-611` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-611`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-19`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-19` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-19`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-19`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-19`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-19` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-19`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-284`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-284` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-284`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-284`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-284`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-284` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-284`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-416`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-416` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-416`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-416`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-416`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-416` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-416`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-78`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-78` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-78`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-78`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-78`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-78` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-78`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-254`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-254` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-254`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-254`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-254`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-254` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-254`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-415`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-415` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-415`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-415`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-415`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-415` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-415`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-134`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-134` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-134`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-134`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-134`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-134` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-134`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-824`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-824` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-824`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-824`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-824`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-824` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-824`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-199`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-199` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-199`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-199`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-199`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-199` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-199`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-77`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-77` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-77`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-77`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-77`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-77` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-77`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-21`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-21` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-21`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-21`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-21`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-21` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-21`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-17`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-17` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-17`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-17`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-17`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-17` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-17`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-345`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-345` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-345`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-345`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-345`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-345` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-345`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-16`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-16` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-16`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-16`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-16`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-16` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-16`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-400`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-400` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-400`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-400`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-400`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-400` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-400`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-297`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-297` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-297`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-297`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-297`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-297` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-297`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-297`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-476` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-476`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-476`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-476`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-476` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-476`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-384`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-384` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-384`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-384`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-384`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-384` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-384`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-358`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-358` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-358`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-358`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-358`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-358` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-358`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-358`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-428` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-428`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-428`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-428`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-428` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-428`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-74`-----#
str(nvd2014_2017Columns_1_8_Wide)
	nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-74` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-74`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-74`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-74`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-74` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-74`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-190`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-190` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-190`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-190`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-190`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-190` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-190`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-125`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-125` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-125`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-125`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-125`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-125` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-125`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-327`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-327` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-327`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-327`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-327`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-327` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-327`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-502`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-502` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-502`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-502`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-502`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-502` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-502`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-191`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-191` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-191`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-191`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-191`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-191` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-191`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-18`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-18` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-18`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-18`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-18`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-18` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-18`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-388`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-388` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-388`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-388`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-388`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-388` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-388`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-913`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-913` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-913`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-913`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-913`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-913` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-913`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-347`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-347` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-347`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-347`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-347`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-347` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-347`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-116`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-116` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-116`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-116`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-116`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-116` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-116`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-665`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-665` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-665`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-665`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-665`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-665` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-665`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-285`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-285` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-285`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-285`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-285`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-285` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-285`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-129`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-129` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-129`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-129`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-129`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-129` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-129`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-601`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-601` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-601`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-601`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-601`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-601` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-601`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-434`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-434` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-434`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-434`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-434`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-434` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-434`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-113`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-113` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-113`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-113`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-113`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-113` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-113`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-320`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-320` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-320`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-320`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-320`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-320` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-320`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-295`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-295` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-295`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-295`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-295`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-295` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-295`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-798`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-798` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-798`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-798`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-798`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-798` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-798`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-441`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-441` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-441`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-441`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-441`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-441` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-441`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-640`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-640` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-640`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-640`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-640`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-640` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-640`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-369`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-369` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-369`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-369`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-369`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-369` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-369`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-426`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-426` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-426`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-426`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-426`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-426` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-426`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-918`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-918` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-918`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-918`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-918`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-918` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-918`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-275`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-275` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-275`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-275`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-275`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-275` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-275`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-326`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-326` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-326`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-326`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-326`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-326` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-326`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-123`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-123` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-123`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-123`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-123`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-123` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-123`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-787`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-787` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-787`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-787`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-787`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-787` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-787`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-532`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-532` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-532`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-532`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-532`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-532` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-532`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-330`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-330` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-330`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-330`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-330`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-330` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-330`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-306`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-306` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-306`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-306`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-306`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-306` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-306`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-93`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-93` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-93`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-93`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-93`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-93` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-93`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-693`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-693` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-693`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-693`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-693`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-693` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-693`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-88`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-88` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-88`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-88`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-88`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-88` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-88`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-338`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-338` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-338`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-338`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-338`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-338` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-338`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-404`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-404` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-404`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-404`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-404`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-404` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-404`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-361`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-361` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-361`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-361`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-361`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-361` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-361`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-331`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-331` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-331`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-331`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-331`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-331` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-331`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-91`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-91` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-91`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-91`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-91`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-91` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-91`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-172`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-172` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-172`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-172`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-172`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-172` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-172`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-427`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-427` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-427`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-427`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-427`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-427` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-427`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-704`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-704` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-704`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-704`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-704`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-704` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-704`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-669`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-669` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-669`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-669`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-669`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-669` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-669`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-613`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-613` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-613`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-613`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-613`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-613` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-613`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-346`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-346` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-346`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-346`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-346`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-346` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-346`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-184`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-184` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-184`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-184`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-184`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-184` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-184`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-682`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-682` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-682`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-682`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-682`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-682` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-682`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-749`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-749` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-749`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-749`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-749`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-749` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-749`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-754`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-754` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-754`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-754`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-754`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-754` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-754`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-664`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-664` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-664`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-664`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-664`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-664` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-664`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-775`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-775` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-775`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-775`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-775`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-775` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-775`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-90`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-90` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-90`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-90`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-90`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-90` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-90`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-417`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-417` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-417`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-417`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-417`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-417` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-417`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-118`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-118` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-118`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-118`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-118`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-118` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-118`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-444`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-444` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-444`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-444`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-444`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-444` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-444`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-485`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-485` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-485`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-485`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-485`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-485` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-485`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-99`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-99` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-99`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-99`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-99`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-99` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-99`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-943`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-943` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-943`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-943`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-943`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-943` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-943`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)
#-----`CWE_ID_1.CWE-769`-----#
str(nvd2014_2017Columns_1_8_Wide)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-769` <- as.character(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-769`)
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-769`[!is.na(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-769`)] <- "1"
nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-769` <- as.factor(nvd2014_2017Columns_1_8_Wide$`CWE_ID_1.CWE-769`)
str(nvd2014_2017Columns_1_8_Wide)
View(nvd2014_2017Columns_1_8_Wide)

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
																 nvd2014_2017Columns_1_8_Wide), 
																 by = "CVE_ID", type = "full")
str(nvd2014_2017ColumnsTotal)
View(nvd2014_2017ColumnsTotal)
write.csv(nvd2014_2017ColumnsTotal, "NVD_2014_2017_Columns_Total.csv", row.names = FALSE)

#https://stackoverflow.com/questions/18580506/recommenderlab-error-in-asmethodobject-invalid-class-na-to-dup-mmatrix-as
nvd2014_2017ColumnsTotalMatrix <- as.matrix(nvd2014_2017ColumnsTotal[2:118])
nvd2014_2017ColumnsTotalMatrix[is.na(nvd2014_2017ColumnsTotalMatrix)] <- 0
nvd2014_2017ColumnsTotalMatrix <- sapply(data.frame(nvd2014_2017ColumnsTotalMatrix), as.numeric)
nvd2014_2017ColumnsTotalMatrix[nvd2014_2017ColumnsTotalMatrix == 1] <- 0
nvd2014_2017ColumnsTotalMatrix[nvd2014_2017ColumnsTotalMatrix == 2] <- 1
str(nvd2014_2017ColumnsTotalMatrix)

nvd2014_2017ColumnsTotalMatrixBinary <- as(nvd2014_2017ColumnsTotalMatrix, "binaryRatingMatrix")
nvd2014_2017ColumnsTotalMatrixBinary
image(nvd2014_2017ColumnsTotalMatrixBinary[1:50, 1:50], main = "Binary Rating Matrix")
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
