#NVD_2017_RScript.R

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

nvd2017 <- xmlParse(file = "nvdcve-2.0-2017.xml")
summary(nvd2017)

nvd2017List <- xmlToList(nvd2017)
nvd2017List
dataNVD2017 <- ldply(.data = nvd2017List, data.frame)

cveID2017 <- dataNVD2017$cve.id
cveID2017
cveID2017DataFrame <- ldply(cveID2017, data.frame)
colnames(cveID2017DataFrame) <- "CVE_ID"

summary2017 <- dataNVD2017$summary
summary2017
summary2017DataFrame <- ldply(summary2017, data.frame)
colnames(summary2017DataFrame) <- "Vulnerability_Summary"

publishedDateTime2017 <- dataNVD2017$published.datetime
publishedDateTime2017
publishedDate2017 <- anydate(publishedDateTime2017)
publishedDate2017DataFrame <- ldply(publishedDate2017, data.frame)
colnames(publishedDate2017DataFrame) <- "Vulnerability_Published_Date"

lastModifiedDateTime2017 <- dataNVD2017$last.modified.datetime
lastModifiedDateTime2017
lastModifiedDate2017 <- anydate(lastModifiedDateTime2017)
lastModifiedDate2017DataFrame <- ldply(lastModifiedDate2017, data.frame)
colnames(lastModifiedDate2017DataFrame) <- "Vulnerability_Last_Modified_Date"

cvss2017 <- dataNVD2017$cvss.base_metrics.score
cvss2017
cvss2017DataFrame <- ldply(cvss2017, data.frame)
colnames(cvss2017DataFrame) <- "CVSS_Score"

cvssAccessVector2017 <- dataNVD2017$cvss.base_metrics.access.vector
cvssAccessVector2017
cvssAccessVector2017DataFrame <- ldply(cvssAccessVector2017, data.frame)
colnames(cvssAccessVector2017DataFrame) <- "CVSS_Access_Vector"

cvssAccessComplexity2017 <- dataNVD2017$cvss.base_metrics.access.complexity
cvssAccessComplexity2017
cvssAccessComplexity2017DataFrame <- ldply(cvssAccessComplexity2017, data.frame)
colnames(cvssAccessComplexity2017DataFrame) <- "CVSS_Access_Complexity"

cvssAuthentication2017 <- dataNVD2017$cvss.base_metrics.authentication
cvssAuthentication2017
cvssAuthentication2017DataFrame <- ldply(cvssAuthentication2017, data.frame)
colnames(cvssAuthentication2017DataFrame) <- "CVSS_Authentication"

cvssConfidentialityImpact2017 <- dataNVD2017$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2017
cvssConfidentialityImpact2017DataFrame <- ldply(cvssConfidentialityImpact2017, data.frame)
colnames(cvssConfidentialityImpact2017DataFrame) <- "CVSS_Confidentiality_Impact"

cvssIntegrityImpact2017 <- dataNVD2017$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2017
cvssIntegrityImpact2017DataFrame <- ldply(cvssIntegrityImpact2017, data.frame)
colnames(cvssIntegrityImpact2017DataFrame) <- "CVSS_Integrity_Impact"

cvssAvailabilityImpact2017 <- dataNVD2017$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2017
cvssAvailabilityImpact2017DataFrame <- ldply(cvssAvailabilityImpact2017, data.frame)
colnames(cvssAvailabilityImpact2017DataFrame) <- "CVSS_Availability_Impact"

cvssGeneratedOnDateTime2017 <- dataNVD2017$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2017
cvssGeneratedOnDate2017 <- anydate(cvssGeneratedOnDateTime2017)
cvssGeneratedOnDate2017DataFrame <- ldply(cvssGeneratedOnDate2017, data.frame)
colnames(cvssGeneratedOnDate2017DataFrame) <- "CVSS_Generated_On_Date"

cwe2017 <- dataNVD2017$cwe
cwe2017
cwe2017DataFrame <- ldply(cwe2017, data.frame)
colnames(cwe2017DataFrame) <- "CWE"

nvd2017Total <- cbind(cveID2017DataFrame, summary2017DataFrame, 
											publishedDate2017DataFrame, lastModifiedDate2017DataFrame, 
											cvss2017DataFrame, cvssAccessVector2017DataFrame, cvssAccessComplexity2017DataFrame, 
											cvssAuthentication2017DataFrame, cvssConfidentialityImpact2017DataFrame, 
											cvssIntegrityImpact2017DataFrame, cvssAvailabilityImpact2017DataFrame, 
											cvssGeneratedOnDate2017DataFrame, cwe2017DataFrame)
nvd2017TotalDistinct <-distinct(nvd2017Total)
