#NVD_2016_RScript.R

install.packages("XML")
library(XML)

install.packages("methods")
library(methods)

nvd2016 <- xmlParse(file = "nvdcve-2.0-2016.xml")
summary(nvd2016)

nvd2016DataFrame <- xmlToDataFrame(nvd2016)
cveID <- nvd2016DataFrame$entry$`last-modified-datetime`
cveID
df <- data.frame(matrix(unlist(nvd2016DataFrame), nrow = 65, byrow = T), stringsAsFactors = FALSE, header = TRUE)
capture.output(print(nvd2016DataFrame), file = "test.txt")
#df1 <- do.call(rbind, lapply(nvd2016DataFrame, data.frame, stringsAsFactors = FALSE	))

#library(plyr)
#df1 <- ldply(nvd2016DataFrame, data.frame)

#------------------------

#http://rpubs.com/jsmanij/131030

library(XML)
library(plyr)

nvdRecent <- xmlParse(file = "nvdcve-2.0-recent.xml")
summary(nvdRecent)

nvdRecentList <- xmlToList(nvdRecent)
nvdRecentList
dataNVDRecent <- ldply(nvdRecentList, data.frame)
cveID <- dataNVDRecent$cve.id
cveIDDataFrame <- ldply(cveID,data.frame)

nvd2016List <- xmlToList(nvd2016)
dataNVD <- ldply(nvd2016List, data.frame)
