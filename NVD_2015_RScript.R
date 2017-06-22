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
summary(nvd2016)

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
publishedDate2015 <- anydate(publishedDateTime2015)
publishedDate2015DataFrame <- ldply(publishedDate2015, data.frame)
colnames(publishedDate2015DataFrame) <- "Vulnerability_Published_Date"

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
