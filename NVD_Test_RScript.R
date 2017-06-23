#NVD_Test_RScript.R

#URLs
#https://www.tutorialspoint.com/r/r_xml_files.htm
#https://cran.r-project.org/web/packages/XML/XML.pdf
#https://stackoverflow.com/questions/4227223/r-list-to-data-frame
#https://stackoverflow.com/questions/27594541/export-a-list-into-a-csv-or-txt-file-in-r
#https://stackoverflow.com/questions/5746599/r-dataframe-naming-the-headers
#http://rpubs.com/jsmanij/131030
#http://www.statmethods.net/management/merging.html
#https://stackoverflow.com/questions/10358680/adding-a-one-dataframe-to-the-the-end-of-another-data-frame-in-r
#http://www.sthda.com/english/wiki/identifying-and-removing-duplicate-data-in-r
#https://stackoverflow.com/questions/13456241/convert-unix-epoch-to-date-object-in-r
#http://rprogramming.net/write-csv-in-r/
#https://stackoverflow.com/questions/26147558/arguments-imply-differing-number-of-rows-8-20


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
