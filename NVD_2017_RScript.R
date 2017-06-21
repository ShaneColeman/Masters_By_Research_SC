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
