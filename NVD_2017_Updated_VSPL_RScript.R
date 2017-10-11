#[1]
#NVD_2017_Updated_VSPL_RScript.R

#[Memory]
#https://support.rstudio.com/hc/en-us/community/posts/115000475648-Memory-limit
memory.size()
memory.limit()
memory.size(15000)

#[2]
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("Hmisc")
#install.packages("qdap")
#install.packages("tm")

library(plyr)
library(dplyr)
library(Hmisc)
#library(qdap)
library(tm)


#-----FIRST-----#
vulnerabilitySoftwareListProduct_1_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product, data.frame)
colnames(vulnerabilitySoftwareListProduct_1_2017DataFrame) <- "Vulnerability_Software_List_Product_1"
View(vulnerabilitySoftwareListProduct_1_2017DataFrame)

vulnerabilitySoftwareListProduct_2_2017DataFrame <- ldply(dataNVD2017Updated$product, data.frame)
colnames(vulnerabilitySoftwareListProduct_2_2017DataFrame) <- "Vulnerability_Software_List_Product_2"
View(vulnerabilitySoftwareListProduct_2_2017DataFrame)

VSPL1_2_2017DataFrame <- cbind(vulnerabilitySoftwareListProduct_1_2017DataFrame, 
															 vulnerabilitySoftwareListProduct_2_2017DataFrame)
View(VSPL1_2_2017DataFrame)
VSPL1_2_2017DataFrame["Vulnerability_Software_List_Product"] <- NA
VSPL1_2_2017DataFrame$Vulnerability_Software_List_Product <- paste(VSPL1_2_2017DataFrame$Vulnerability_Software_List_Product_1, 
																																	 VSPL1_2_2017DataFrame$Vulnerability_Software_List_Product_2, 
																																	 sep = " ")
View(VSPL1_2_2017DataFrame)

VSPL2017CombinedDataFrame <- VSPL1_2_2017DataFrame[3]
View(VSPL2017CombinedDataFrame)

CVEID_VSPL2017DataFrame <- cbind(cveID2017UpdatedDataFrame, VSPL2017CombinedDataFrame)
View(CVEID_VSPL2017DataFrame)

CVEID_VSPL2017DataFrame$Vulnerability_Software_List_Product <- 
	removeWords(CVEID_VSPL2017DataFrame$Vulnerability_Software_List_Product, "NA")
View(CVEID_VSPL2017DataFrame)

CVEID_VSPL2017DataFrame <- distinct(CVEID_VSPL2017DataFrame)
View(CVEID_VSPL2017DataFrame)
#-----FIRST-----#

#-----SECOND (CPE PART)-----#
#[Vulnerability Software Product List]
#https://nmap.org/book/output-formats-cpe.html
#'a' - applications
#'h' - hardware platforms
#'o' - operating systems 
stopWords <- c("cpe:/a:", "cpe:/h:", "cpe:/o:")

vspl2017 <- CVEID_VSPL2017DataFrame$Vulnerability_Software_List_Product
vspl2017
vspl2017 <- as.character(vspl2017)
vspl2017
vspl2017 <- strsplit(vspl2017, ":")
vspl2017
cpePart2017 <- sapply(vspl2017, "[", 2)
cpePart2017
cpePart2017DataFrame <- ldply(cpePart2017, data.frame)
colnames(cpePart2017DataFrame) <- "CPE_Part"
View(cpePart2017DataFrame)

#https://nvd.nist.gov/scap/docs/2008-conf-presentations/day2/SCAP-Conference-CPE-Presentation.pdf
levels(cpePart2017DataFrame$CPE_Part)[levels(cpePart2017DataFrame$CPE_Part) == "/a"] <- "Application"
levels(cpePart2017DataFrame$CPE_Part)[levels(cpePart2017DataFrame$CPE_Part) == "/h"] <- "Hardware Platform"
levels(cpePart2017DataFrame$CPE_Part)[levels(cpePart2017DataFrame$CPE_Part) == "/o"] <- "Operating System"
View(cpePart2017DataFrame)
#-----SECOND (CPE PART)-----#

#-----THIRD (CPE VENDOR)-----#
vendor2017 <- sapply(vspl2017, "[", 3)
vendor2017
vendor2017DataFrame <- ldply(vendor2017, data.frame)
colnames(vendor2017DataFrame) <- "CPE_Vendor"
View(vendor2017DataFrame)

