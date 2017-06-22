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

cvssAccessComplexity <- dataNVD2017$cvss.base_metrics.access.complexity
cvssAccessComplexity
cvssAccessComplexityDataFrame <- ldply(cvssAccessComplexity, data.frame)
colnames(cvssAccessComplexityDataFrame) <- "CVSS_Access_Complexity"
