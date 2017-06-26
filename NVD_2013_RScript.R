#NVD_2013_RScript.R -TO AMMEND (Test Code)

install.packages("XML")
install.packages("methods")
install.packages("plyr")
install.packages("dplyr")
install.packages("anytime")

#install.packages("xml2")
#install.packages("purrr")
#install.packages("broom")
#install.packages("stringi")
#install.packages("data.table")
#install.packages("reshape2")

library(XML)
library(methods)
library(plyr)
library(dplyr)
library(anytime)

#library(xml2)
#library(purrr)
#library(broom)
#library(stringi)
library(data.table)
#library(reshape2)

nvd2013 <- xmlParse(file = "nvdcve-2.0-2013.xml")
summary(nvd2013)

nvd2013List <- xmlToList(nvd2013)
nvd2013List
#dataNVD2013 <- ldply(.data = nvd2013List, data.frame)
dataNVD2013[1: length(nvd2013List$entry)] <- as.vector(nvd2013List$entry$"cve-id")
dataNVD2013

colnames(dataNVD2013) <- "CVE_ID"
#----------------------------------------------------------------------------------
#https://stackoverflow.com/questions/5424859/parsing-xml-to-list-in-r-how-to-consistently-access-nodes-when-xml-structure-va

xmlNVD2013 <- xmlTreeParse(file = "nvdcve-2.0-2013.xml", useInternalNodes = TRUE)

cveID2013 <- xpathApply(xmlNVD2013, "//vuln:cve-id", xmlValue)
cveID2013List <- as.list(cveID2013)
cveID2013DataFrame <- as.data.table(cveID2013List)
cveID2013DataFrameStack <- stack(cveID2013DataFrame)
colnames(cveID2013DataFrameStack) <- "CVE_ID"
rm(cveID2013DataFrame)

cvss2013 <- xpathApply(xmlNVD2013, "//cvss:score", xmlValue)
cvss2013List <- as.list(cvss2013)
cvss2013DataFrame <- as.data.table(cvss2013List)
cvss2013DataFrame[cvss2013DataFrame == 'NA'] <- "NA"
cvss2013DataFrameStack <- stack(cvss2013DataFrame)
#----------------------------------------------------------------------------------

#nvd2013List <- xmlToList(nvd2013)
#nvd2013List
#df <- data.frame(nvd2013List$entry$'cve-id'[[1 : length(nvd2013List)])
#dataNVD2013 <- ldply(.data = nvd2013List, data.frame)
#dataNVD2013 <- ldply(xmlToList("nvdcve-2.0-2013.xml"), data.frame)

