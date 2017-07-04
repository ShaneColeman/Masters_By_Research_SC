#NVD_2014_RScript.R

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

nvd2014 <- xmlParse(file = "nvdcve-2.0-2014.xml")
summary(nvd2014)

nvd2014List <- xmlToList(nvd2014)
nvd2014List
dataNVD2014 <- ldply(.data = nvd2014List, data.frame)

cveID2014 <- dataNVD2014$cve.id
cveID2014
cveID2014DataFrame <- ldply(cveID2014, data.frame)
colnames(cveID2014DataFrame) <- "CVE_ID"

summary2014 <- dataNVD2014$summary
summary2014
summary2014DataFrame <- ldply(summary2014, data.frame)
colnames(summary2014DataFrame) <- "Vulnerability_Summary"

publishedDateTime2014 <- dataNVD2014$published.datetime
publishedDateTime2014
#----------Vulnerability_Published_Date----------#
publishedDate2014 <- anydate(publishedDateTime2014)
publishedDate2014DataFrame <- ldply(publishedDate2014, data.frame)
colnames(publishedDate2014DataFrame) <- "Vulnerability_Published_Date"
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2014 <- iso8601(anytime(publishedDateTime2014, tz = "UTC"))
publishedTime2014
#http://rfunction.com/archives/1499
publishedTimeSplit2014 <- strsplit(publishedTime2014, " ") 
publishedTimeSplit2014
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2014 <- sapply(publishedTimeSplit2014, "[", 2)
publishedTimeSplitSecondElement2014
publishedTime2014DataFrame <- ldply(publishedTimeSplitSecondElement2014, data.frame)
colnames(publishedTime2014DataFrame) <- "Vulnerability_Published_Time"

lastModifiedDateTime2014 <- dataNVD2014$last.modified.datetime
lastModifiedDateTime2014
lastModifiedDate2014 <- anydate(lastModifiedDateTime2014)
lastModifiedDate2014DataFrame <- ldply(lastModifiedDate2014, data.frame)
colnames(lastModifiedDate2014DataFrame) <- "Vulnerability_Last_Modified_Date"

cvss2014 <- dataNVD2014$cvss.base_metrics.score
cvss2014
cvss2014DataFrame <- ldply(cvss2014, data.frame)
colnames(cvss2014DataFrame) <- "CVSS_Score"

cvssAccessVector2014 <- dataNVD2014$cvss.base_metrics.access.vector
cvssAccessVector2014
cvssAccessVector2014DataFrame <- ldply(cvssAccessVector2014, data.frame)
colnames(cvssAccessVector2014DataFrame) <- "CVSS_Access_Vector"

cvssAccessComplexity2014 <- dataNVD2014$cvss.base_metrics.access.complexity
cvssAccessComplexity2014
cvssAccessComplexity2014DataFrame <- ldply(cvssAccessComplexity2014, data.frame)
colnames(cvssAccessComplexity2014DataFrame) <- "CVSS_Access_Complexity"

cvssAuthentication2014 <- dataNVD2014$cvss.base_metrics.authentication
cvssAuthentication2014
cvssAuthentication2014DataFrame <- ldply(cvssAuthentication2014, data.frame)
colnames(cvssAuthentication2014DataFrame) <- "CVSS_Authentication"

cvssConfidentialityImpact2014 <- dataNVD2014$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2014
cvssConfidentialityImpact2014DataFrame <- ldply(cvssConfidentialityImpact2014, data.frame)
colnames(cvssConfidentialityImpact2014DataFrame) <- "CVSS_Confidentiality_Impact"

cvssIntegrityImpact2014 <- dataNVD2014$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2014
cvssIntegrityImpact2014DataFrame <- ldply(cvssIntegrityImpact2014, data.frame)
colnames(cvssIntegrityImpact2014DataFrame) <- "CVSS_Integrity_Impact"

cvssAvailabilityImpact2014 <- dataNVD2014$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2014
cvssAvailabilityImpact2014DataFrame <- ldply(cvssAvailabilityImpact2014, data.frame)
colnames(cvssAvailabilityImpact2014DataFrame) <- "CVSS_Availability_Impact"

cvssGeneratedOnDateTime2014 <- dataNVD2014$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2014
cvssGeneratedOnDate2014 <- anydate(cvssGeneratedOnDateTime2014)
cvssGeneratedOnDate2014DataFrame <- ldply(cvssGeneratedOnDate2014, data.frame)
colnames(cvssGeneratedOnDate2014DataFrame) <- "CVSS_Generated_On_Date"

cwe2014 <- dataNVD2014$cwe
cwe2014
cwe2014DataFrame <- ldply(cwe2014, data.frame)
colnames(cwe2014DataFrame) <- "CWE"

nvd2014Total <- cbind(cveID2014DataFrame, summary2014DataFrame, 
											publishedDate2014DataFrame, publishedTime2014DataFrame, lastModifiedDate2014DataFrame, 
											cvss2014DataFrame, cvssAccessVector2014DataFrame, cvssAccessComplexity2014DataFrame, 
											cvssAuthentication2014DataFrame, cvssConfidentialityImpact2014DataFrame, 
											cvssIntegrityImpact2014DataFrame, cvssAvailabilityImpact2014DataFrame, 
											cvssGeneratedOnDate2014DataFrame, cwe2014DataFrame)
nvd2014TotalDistinct <-distinct(nvd2014Total)

#http://www.duanqu.tech/questions/4900348/how-to-remove-rows-in-a-dataframe-that-contain-certain-words-in-r
nvd2014TotalDistinctRejectRemoved <- nvd2014TotalDistinct[!grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2014TotalDistinct$Vulnerability_Summary), ]

write.csv(nvd2014TotalDistinct, "CVE_2014.csv")
