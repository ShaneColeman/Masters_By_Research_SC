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
