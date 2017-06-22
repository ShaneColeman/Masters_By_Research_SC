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
