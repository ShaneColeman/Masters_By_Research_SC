#[1]
#NVD_2014_Updated_RScript.R

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
nvd2014Updated <- xmlParse(file = "nvdcve-2.0-2014-updated.xml")
summary(nvd2014Updated)

#[4]
nvd2014UpdatedList <- xmlToList(nvd2014Updated)
nvd2014UpdatedList
dataNVD2014Updated <- ldply(.data = nvd2014UpdatedList, data.frame)

#[5]
cveID2014Updated <- dataNVD2014Updated$cve.id
cveID2014Updated
cveID2014UpdatedDataFrame <- ldply(cveID2014Updated, data.frame)
colnames(cveID2014UpdatedDataFrame) <- "CVE_ID"

#[6]
summary2014Updated <- dataNVD2014Updated$summary
summary2014Updated
summary2014UpdatedDataFrame <- ldply(summary2014Updated, data.frame)
colnames(summary2014UpdatedDataFrame) <- "Vulnerability_Summary"

#[7]
publishedDateTime2014Updated <- dataNVD2014Updated$published.datetime
publishedDateTime2014Updated
#----------Vulnerability_Published_Date----------#
publishedDate2014Updated <- anydate(publishedDateTime2014Updated) #Published Date 2014
publishedDate2014Updated
publishedDate2014UpdatedDataFrame <- ldply(publishedDate2014Updated, data.frame)
colnames(publishedDate2014UpdatedDataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2014Updated <- iso8601(anytime(publishedDateTime2014Updated, tz = "UTC"))
publishedTime2014Updated
#http://rfunction.com/archives/1499
publishedTimeSplit2014Updated <- strsplit(publishedTime2014Updated, " ") 
publishedTimeSplit2014Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2014Updated <- sapply(publishedTimeSplit2014Updated, "[", 2)
publishedTimeSplitSecondElement2014Updated
publishedTime2014UpdatedDataFrame <- ldply(publishedTimeSplitSecondElement2014Updated, data.frame)
colnames(publishedTime2014UpdatedDataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2014Updated <- dataNVD2014Updated$last.modified.datetime
lastModifiedDateTime2014Updated
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2014Updated <- anydate(lastModifiedDateTime2014Updated)
lastModifiedDate2014Updated
lastModifiedDate2014UpdatedDataFrame <- ldply(lastModifiedDate2014Updated, data.frame)
colnames(lastModifiedDate2014UpdatedDataFrame) <- "Vulnerability_Last_Modified_Date"

#[10]
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2014Updated <- iso8601(anytime(lastModifiedDateTime2014Updated, tz = "UTC"))
lastModifiedTime2014Updated
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2014Updated <- strsplit(lastModifiedTime2014Updated, " ") 
lastModifiedTimeSplit2014Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2014Updated <- sapply(lastModifiedTimeSplit2014Updated, "[", 2)
lastModifiedTimeSplitSecondElement2014Updated
lastModifiedTime2014UpdatedDataFrame <- ldply(lastModifiedTimeSplitSecondElement2014Updated, data.frame)
colnames(lastModifiedTime2014UpdatedDataFrame) <- "Vulnerability_Last_Modified_Time"

#[11]
cvss2014Updated <- dataNVD2014Updated$cvss.base_metrics.score
cvss2014Updated
cvss2014UpdatedDataFrame <- ldply(cvss2014Updated, data.frame)
colnames(cvss2014UpdatedDataFrame) <- "CVSS_Score"

#[12]
#https://nvd.nist.gov/vuln-metrics/cvss
cvssSeverity2014Updated <- dataNVD2014Updated$cvss.base_metrics.score
cvssSeverity2014Updated
cvssSeverity2014UpdatedDataFrame <- ldply(cvssSeverity2014Updated, data.frame)
colnames(cvssSeverity2014UpdatedDataFrame) <- "CVSS_Severity"
str(cvssSeverity2014UpdatedDataFrame)
View(cvssSeverity2014UpdatedDataFrame)
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) == "10.0"] <- "HIGH"
levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) >= 7.0 & 
																											 	levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) < 9.9] <- "HIGH"
levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) >= 4.0 & 
																											 	levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) <= 6.9] <- "MEDIUM"
levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity)[levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) >= 0.0 & 
																											 	levels(cvssSeverity2014UpdatedDataFrame$CVSS_Severity) <= 3.9] <- "LOW"
View(cvssSeverity2014UpdatedDataFrame)

#[13]
cvssAccessVector2014Updated <- dataNVD2014Updated$cvss.base_metrics.access.vector
cvssAccessVector2014Updated
cvssAccessVector2014UpdatedDataFrame <- ldply(cvssAccessVector2014Updated, data.frame)
colnames(cvssAccessVector2014UpdatedDataFrame) <- "CVSS_Access_Vector"

#[14]
cvssAccessComplexity2014Updated <- dataNVD2014Updated$cvss.base_metrics.access.complexity
cvssAccessComplexity2014Updated
cvssAccessComplexity2014UpdatedDataFrame <- ldply(cvssAccessComplexity2014Updated, data.frame)
colnames(cvssAccessComplexity2014UpdatedDataFrame) <- "CVSS_Access_Complexity"

#[15]
cvssAuthentication2014Updated <- dataNVD2014Updated$cvss.base_metrics.authentication
cvssAuthentication2014Updated
cvssAuthentication2014UpdatedDataFrame <- ldply(cvssAuthentication2014Updated, data.frame)
colnames(cvssAuthentication2014UpdatedDataFrame) <- "CVSS_Authentication"

#[16]
cvssConfidentialityImpact2014Updated <- dataNVD2014Updated$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2014Updated
cvssConfidentialityImpact2014UpdatedDataFrame <- ldply(cvssConfidentialityImpact2014Updated, data.frame)
colnames(cvssConfidentialityImpact2014UpdatedDataFrame) <- "CVSS_Confidentiality_Impact"

#[17]
cvssIntegrityImpact2014Updated <- dataNVD2014Updated$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2014Updated
cvssIntegrityImpact2014UpdatedDataFrame <- ldply(cvssIntegrityImpact2014Updated, data.frame)
colnames(cvssIntegrityImpact2014UpdatedDataFrame) <- "CVSS_Integrity_Impact"

#[18]
cvssAvailabilityImpact2014Updated <- dataNVD2014Updated$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2014Updated
cvssAvailabilityImpact2014UpdatedDataFrame <- ldply(cvssAvailabilityImpact2014Updated, data.frame)
colnames(cvssAvailabilityImpact2014UpdatedDataFrame) <- "CVSS_Availability_Impact"

#[19]
cvssGeneratedOnDateTime2014Updated <- dataNVD2014Updated$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2014Updated
#----------CVSS_Generated_On_Date----------#
cvssGeneratedOnDate2014Updated <- anydate(cvssGeneratedOnDateTime2014Updated)
cvssGeneratedOnDate2014UpdatedDataFrame <- ldply(cvssGeneratedOnDate2014Updated, data.frame)
colnames(cvssGeneratedOnDate2014UpdatedDataFrame) <- "CVSS_Generated_On_Date"

#[20]
#----------CVSS_Generated_On_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
cvssGeneratedOnTime2014Updated <- iso8601(anytime(cvssGeneratedOnDateTime2014Updated, tz = "UTC"))
cvssGeneratedOnTime2014Updated
#http://rfunction.com/archives/1499
cvssGeneratedOnTimeSplit2014Updated <- strsplit(cvssGeneratedOnTime2014Updated, " ") 
cvssGeneratedOnTimeSplit2014Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
cvssGeneratedOnTimeSplitSecondElement2014Updated <- sapply(cvssGeneratedOnTimeSplit2014Updated, "[", 2)
cvssGeneratedOnTimeSplitSecondElement2014Updated
cvssGeneratedOnTime2014UpdatedDataFrame <- ldply(cvssGeneratedOnTimeSplitSecondElement2014Updated, data.frame)
colnames(cvssGeneratedOnTime2014UpdatedDataFrame) <- "CVSS_Generated_On_Time"
