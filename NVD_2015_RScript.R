#NVD_2015_RScript.R

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

nvd2015 <- xmlParse(file = "nvdcve-2.0-2015.xml")
summary(nvd2015)

nvd2015List <- xmlToList(nvd2015)
nvd2015List
dataNVD2015 <- ldply(.data = nvd2015List, data.frame)

cveID2015 <- dataNVD2015$cve.id
cveID2015
cveID2015DataFrame <- ldply(cveID2015, data.frame)
colnames(cveID2015DataFrame) <- "CVE_ID"

summary2015 <- dataNVD2015$summary
summary2015
summary2015DataFrame <- ldply(summary2015, data.frame)
colnames(summary2015DataFrame) <- "Vulnerability_Summary"

publishedDateTime2015 <- dataNVD2015$published.datetime
publishedDateTime2015
#----------Vulnerability_Published_Date----------#
publishedDate2015 <- anydate(publishedDateTime2015)
publishedDate2015DataFrame <- ldply(publishedDate2015, data.frame)
colnames(publishedDate2015DataFrame) <- "Vulnerability_Published_Date"
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2015 <- iso8601(anytime(publishedDateTime2015, tz = "UTC"))
publishedTime2015
#http://rfunction.com/archives/1499
publishedTimeSplit2015 <- strsplit(publishedTime2015, " ") 
publishedTimeSplit2015
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2015 <- sapply(publishedTimeSplit2015, "[", 2)
publishedTimeSplitSecondElement2015
publishedTime2015DataFrame <- ldply(publishedTimeSplitSecondElement2015, data.frame)
colnames(publishedTime2015DataFrame) <- "Vulnerability_Published_Time"

lastModifiedDateTime2015 <- dataNVD2015$last.modified.datetime
lastModifiedDateTime2015
lastModifiedDate2015 <- anydate(lastModifiedDateTime2015)
lastModifiedDate2015DataFrame <- ldply(lastModifiedDate2015, data.frame)
colnames(lastModifiedDate2015DataFrame) <- "Vulnerability_Last_Modified_Date"

cvss2015 <- dataNVD2015$cvss.base_metrics.score
cvss2015
cvss2015DataFrame <- ldply(cvss2015, data.frame)
colnames(cvss2015DataFrame) <- "CVSS_Score"

cvssAccessVector2015 <- dataNVD2015$cvss.base_metrics.access.vector
cvssAccessVector2015
cvssAccessVector2015DataFrame <- ldply(cvssAccessVector2015, data.frame)
colnames(cvssAccessVector2015DataFrame) <- "CVSS_Access_Vector"

cvssAccessComplexity2015 <- dataNVD2015$cvss.base_metrics.access.complexity
cvssAccessComplexity2015
cvssAccessComplexity2015DataFrame <- ldply(cvssAccessComplexity2015, data.frame)
colnames(cvssAccessComplexity2015DataFrame) <- "CVSS_Access_Complexity"

cvssAuthentication2015 <- dataNVD2015$cvss.base_metrics.authentication
cvssAuthentication2015
cvssAuthentication2015DataFrame <- ldply(cvssAuthentication2015, data.frame)
colnames(cvssAuthentication2015DataFrame) <- "CVSS_Authentication"

cvssConfidentialityImpact2015 <- dataNVD2015$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2015
cvssConfidentialityImpact2015DataFrame <- ldply(cvssConfidentialityImpact2015, data.frame)
colnames(cvssConfidentialityImpact2015DataFrame) <- "CVSS_Confidentiality_Impact"

cvssIntegrityImpact2015 <- dataNVD2015$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2015
cvssIntegrityImpact2015DataFrame <- ldply(cvssIntegrityImpact2015, data.frame)
colnames(cvssIntegrityImpact2015DataFrame) <- "CVSS_Integrity_Impact"

cvssAvailabilityImpact2015 <- dataNVD2015$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2015
cvssAvailabilityImpact2015DataFrame <- ldply(cvssAvailabilityImpact2015, data.frame)
colnames(cvssAvailabilityImpact2015DataFrame) <- "CVSS_Availability_Impact"

cvssGeneratedOnDateTime2015 <- dataNVD2015$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2015
cvssGeneratedOnDate2015 <- anydate(cvssGeneratedOnDateTime2015)
cvssGeneratedOnDate2015DataFrame <- ldply(cvssGeneratedOnDate2015, data.frame)
colnames(cvssGeneratedOnDate2015DataFrame) <- "CVSS_Generated_On_Date"

cwe2015 <- dataNVD2015$cwe
cwe2015
cwe2015DataFrame <- ldply(cwe2015, data.frame)
colnames(cwe2015DataFrame) <- "CWE"

nvd2015Total <- cbind(cveID2015DataFrame, summary2015DataFrame, 
											publishedDate2015DataFrame, lastModifiedDate2015DataFrame, 
											cvss2015DataFrame, cvssAccessVector2015DataFrame, cvssAccessComplexity2015DataFrame, 
											cvssAuthentication2015DataFrame, cvssConfidentialityImpact2015DataFrame, 
											cvssIntegrityImpact2015DataFrame, cvssAvailabilityImpact2015DataFrame, 
											cvssGeneratedOnDate2015DataFrame, cwe2015DataFrame)
nvd2015TotalDistinct <-distinct(nvd2015Total)

write.csv(nvd2015TotalDistinct, "CVE_2015.csv")
