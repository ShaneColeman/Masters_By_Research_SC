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
object.size(as(nvdMerge2014_2017TotalUpdated, "matrix"))
object.size(as(nvdMerge2014_2017TotalUpdated, "matrix")) / object.size(nvdMerge2014_2017TotalUpdated)

#[Test Code]
nvd2014_2017SelectedColumns <- nvdMerge2014_2015_2016_2017Updated[c(1, 9:14, 17:18, 19:20, 2, 7:8)]
str(nvd2014_2017SelectedColumns$CWE_ID_1)
#----------#
#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CVSS_Access_Vector <- as.character(nvd2014_2017SelectedColumns$CVSS_Access_Vector)
str(nvd2014_2017SelectedColumns$CVSS_Access_Vector)
nvd2014_2017SelectedColumns$CVSS_Access_Vector[is.na(nvd2014_2017SelectedColumns$CVSS_Access_Vector)] <- "N/A"
nvd2014_2017SelectedColumns$CVSS_Access_Vector <- as.factor(nvd2014_2017SelectedColumns$CVSS_Access_Vector)
str(nvd2014_2017SelectedColumns$CVSS_Access_Vector)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CVSS_Access_Complexity <- as.character(nvd2014_2017SelectedColumns$CVSS_Access_Complexity)
str(nvd2014_2017SelectedColumns$CVSS_Access_Complexity)
nvd2014_2017SelectedColumns$CVSS_Access_Complexity[is.na(nvd2014_2017SelectedColumns$CVSS_Access_Complexity)] <- "N/A"
nvd2014_2017SelectedColumns$CVSS_Access_Complexity <- as.factor(nvd2014_2017SelectedColumns$CVSS_Access_Complexity)
str(nvd2014_2017SelectedColumns$CVSS_Access_Complexity)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CVSS_Authentication <- as.character(nvd2014_2017SelectedColumns$CVSS_Authentication)
str(nvd2014_2017SelectedColumns$CVSS_Authentication)
nvd2014_2017SelectedColumns$CVSS_Authentication[is.na(nvd2014_2017SelectedColumns$CVSS_Authentication)] <- "N/A"
nvd2014_2017SelectedColumns$CVSS_Authentication <- as.factor(nvd2014_2017SelectedColumns$CVSS_Authentication)
str(nvd2014_2017SelectedColumns$CVSS_Authentication)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CVSS_Confidentiality_Impact <- as.character(nvd2014_2017SelectedColumns$CVSS_Confidentiality_Impact)
str(nvd2014_2017SelectedColumns$CVSS_Confidentiality_Impact)
nvd2014_2017SelectedColumns$CVSS_Confidentiality_Impact[is.na(nvd2014_2017SelectedColumns$CVSS_Confidentiality_Impact)] <- "N/A"
nvd2014_2017SelectedColumns$CVSS_Confidentiality_Impact <- as.factor(nvd2014_2017SelectedColumns$CVSS_Confidentiality_Impact)
str(nvd2014_2017SelectedColumns$CVSS_Confidentiality_Impact)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CVSS_Integrity_Impact <- as.character(nvd2014_2017SelectedColumns$CVSS_Integrity_Impact)
str(nvd2014_2017SelectedColumns$CVSS_Integrity_Impact)
nvd2014_2017SelectedColumns$CVSS_Integrity_Impact[is.na(nvd2014_2017SelectedColumns$CVSS_Integrity_Impact)] <- "N/A"
nvd2014_2017SelectedColumns$CVSS_Integrity_Impact <- as.factor(nvd2014_2017SelectedColumns$CVSS_Integrity_Impact)
str(nvd2014_2017SelectedColumns$CVSS_Integrity_Impact)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CVSS_Availability_Impact <- as.character(nvd2014_2017SelectedColumns$CVSS_Availability_Impact)
str(nvd2014_2017SelectedColumns$CVSS_Availability_Impact)
nvd2014_2017SelectedColumns$CVSS_Availability_Impact[is.na(nvd2014_2017SelectedColumns$CVSS_Availability_Impact)] <- "N/A"
nvd2014_2017SelectedColumns$CVSS_Availability_Impact <- as.factor(nvd2014_2017SelectedColumns$CVSS_Availability_Impact)
str(nvd2014_2017SelectedColumns$CVSS_Availability_Impact)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CWE_ID_1 <- as.character(nvd2014_2017SelectedColumns$CWE_ID_1)
str(nvd2014_2017SelectedColumns$CWE_ID_1)
nvd2014_2017SelectedColumns$CWE_ID_1[is.na(nvd2014_2017SelectedColumns$CWE_ID_1)] <- "N/A"
nvd2014_2017SelectedColumns$CWE_ID_1 <- as.factor(nvd2014_2017SelectedColumns$CWE_ID_1)
str(nvd2014_2017SelectedColumns$CWE_ID_1)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CWE_ID_1_Description <- as.character(nvd2014_2017SelectedColumns$CWE_ID_1_Description)
str(nvd2014_2017SelectedColumns$CWE_ID_1_Description)
nvd2014_2017SelectedColumns$CWE_ID_1_Description[is.na(nvd2014_2017SelectedColumns$CWE_ID_1_Description)] <- "N/A"
nvd2014_2017SelectedColumns$CWE_ID_1_Description <- as.factor(nvd2014_2017SelectedColumns$CWE_ID_1_Description)
str(nvd2014_2017SelectedColumns$CWE_ID_1_Description)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CWE_ID_2 <- as.character(nvd2014_2017SelectedColumns$CWE_ID_2)
str(nvd2014_2017SelectedColumns$CWE_ID_2)
nvd2014_2017SelectedColumns$CWE_ID_2[is.na(nvd2014_2017SelectedColumns$CWE_ID_2)] <- "N/A"
nvd2014_2017SelectedColumns$CWE_ID_2 <- as.factor(nvd2014_2017SelectedColumns$CWE_ID_2)
str(nvd2014_2017SelectedColumns$CWE_ID_2)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CWE_ID_2_Description <- as.character(nvd2014_2017SelectedColumns$CWE_ID_2_Description)
str(nvd2014_2017SelectedColumns$CWE_ID_2_Description)
nvd2014_2017SelectedColumns$CWE_ID_2_Description[is.na(nvd2014_2017SelectedColumns$CWE_ID_2_Description)] <- "N/A"
nvd2014_2017SelectedColumns$CWE_ID_2_Description <- as.factor(nvd2014_2017SelectedColumns$CWE_ID_2_Description)
str(nvd2014_2017SelectedColumns$CWE_ID_2_Description)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CVSS_Score <- as.character(nvd2014_2017SelectedColumns$CVSS_Score )
str(nvd2014_2017SelectedColumns$CVSS_Score)
nvd2014_2017SelectedColumns$CVSS_Score[is.na(nvd2014_2017SelectedColumns$CVSS_Score )] <- "N/A"
nvd2014_2017SelectedColumns$CVSS_Score <- as.factor(nvd2014_2017SelectedColumns$CVSS_Score )
str(nvd2014_2017SelectedColumns$CVSS_Score)
View(nvd2014_2017SelectedColumns)

#https://stackoverflow.com/questions/9251326/convert-data-frame-column-format-from-character-to-factor
nvd2014_2017SelectedColumns$CVSS_Severity <- as.character(nvd2014_2017SelectedColumns$CVSS_Severity)
str(nvd2014_2017SelectedColumns$CVSS_Severity)
nvd2014_2017SelectedColumns$CVSS_Severity[is.na(nvd2014_2017SelectedColumns$CVSS_Severity)] <- "N/A"
nvd2014_2017SelectedColumns$CVSS_Severity <- as.factor(nvd2014_2017SelectedColumns$CVSS_Severity)
str(nvd2014_2017SelectedColumns$CVSS_Severity)
View(nvd2014_2017SelectedColumns)

summary(nvd2014_2017SelectedColumns)