cpeVendor2017DataFrame <- vendor2017DataFrame$CPE_Vendor
cpeVendor2017DataFrame
cpeVendor2017DataFrame <- as.character(cpeVendor2017DataFrame)
cpeVendor2017DataFrame
cpeVendor2017DataFrame <- capitalize(cpeVendor2017DataFrame)
cpeVendor2017DataFrame
cpeVendor2017DataFrame <- as.data.frame(cpeVendor2017DataFrame)
colnames(cpeVendor2017DataFrame) <- "CPE_Vendor"
View(cpeVendor2017DataFrame)
#-----THIRD (CPE VENDOR)-----#

#-----FOURTH (CPE PRODUCT)-----#
product2017 <- sapply(vspl2017, "[", 4)
product2017
product2017DataFrame <- ldply(product2017, data.frame)
colnames(product2017DataFrame) <- "CPE_Product"
View(product2017DataFrame)

cpeProduct2017DataFrame <- product2017DataFrame$CPE_Product
cpeProduct2017DataFrame
cpeProduct2017DataFrame <- as.character(cpeProduct2017DataFrame)
cpeProduct2017DataFrame
cpeProduct2017DataFrame <- capitalize(cpeProduct2017DataFrame)
cpeProduct2017DataFrame
cpeProduct2017DataFrame <- as.data.frame(cpeProduct2017DataFrame)
colnames(cpeProduct2017DataFrame) <- "CPE_Product"
View(cpeProduct2017DataFrame)
#-----FOURTH (CPE PRODUCT)-----#

#----------#
testVSPLDataFrame <- cbind(cveID2017UpdatedDataFrame, cpePart2017DataFrame, cpeVendor2017DataFrame,
													 cpeProduct2017DataFrame)
View(testVSPLDataFrame)
rm(testVSPLDataFrame)

testVSPLDataFrame <- distinct(testVSPLDataFrame)
View(testVSPLDataFrame)

testVSPLDataFrame <- testVSPLDataFrame[-nrow(testVSPLDataFrame),]
View(testVSPLDataFrame)
write.csv(testVSPLDataFrame, "VSPL_2017_Updated.csv", row.names = FALSE)

summary(testVSPLDataFrame)

summary(cpePart2017DataFrame$CPE_Part)
summary(cpeVendor2017DataFrame$CPE_Vendor)
summary(cpeProduct2017DataFrame$CPE_Product)
#----------#



#----------#
#vulnerabilitySoftwareListProduct2017 <- dataNVD2017Updated$vulnerable.software.list.product
#vulnerabilitySoftwareListProduct2017
vulnerabilitySoftwareListProduct2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product, data.frame)
colnames(vulnerabilitySoftwareListProduct2017DataFrame) <- "Vulnerability_Software_List_Product"
View(vulnerabilitySoftwareListProduct2017DataFrame)
vulnerabilitySoftwareListProduct2017DataFrame <- vulnerabilitySoftwareListProduct2017DataFrame$Vulnerability_Software_List_Product
str(vulnerabilitySoftwareListProduct2017DataFrame)
vulnerabilitySoftwareListProduct2017DataFrame <- as.character(vulnerabilitySoftwareListProduct2017DataFrame)
str(vulnerabilitySoftwareListProduct2017DataFrame)
vulnerabilitySoftwareListProduct2017DataFrame <- removeWords(vulnerabilitySoftwareListProduct2017DataFrame, stopWords)
str(vulnerabilitySoftwareListProduct2017DataFrame)
vulnerabilitySoftwareListProduct2017DataFrame <- strsplit(vulnerabilitySoftwareListProduct2017DataFrame, ":")
vulnerabilitySoftwareListProduct2017DataFrame
vulnerabilitySoftwareListProduct2017DataFrame <- sapply(vulnerabilitySoftwareListProduct2017DataFrame, "[", 1)
vulnerabilitySoftwareListProduct2017DataFrame
vulnerabilitySoftwareListProduct2017DataFrame <- capitalize(vulnerabilitySoftwareListProduct2017DataFrame)
vulnerabilitySoftwareListProduct2017DataFrame
vulnerabilitySoftwareListProduct2017DataFrame <- as.data.frame(vulnerabilitySoftwareListProduct2017DataFrame)
colnames(vulnerabilitySoftwareListProduct2017DataFrame) <- "Vulnerability_Software_List_Product"
View(vulnerabilitySoftwareListProduct2017DataFrame)
rm(vulnerabilitySoftwareListProduct2017DataFrame)
#----------#



