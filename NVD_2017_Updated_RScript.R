#[1]
#NVD_2017_Updated_RScript.R

#[2]
#install.packages("XML")
#install.packages("methods")
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("anytime")

library(XML)
library(methods)
library(plyr)
library(dplyr)
library(anytime)

#[3]
nvd2017Updated <- xmlParse(file = "nvdcve-2.0-2017-updated.xml")
summary(nvd2017Updated)

#[4]
nvd2017UpdatedList <- xmlToList(nvd2017Updated)
nvd2017UpdatedList
dataNVD2017Updated <- ldply(.data = nvd2017UpdatedList, data.frame)

#[5]
cveID2017Updated <- dataNVD2017Updated$cve.id
cveID2017Updated
cveID2017UpdatedDataFrame <- ldply(cveID2017Updated, data.frame)
colnames(cveID2017UpdatedDataFrame) <- "CVE_ID"

#[6]
summary2017Updated <- dataNVD2017Updated$summary
summary2017Updated
summary2017UpdatedDataFrame <- ldply(summary2017Updated, data.frame)
colnames(summary2017UpdatedDataFrame) <- "Vulnerability_Summary"

#[7]
publishedDateTime2017Updated <- dataNVD2017Updated$published.datetime
publishedDateTime2017Updated
#----------Vulnerability_Published_Date----------#
publishedDate2017Updated <- anydate(publishedDateTime2017Updated) #Published Date 2017
publishedDate2017Updated
publishedDate2017UpdatedDataFrame <- ldply(publishedDate2017Updated, data.frame)
colnames(publishedDate2017UpdatedDataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2017Updated <- iso8601(anytime(publishedDateTime2017Updated, tz = "UTC"))
publishedTime2017Updated
#http://rfunction.com/archives/1499
publishedTimeSplit2017Updated <- strsplit(publishedTime2017Updated, " ") 
publishedTimeSplit2017Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2017Updated <- sapply(publishedTimeSplit2017Updated, "[", 2)
publishedTimeSplitSecondElement2017Updated
publishedTime2017UpdatedDataFrame <- ldply(publishedTimeSplitSecondElement2017Updated, data.frame)
colnames(publishedTime2017UpdatedDataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2017Updated <- dataNVD2017Updated$last.modified.datetime
lastModifiedDateTime2017Updated
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2017Updated <- anydate(lastModifiedDateTime2017Updated)
lastModifiedDate2017Updated
lastModifiedDate2017UpdatedDataFrame <- ldply(lastModifiedDate2017Updated, data.frame)
colnames(lastModifiedDate2017UpdatedDataFrame) <- "Vulnerability_Last_Modified_Date"

#[10]
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2017Updated <- iso8601(anytime(lastModifiedDateTime2017Updated, tz = "UTC"))
lastModifiedTime2017Updated
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2017Updated <- strsplit(lastModifiedTime2017Updated, " ") 
lastModifiedTimeSplit2017Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2017Updated <- sapply(lastModifiedTimeSplit2017Updated, "[", 2)
lastModifiedTimeSplitSecondElement2017Updated
lastModifiedTime2017UpdatedDataFrame <- ldply(lastModifiedTimeSplitSecondElement2017Updated, data.frame)
colnames(lastModifiedTime2017UpdatedDataFrame) <- "Vulnerability_Last_Modified_Time"

#[11]
cvss2017Updated <- dataNVD2017Updated$cvss.base_metrics.score
cvss2017Updated
cvss2017UpdatedDataFrame <- ldply(cvss2017Updated, data.frame)
colnames(cvss2017UpdatedDataFrame) <- "CVSS_Score"

#[12]
#https://nvd.nist.gov/vuln-metrics/cvss
cvssSeverity2017Updated <- dataNVD2017Updated$cvss.base_metrics.score
cvssSeverity2017Updated
cvssSeverity2017UpdatedDataFrame <- ldply(cvssSeverity2017Updated, data.frame)
colnames(cvssSeverity2017UpdatedDataFrame) <- "CVSS_Severity"
str(cvssSeverity2017UpdatedDataFrame)
View(cvssSeverity2017UpdatedDataFrame)
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) == "10.0"] <- "HIGH"
levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) >= 7.0 & 
																									levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) < 9.9] <- "HIGH"
levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) >= 4.0 & 
																									levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) <= 6.9] <- "MEDIUM"
levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) >= 0.0 & 
																									levels(cvssSeverity2017UpdatedDataFrame$CVSS_Severity) <= 3.9] <- "LOW"
View(cvssSeverity2017UpdatedDataFrame)

#[13]
cvssAccessVector2017Updated <- dataNVD2017Updated$cvss.base_metrics.access.vector
cvssAccessVector2017Updated
cvssAccessVector2017UpdatedDataFrame <- ldply(cvssAccessVector2017Updated, data.frame)
colnames(cvssAccessVector2017UpdatedDataFrame) <- "CVSS_Access_Vector"

#[14]
cvssAccessComplexity2017Updated <- dataNVD2017Updated$cvss.base_metrics.access.complexity
cvssAccessComplexity2017Updated
cvssAccessComplexity2017UpdatedDataFrame <- ldply(cvssAccessComplexity2017Updated, data.frame)
colnames(cvssAccessComplexity2017UpdatedDataFrame) <- "CVSS_Access_Complexity"
