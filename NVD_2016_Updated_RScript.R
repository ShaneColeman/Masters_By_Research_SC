#[1]
#NVD_2016_Updated_RScript.R

#[2]***
#https://support.rstudio.com/hc/en-us/community/posts/115000475648-Memory-limit
memory.limit()
memory.size(15000)

#[2]
install.packages("XML")
install.packages("methods")
install.packages("plyr")
install.packages("dplyr")
install.packages("anytime")

library(XML)
library(methods)
library(plyr)
library(dplyr)
library(anytime)

#[3]
nvd2016Updated <- xmlParse(file = "nvdcve-2.0-2016-updated.xml")
summary(nvd2016Updated)

#[4]
nvd2016UpdatedList <- xmlToList(nvd2016Updated)
nvd2016UpdatedList
dataNVD2016Updated <- ldply(.data = nvd2016UpdatedList, data.frame)

#[5]
cveID2016Updated <- dataNVD2016Updated$cve.id
cveID2016Updated
cveID2016UpdatedDataFrame <- ldply(cveID2016Updated, data.frame)
colnames(cveID2016UpdatedDataFrame) <- "CVE_ID"

#[6]
summary2016Updated <- dataNVD2016Updated$summary
summary2016Updated
summary2016UpdatedDataFrame <- ldply(summary2016Updated, data.frame)
colnames(summary2016UpdatedDataFrame) <- "Vulnerability_Summary"

#[7]
publishedDateTime2016Updated <- dataNVD2016Updated$published.datetime
publishedDateTime2016Updated
#----------Vulnerability_Published_Date----------#
publishedDate2016Updated <- anydate(publishedDateTime2016Updated) #Published Date 2017
publishedDate2016Updated
publishedDate2016UpdatedDataFrame <- ldply(publishedDate2016Updated, data.frame)
colnames(publishedDate2016UpdatedDataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2016Updated <- iso8601(anytime(publishedDateTime2016Updated, tz = "UTC"))
publishedTime2016Updated
#http://rfunction.com/archives/1499
publishedTimeSplit2016Updated <- strsplit(publishedTime2016Updated, " ") 
publishedTimeSplit2016Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2016Updated <- sapply(publishedTimeSplit2016Updated, "[", 2)
publishedTimeSplitSecondElement2016Updated
publishedTime2016UpdatedDataFrame <- ldply(publishedTimeSplitSecondElement2016Updated, data.frame)
colnames(publishedTime2016UpdatedDataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2016Updated <- dataNVD2016Updated$last.modified.datetime
lastModifiedDateTime2016Updated
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2016Updated <- anydate(lastModifiedDateTime2016Updated)
lastModifiedDate2016Updated
lastModifiedDate2016UpdatedDataFrame <- ldply(lastModifiedDate2016Updated, data.frame)
colnames(lastModifiedDate2016UpdatedDataFrame) <- "Vulnerability_Last_Modified_Date"

#[10]
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2016Updated <- iso8601(anytime(lastModifiedDateTime2016Updated, tz = "UTC"))
lastModifiedTime2016Updated
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2016Updated <- strsplit(lastModifiedTime2016Updated, " ") 
lastModifiedTimeSplit2016Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2016Updated <- sapply(lastModifiedTimeSplit2016Updated, "[", 2)
lastModifiedTimeSplitSecondElement2016Updated
lastModifiedTime2016UpdatedDataFrame <- ldply(lastModifiedTimeSplitSecondElement2016Updated, data.frame)
colnames(lastModifiedTime2016UpdatedDataFrame) <- "Vulnerability_Last_Modified_Time"

#[11]
cvss2016Updated <- dataNVD2016Updated$cvss.base_metrics.score
cvss2016Updated
cvss2016UpdatedDataFrame <- ldply(cvss2016Updated, data.frame)
colnames(cvss2016UpdatedDataFrame) <- "CVSS_Score"

#[12]
#https://nvd.nist.gov/vuln-metrics/cvss
cvssSeverity2016Updated <- dataNVD2016Updated$cvss.base_metrics.score
cvssSeverity2016Updated
cvssSeverity2016UpdatedDataFrame <- ldply(cvssSeverity2016Updated, data.frame)
colnames(cvssSeverity2016UpdatedDataFrame) <- "CVSS_Severity"
str(cvssSeverity2016UpdatedDataFrame)
View(cvssSeverity2016UpdatedDataFrame)
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) == "10.0"] <- "HIGH"
levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) >= 7.0 & 
																											 	levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) < 9.9] <- "HIGH"
levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) >= 4.0 & 
																											 	levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) <= 6.9] <- "MEDIUM"
levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) >= 0.0 & 
																											 	levels(cvssSeverity2016UpdatedDataFrame$CVSS_Severity) <= 3.9] <- "LOW"
View(cvssSeverity2016UpdatedDataFrame)

#[13]
cvssAccessVector2016Updated <- dataNVD2016Updated$cvss.base_metrics.access.vector
cvssAccessVector2016Updated
cvssAccessVector2016UpdatedDataFrame <- ldply(cvssAccessVector2016Updated, data.frame)
colnames(cvssAccessVector2016UpdatedDataFrame) <- "CVSS_Access_Vector"

#[14]
cvssAccessComplexity2016Updated <- dataNVD2016Updated$cvss.base_metrics.access.complexity
cvssAccessComplexity2016Updated
cvssAccessComplexity2016UpdatedDataFrame <- ldply(cvssAccessComplexity2016Updated, data.frame)
colnames(cvssAccessComplexity2016UpdatedDataFrame) <- "CVSS_Access_Complexity"

#[15]
cvssAuthentication2016Updated <- dataNVD2016Updated$cvss.base_metrics.authentication
cvssAuthentication2016Updated
cvssAuthentication2016UpdatedDataFrame <- ldply(cvssAuthentication2016Updated, data.frame)
colnames(cvssAuthentication2016UpdatedDataFrame) <- "CVSS_Authentication"

#[16]
cvssConfidentialityImpact2016Updated <- dataNVD2016Updated$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2016Updated
cvssConfidentialityImpact2016UpdatedDataFrame <- ldply(cvssConfidentialityImpact2016Updated, data.frame)
colnames(cvssConfidentialityImpact2016UpdatedDataFrame) <- "CVSS_Confidentiality_Impact"

#[17]
cvssIntegrityImpact2016Updated <- dataNVD2016Updated$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2016Updated
cvssIntegrityImpact2016UpdatedDataFrame <- ldply(cvssIntegrityImpact2016Updated, data.frame)
colnames(cvssIntegrityImpact2016UpdatedDataFrame) <- "CVSS_Integrity_Impact"