#----------#
vulnerabilitySoftwareListProduct_3_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.1, data.frame)
colnames(vulnerabilitySoftwareListProduct_3_2017DataFrame) <- "Vulnerability_Software_List_Product_3"
View(vulnerabilitySoftwareListProduct_3_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_3_2017DataFrame)

vulnerabilitySoftwareListProduct_2_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.2, data.frame)
colnames(vulnerabilitySoftwareListProduct_2_2017DataFrame) <- "Vulnerability_Software_List_Product_2"
View(vulnerabilitySoftwareListProduct_2_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_2_2017DataFrame)

vulnerabilitySoftwareListProduct_3_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.3, data.frame)
colnames(vulnerabilitySoftwareListProduct_3_2017DataFrame) <- "Vulnerability_Software_List_Product_3"
View(vulnerabilitySoftwareListProduct_3_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_3_2017DataFrame)

vulnerabilitySoftwareListProduct_4_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.4, data.frame)
colnames(vulnerabilitySoftwareListProduct_4_2017DataFrame) <- "Vulnerability_Software_List_Product_4"
View(vulnerabilitySoftwareListProduct_4_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_4_2017DataFrame)

vulnerabilitySoftwareListProduct_5_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.5, data.frame)
colnames(vulnerabilitySoftwareListProduct_5_2017DataFrame) <- "Vulnerability_Software_List_Product_5"
View(vulnerabilitySoftwareListProduct_5_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_5_2017DataFrame)

vulnerabilitySoftwareListProduct_6_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.6, data.frame)
colnames(vulnerabilitySoftwareListProduct_6_2017DataFrame) <- "Vulnerability_Software_List_Product_6"
View(vulnerabilitySoftwareListProduct_6_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_6_2017DataFrame)

vulnerabilitySoftwareListProduct_7_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.7, data.frame)
colnames(vulnerabilitySoftwareListProduct_7_2017DataFrame) <- "Vulnerability_Software_List_Product_7"
View(vulnerabilitySoftwareListProduct_7_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_7_2017DataFrame)

vulnerabilitySoftwareListProduct_8_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.8, data.frame)
colnames(vulnerabilitySoftwareListProduct_8_2017DataFrame) <- "Vulnerability_Software_List_Product_8"
View(vulnerabilitySoftwareListProduct_8_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_8_2017DataFrame)

vulnerabilitySoftwareListProduct_9_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.9, data.frame)
colnames(vulnerabilitySoftwareListProduct_9_2017DataFrame) <- "Vulnerability_Software_List_Product_9"
View(vulnerabilitySoftwareListProduct_9_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_9_2017DataFrame)

vulnerabilitySoftwareListProduct_10_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.10, data.frame)
colnames(vulnerabilitySoftwareListProduct_10_2017DataFrame) <- "Vulnerability_Software_List_Product_10"
View(vulnerabilitySoftwareListProduct_10_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_10_2017DataFrame)

vulnerabilitySoftwareListProduct_11_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.11, data.frame)
colnames(vulnerabilitySoftwareListProduct_11_2017DataFrame) <- "Vulnerability_Software_List_Product_11"
View(vulnerabilitySoftwareListProduct_11_2017DataFrame)
rm(vulnerabilitySoftwareListProduct_11_2017DataFrame)

nvd2017vulnerabilitySoftwareProductList <- cbind(cveID2017UpdatedDataFrame, vulnerabilitySoftwareListProduct2017DataFrame,
																								 vulnerabilitySoftwareListProduct_1_2017DataFrame, vulnerabilitySoftwareListProduct_2_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_3_2017DataFrame, vulnerabilitySoftwareListProduct_4_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_5_2017DataFrame, vulnerabilitySoftwareListProduct_6_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_7_2017DataFrame, vulnerabilitySoftwareListProduct_8_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_9_2017DataFrame, vulnerabilitySoftwareListProduct_10_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_11_2017DataFrame)
rm(nvd2017vulnerabilitySoftwareProductList)

nvd2017vulnerabilitySoftwareProductListDistinct <- distinct(nvd2017vulnerabilitySoftwareProductList)
View(nvd2017vulnerabilitySoftwareProductListDistinct)
rm(nvd2017vulnerabilitySoftwareProductListDistinct)
#----------#

#Test Modified Data Frame
TESTnvd2017VSPL <- cbind(cveID2017UpdatedDataFrame, productType2017DataFrame, vulnerabilitySoftwareListProduct2017DataFrame)
TESTnvd2017VSPL <- distinct(TESTnvd2017VSPL)
View(TESTnvd2017VSPL)
rm(TESTnvd2017VSPL)
