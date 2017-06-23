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
publishedDate2014 <- anydate(publishedDateTime2014)
publishedDate2014DataFrame <- ldply(publishedDate2014, data.frame)
colnames(publishedDate2014DataFrame) <- "Vulnerability_Published_Date"

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
