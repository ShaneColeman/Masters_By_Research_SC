#NVD_2013_RScript.R -TO AMMEND (Test Code)

install.packages("XML")
install.packages("methods")
install.packages("plyr")
install.packages("dplyr")
install.packages("anytime")

#install.packages("stringi")
#install.packages("data.table")
#install.packages("reshape2")

library(XML)
library(methods)
library(plyr)
library(dplyr)
library(anytime)

library(stringi)
#library(data.table)
#library(reshape2)

nvd2013 <- xmlParse(file = "nvdcve-2.0-2013.xml")
summary(nvd2013)

nvd2013List <- xmlToList(nvd2013)
nvd2013List
dataNVD2013 <- ldply(.data = nvd2013List, data.frame)

cveID2013 <- dataNVD2013$.id
cveID2013
cveID2014DataFrame <- ldply(cveID2014, data.frame)
colnames(cveID2014DataFrame) <- "CVE_ID"