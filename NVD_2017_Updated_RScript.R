#[1]
#NVD_2017_Updated_RScript.R

#[2]
#install.packages("XML")
#install.packages("methods")
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("anytime")

library(XML)
library(methods)
library(plyr)
library(dplyr)
library(anytime)

#[3]
nvd2017Updated <- xmlParse(file = "nvdcve-2.0-2017-updated.xml")
summary(nvd2017Updated)

#[4]
nvd2017UpdatedList <- xmlToList(nvd2017Updated)
nvd2017UpdatedList
dataNVD2017Updated <- ldply(.data = nvd2017UpdatedList, data.frame)

#[5]
cveID2017Updated <- dataNVD2017Updated$cve.id
cveID2017Updated
cveID2017UpdatedDataFrame <- ldply(cveID2017Updated, data.frame)
colnames(cveID2017UpdatedDataFrame) <- "CVE_ID"

#[6]
summary2017Updated <- dataNVD2017Updated$summary
summary2017Updated
summary2017UpdatedDataFrame <- ldply(summary2017Updated, data.frame)
colnames(summary2017UpdatedDataFrame) <- "Vulnerability_Summary"

#[7]
publishedDateTime2017Updated <- dataNVD2017Updated$published.datetime
publishedDateTime2017Updated
#----------Vulnerability_Published_Date----------#
publishedDate2017Updated <- anydate(publishedDateTime2017Updated) #Published Date 2017
publishedDate2017Updated
publishedDate2017UpdatedDataFrame <- ldply(publishedDate2017Updated, data.frame)
colnames(publishedDate2017UpdatedDataFrame) <- "Vulnerability_Published_Date"
