#[1]
#NVD_2017_Updated_VSPL_RScript.R

#[Memory]
#https://support.rstudio.com/hc/en-us/community/posts/115000475648-Memory-limit
memory.limit()
memory.size(15000)

#[2]
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("Hmisc")

library(plyr)
library(dplyr)
library(Hmisc)

#[Vulnerability Software Product List]
#install.packages("tm")
library(tm)

#https://nmap.org/book/output-formats-cpe.html
#'a' - applications
#'h' - hardware platforms
#'o' - operating systems 
stopWords <- c("cpe:/a:", "cpe:/h:", "cpe:/o:")

productType2017 <- dataNVD2017Updated$vulnerable.software.list.product
productType2017 <- as.character(productType2017)
productType2017
productType2017 <- strsplit(productType2017, ":")
productType2017
productType2017 <- sapply(productType2017, "[", 2)
productType2017
productType2017DataFrame <- ldply(productType2017, data.frame)
colnames(productType2017DataFrame) <- "Product_Type"
View(productType2017DataFrame)
#https://nvd.nist.gov/scap/docs/2008-conf-presentations/day2/SCAP-Conference-CPE-Presentation.pdf
levels(productType2017DataFrame$Product_Type)[levels(productType2017DataFrame$Product_Type) == "/a"] <- "Application"
levels(productType2017DataFrame$Product_Type)[levels(productType2017DataFrame$Product_Type) == "/h"] <- "Hardware Platform"
levels(productType2017DataFrame$Product_Type)[levels(productType2017DataFrame$Product_Type) == "/o"] <- "Operating System"
View(productType2017DataFrame)

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

vulnerabilitySoftwareListProduct2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product, data.frame)
colnames(vulnerabilitySoftwareListProduct2017DataFrame) <- "Vulnerability_Software_List_Product"
View(vulnerabilitySoftwareListProduct2017DataFrame)

vulnerabilitySoftwareListProduct_1_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.1, data.frame)
colnames(vulnerabilitySoftwareListProduct_1_2017DataFrame) <- "Vulnerability_Software_List_Product_1"
View(vulnerabilitySoftwareListProduct_1_2017DataFrame)

vulnerabilitySoftwareListProduct_2_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.2, data.frame)
colnames(vulnerabilitySoftwareListProduct_2_2017DataFrame) <- "Vulnerability_Software_List_Product_2"
View(vulnerabilitySoftwareListProduct_2_2017DataFrame)

vulnerabilitySoftwareListProduct_3_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.3, data.frame)
colnames(vulnerabilitySoftwareListProduct_3_2017DataFrame) <- "Vulnerability_Software_List_Product_3"
View(vulnerabilitySoftwareListProduct_3_2017DataFrame)

vulnerabilitySoftwareListProduct_4_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.4, data.frame)
colnames(vulnerabilitySoftwareListProduct_4_2017DataFrame) <- "Vulnerability_Software_List_Product_4"
View(vulnerabilitySoftwareListProduct_4_2017DataFrame)

vulnerabilitySoftwareListProduct_5_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.5, data.frame)
colnames(vulnerabilitySoftwareListProduct_5_2017DataFrame) <- "Vulnerability_Software_List_Product_5"
View(vulnerabilitySoftwareListProduct_5_2017DataFrame)

vulnerabilitySoftwareListProduct_6_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.6, data.frame)
colnames(vulnerabilitySoftwareListProduct_6_2017DataFrame) <- "Vulnerability_Software_List_Product_6"
View(vulnerabilitySoftwareListProduct_6_2017DataFrame)

vulnerabilitySoftwareListProduct_7_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.7, data.frame)
colnames(vulnerabilitySoftwareListProduct_7_2017DataFrame) <- "Vulnerability_Software_List_Product_7"
View(vulnerabilitySoftwareListProduct_7_2017DataFrame)

vulnerabilitySoftwareListProduct_8_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.8, data.frame)
colnames(vulnerabilitySoftwareListProduct_8_2017DataFrame) <- "Vulnerability_Software_List_Product_8"
View(vulnerabilitySoftwareListProduct_8_2017DataFrame)

vulnerabilitySoftwareListProduct_9_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.9, data.frame)
colnames(vulnerabilitySoftwareListProduct_9_2017DataFrame) <- "Vulnerability_Software_List_Product_9"
View(vulnerabilitySoftwareListProduct_9_2017DataFrame)

vulnerabilitySoftwareListProduct_10_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.10, data.frame)
colnames(vulnerabilitySoftwareListProduct_10_2017DataFrame) <- "Vulnerability_Software_List_Product_10"
View(vulnerabilitySoftwareListProduct_10_2017DataFrame)

vulnerabilitySoftwareListProduct_11_2017DataFrame <- ldply(dataNVD2017Updated$vulnerable.software.list.product.23, data.frame)
colnames(vulnerabilitySoftwareListProduct_11_2017DataFrame) <- "Vulnerability_Software_List_Product_11"
View(vulnerabilitySoftwareListProduct_11_2017DataFrame)

nvd2017vulnerabilitySoftwareProductList <- cbind(cveID2017UpdatedDataFrame, vulnerabilitySoftwareListProduct2017DataFrame,
																								 vulnerabilitySoftwareListProduct_1_2017DataFrame, vulnerabilitySoftwareListProduct_2_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_3_2017DataFrame, vulnerabilitySoftwareListProduct_4_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_5_2017DataFrame, vulnerabilitySoftwareListProduct_6_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_7_2017DataFrame, vulnerabilitySoftwareListProduct_8_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_9_2017DataFrame, vulnerabilitySoftwareListProduct_10_2017DataFrame,
																								 vulnerabilitySoftwareListProduct_11_2017DataFrame)

nvd2017vulnerabilitySoftwareProductListDistinct <- distinct(nvd2017vulnerabilitySoftwareProductList)
View(nvd2017vulnerabilitySoftwareProductListDistinct)

#Test Modified Data Frame
TESTnvd2017VSPL <- cbind(cveID2017UpdatedDataFrame, productType2017DataFrame, vulnerabilitySoftwareListProduct2017DataFrame)
TESTnvd2017VSPL <- distinct(TESTnvd2017VSPL)
View(TESTnvd2017VSPL)
rm(TESTnvd2017VSPL)
