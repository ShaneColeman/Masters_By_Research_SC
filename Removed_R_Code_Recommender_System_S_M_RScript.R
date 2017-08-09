#Removed_R_Code_Recommender_System_RScript.R




#-----Code was located underneath: 'set.seed(1)' (line 19 - 23)-----#
#----------#
#[3]
View(nvdMerge2014_2017TotalUpdated)
object.size(nvdMerge2014_2017TotalUpdated)
object.size(as(nvdMerge2014_2017TotalUpdated, "binaryRatingMatrix"))
object.size(as(nvdMerge2014_2017TotalUpdated, "binaryRatingMatrix")) / object.size(nvdMerge2014_2017TotalUpdated)
#----------#




#RScript: Recommender_System_RScript.R
#Code Lines: 27 - 122
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




#-----Code was located underneath: 'object.size(as(nvd2014_2017SelectedColumnsUpdated, "matrix")) / object.size(nvd2014_2017SelectedColumnsUpdated)' (line 40 - 44)-----#
#----------#
#nvd2014_2017CVEID_CVSSScore <- nvd2014_2017SelectedColumns[c(1, 13)]
#nvd2014_2017CVEID_CVSSScore
#rm(nvd2014_2017CVEID_CVSSScore)
#----------#




#-----Code was located underneath: 'View(nvd2014_2017Columns_1_13)' (line 68 - 93)-----#
#---------------------------------------------#
#---------------------------------------------#
nvd2014_2017CVEID_CVSSScoreUpdated <- nvd2014_2017SelectedColumnsUpdated[c(1, 13)]
nvd2014_2017CVEID_CVSSScoreUpdated
rm(nvd2014_2017CVEID_CVSSScoreUpdated)
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
#rm(nvd2014_2017CVEID_CVSSScore_Wide)
#----------#




#-----Code was located underneath the 'Binary Rating Matrix' Graph (line 1016)-----#
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
rm(nvd2014_2017CVEID_CVSSScore_WideUpdated)
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
View(nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated)
rm(nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated)

testRealMatrixUpdated <- as(nvd2014_2017CVEID_CVSSScore_Wide_MatrixUpdated, "binaryRatingMatrix")
testRealMatrixUpdated
image(testRealMatrixUpdated[1:40, 1:40], main = "Binary Rating Matrix")
rm(testRealMatrixUpdated)

#str(nvd2014_2017CVEID_CVSSScore_Wide_Matrix)
#rm(nvd2014_2017CVEID_CVSSScore_Wide_Matrix)
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




