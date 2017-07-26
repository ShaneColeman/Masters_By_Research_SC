#[1]
#NVD_2016_Updated_RScript.R

#[2]***
#https://support.rstudio.com/hc/en-us/community/posts/115000475648-Memory-limit
memory.limit()
memory.size(15000)

#[2]
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

#[3]
nvd2016Updated <- xmlParse(file = "nvdcve-2.0-2016-updated.xml")
summary(nvd2016Updated)

#[4]
nvd2016UpdatedList <- xmlToList(nvd2016Updated)
nvd2016UpdatedList
dataNVD2016Updated <- ldply(.data = nvd2016UpdatedList, data.frame)

#[5]
cveID2016Updated <- dataNVD2016Updated$cve.id
cveID2016Updated
cveID2016UpdatedDataFrame <- ldply(cveID2016Updated, data.frame)
colnames(cveID2016UpdatedDataFrame) <- "CVE_ID"

#[6]
summary2016Updated <- dataNVD2016Updated$summary
summary2016Updated
summary2016UpdatedDataFrame <- ldply(summary2016Updated, data.frame)
colnames(summary2016UpdatedDataFrame) <- "Vulnerability_Summary"

#[7]
publishedDateTime2016Updated <- dataNVD2016Updated$published.datetime
publishedDateTime2016Updated
#----------Vulnerability_Published_Date----------#
publishedDate2016Updated <- anydate(publishedDateTime2016Updated) #Published Date 2017
publishedDate2016Updated
publishedDate2016UpdatedDataFrame <- ldply(publishedDate2016Updated, data.frame)
colnames(publishedDate2016UpdatedDataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2016Updated <- iso8601(anytime(publishedDateTime2016Updated, tz = "UTC"))
publishedTime2016Updated
#http://rfunction.com/archives/1499
publishedTimeSplit2016Updated <- strsplit(publishedTime2016Updated, " ") 
publishedTimeSplit2016Updated
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2016Updated <- sapply(publishedTimeSplit2016Updated, "[", 2)
publishedTimeSplitSecondElement2016Updated
publishedTime2016UpdatedDataFrame <- ldply(publishedTimeSplitSecondElement2016Updated, data.frame)
colnames(publishedTime2016UpdatedDataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2016Updated <- dataNVD2016Updated$last.modified.datetime
lastModifiedDateTime2016Updated
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2016Updated <- anydate(lastModifiedDateTime2016Updated)
lastModifiedDate2016Updated
lastModifiedDate2016UpdatedDataFrame <- ldply(lastModifiedDate2016Updated, data.frame)
colnames(lastModifiedDate2016UpdatedDataFrame) <- "Vulnerability_Last_Modified_Date"
