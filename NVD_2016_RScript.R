#NVD_2016_RScript.R

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

nvd2016 <- xmlParse(file = "nvdcve-2.0-2016.xml")
summary(nvd2016)

nvd2016List <- xmlToList(nvd2016)
nvd2016List
dataNVD2016 <- ldply(.data = nvd2016List, data.frame)

cveID2016 <- dataNVD2016$cve.id
cveID2016
cveID2016DataFrame <- ldply(cveID2016, data.frame)
colnames(cveID2016DataFrame) <- "CVE_ID"

summary2016 <- dataNVD2016$summary
summary2016
summary2016DataFrame <- ldply(summary2016, data.frame)
colnames(summary2016DataFrame) <- "Vulnerability_Summary"

publishedDateTime2016 <- dataNVD2016$published.datetime
publishedDateTime2016
#----------Vulnerability_Published_Date----------#
publishedDate2016 <- anydate(publishedDateTime2016)
publishedDate2016DataFrame <- ldply(publishedDate2016, data.frame)
colnames(publishedDate2016DataFrame) <- "Vulnerability_Published_Date"
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2016 <- iso8601(anytime(publishedDateTime2016, tz = "UTC"))
publishedTime2016
#http://rfunction.com/archives/1499
publishedTimeSplit2016 <- strsplit(publishedTime2016, " ") 
publishedTimeSplit2016
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2016 <- sapply(publishedTimeSplit2016, "[", 2)
publishedTimeSplitSecondElement2016
publishedTime2016DataFrame <- ldply(publishedTimeSplitSecondElement2016, data.frame)
colnames(publishedTime2016DataFrame) <- "Vulnerability_Published_Time"

lastModifiedDateTime2016 <- dataNVD2016$last.modified.datetime
lastModifiedDateTime2016
lastModifiedDate2016 <- anydate(lastModifiedDateTime2016)
lastModifiedDate2016DataFrame <- ldply(lastModifiedDate2016, data.frame)
colnames(lastModifiedDate2016DataFrame) <- "Vulnerability_Last_Modified_Date"

cvss2016 <- dataNVD2016$cvss.base_metrics.score
cvss2016
cvss2016DataFrame <- ldply(cvss2016, data.frame)
colnames(cvss2016DataFrame) <- "CVSS_Score"

cvssAccessVector2016 <- dataNVD2016$cvss.base_metrics.access.vector
cvssAccessVector2016
cvssAccessVector2016DataFrame <- ldply(cvssAccessVector2016, data.frame)
colnames(cvssAccessVector2016DataFrame) <- "CVSS_Access_Vector"

cvssAccessComplexity2016 <- dataNVD2016$cvss.base_metrics.access.complexity
cvssAccessComplexity2016
cvssAccessComplexity2016DataFrame <- ldply(cvssAccessComplexity2016, data.frame)
colnames(cvssAccessComplexity2016DataFrame) <- "CVSS_Access_Complexity"

cvssAuthentication2016 <- dataNVD2016$cvss.base_metrics.authentication
cvssAuthentication2016
cvssAuthentication2016DataFrame <- ldply(cvssAuthentication2016, data.frame)
colnames(cvssAuthentication2016DataFrame) <- "CVSS_Authentication"

cvssConfidentialityImpact2016 <- dataNVD2016$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2016
cvssConfidentialityImpact2016DataFrame <- ldply(cvssConfidentialityImpact2016, data.frame)
colnames(cvssConfidentialityImpact2016DataFrame) <- "CVSS_Confidentiality_Impact"

cvssIntegrityImpact2016 <- dataNVD2016$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2016
cvssIntegrityImpact2016DataFrame <- ldply(cvssIntegrityImpact2016, data.frame)
colnames(cvssIntegrityImpact2016DataFrame) <- "CVSS_Integrity_Impact"

cvssAvailabilityImpact2016 <- dataNVD2016$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2016
cvssAvailabilityImpact2016DataFrame <- ldply(cvssAvailabilityImpact2016, data.frame)
colnames(cvssAvailabilityImpact2016DataFrame) <- "CVSS_Availability_Impact"

cvssGeneratedOnDateTime2016 <- dataNVD2016$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2016
cvssGeneratedOnDate2016 <- anydate(cvssGeneratedOnDateTime2016)
cvssGeneratedOnDate2016DataFrame <- ldply(cvssGeneratedOnDate2016, data.frame)
colnames(cvssGeneratedOnDate2016DataFrame) <- "CVSS_Generated_On_Date"

cwe2016 <- dataNVD2016$cwe
cwe2016
cwe2016DataFrame <- ldply(cwe2016, data.frame)
colnames(cwe2016DataFrame) <- "CWE"

nvd2016Total <- cbind(cveID2016DataFrame, summary2016DataFrame, 
											publishedDate2016DataFrame, publishedTime2016DataFrame, lastModifiedDate2016DataFrame, 
											cvss2016DataFrame, cvssAccessVector2016DataFrame, cvssAccessComplexity2016DataFrame, 
											cvssAuthentication2016DataFrame, cvssConfidentialityImpact2016DataFrame, 
											cvssIntegrityImpact2016DataFrame, cvssAvailabilityImpact2016DataFrame, 
											cvssGeneratedOnDate2016DataFrame, cwe2016DataFrame)
nvd2016TotalDistinct <-distinct(nvd2016Total)

#http://www.duanqu.tech/questions/4900348/how-to-remove-rows-in-a-dataframe-that-contain-certain-words-in-r
nvd2016TotalDistinctRejectRemoved <- nvd2016TotalDistinct[!grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2016TotalDistinct$Vulnerability_Summary), ]

write.csv(nvd2016TotalDistinct, "CVE_2016.csv")
