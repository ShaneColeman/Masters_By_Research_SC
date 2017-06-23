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
