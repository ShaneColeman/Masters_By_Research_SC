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
colnames(cveID2017DataFrame) <- "CVE_ID"

summary2016 <- dataNVD2016$summary
summary2016
summary2016DataFrame <- ldply(summary2016, data.frame)
colnames(summary2016DataFrame) <- "Vulnerability_Summary"

publishedDateTime2016 <- dataNVD2016$published.datetime
publishedDateTime2016
publishedDate2016 <- anydate(publishedDateTime2016)
publishedDate2016DataFrame <- ldply(publishedDate2016, data.frame)
colnames(publishedDate2016DataFrame) <- "Vulnerability_Published_Date"

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
