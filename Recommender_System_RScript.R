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
nvd2014_2017SelectedColumns <- nvdMerge2014_2015_2016_2017Updated[c(1, 9:14, 17:18, 19:20, 2, 7:8)]
str(nvd2014_2017SelectedColumns$CWE_ID_1)
#----------#
nvd2014_2017SelectedColumnsUpdated <- nvdMerge2014_2015_2016_2017NAUpdated[c(1, 9:14, 17:18, 19:20, 2, 7:8)]
str(nvd2014_2017SelectedColumnsUpdated)

summary(nvd2014_2017SelectedColumnsUpdated)

#[3]
object.size(nvd2014_2017SelectedColumnsUpdated)
object.size(as(nvd2014_2017SelectedColumnsUpdated, "matrix"))
object.size(as(nvd2014_2017SelectedColumnsUpdated, "matrix")) / object.size(nvd2014_2017SelectedColumnsUpdated)
#----------#
nvd2014_2017CVEID_CVSSScore <- nvd2014_2017SelectedColumns[c(1, 13)]
nvd2014_2017CVEID_CVSSScore
#----------#
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

nvd2014_2017CVEID_CVSSScore_Wide <- reshape(data = nvd2014_2017CVEID_CVSSScore, 
																		direction = "wide",
																		idvar = "CVE_ID",
																		timevar = "CVSS_Score",
																		v.names = "CVSS_Score")
head(nvd2014_2017CVEID_CVSSScore_Wide[,1:7])
View(nvd2014_2017CVEID_CVSSScore_Wide)
#rownames(nvd2014_2017CVEID_CVSSScore_Wide) <- nvd2014_2017CVEID_CVSSScore_Wide$CVE_ID
#----------#
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
nvd2014_2017CVEID_CWEID1 <- nvd2014_2017SelectedColumns[c(1, 8)]
nvd2014_2017CVEID_CWEID1

nvd2014_2017CVEID_CWEID1_Wide <- reshape(data = nvd2014_2017CVEID_CWEID1, 
																						direction = "wide",
																						idvar = "CVE_ID",
																						timevar = "CWE_ID_1",
																						v.names = "CWE_ID_1")
head(nvd2014_2017CVEID_CWEID1_Wide[,1:7])
View(nvd2014_2017CVEID_CWEID1_Wide)
nvd2014_2017CVEID_CWEID1_Wide_Matrix <- as.matrix(nvd2014_2017CVEID_CWEID1_Wide)
View(nvd2014_2017CVEID_CWEID1_Wide_Matrix)
#----------#
nvd2014_2017CVEID_CWEID1Description <- nvd2014_2017SelectedColumns[c(1, 9)]
nvd2014_2017CVEID_CWEID1Description

nvd2014_2017CVEID_CWEID1Description_Wide <- reshape(data = nvd2014_2017CVEID_CWEID1Description, 
																						 direction = "wide",
																						 idvar = "CVE_ID",
																						 timevar = "CWE_ID_1_Description",
																						 v.names = "CWE_ID_1_Description")
head(nvd2014_2017CVEID_CWEID1Description_Wide[,1:7])
View(nvd2014_2017CVEID_CWEID1Description_Wide)
nvd2014_2017CVEID_CWEID1Description_Wide_Matrix <- as.matrix(nvd2014_2017CVEID_CWEID1Description_Wide)
View(nvd2014_2017CVEID_CWEID1Description_Wide_Matrix)
