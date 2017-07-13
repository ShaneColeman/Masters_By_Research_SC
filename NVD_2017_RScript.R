#[1]
#NVD_2017_RScript.R

#[2]
#install.packages("XML")
#install.packages("methods")
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("anytime")
#----------#
#install.packages("stringr") - NOT REQUIRED
#install.packages("qdap") - NOT REQUIRED

library(XML)
library(methods)
library(plyr)
library(dplyr)
library(anytime)
#----------#
#library(stringr) - NOT REQUIRED
#library(qdap) - NOT REQUIRED

#[3]
nvd2017 <- xmlParse(file = "nvdcve-2.0-2017.xml")
summary(nvd2017)

#[4]
nvd2017List <- xmlToList(nvd2017)
nvd2017List
dataNVD2017 <- ldply(.data = nvd2017List, data.frame)

#[5]
cveID2017 <- dataNVD2017$cve.id
cveID2017
cveID2017DataFrame <- ldply(cveID2017, data.frame)
colnames(cveID2017DataFrame) <- "CVE_ID"

#[6]
summary2017 <- dataNVD2017$summary
summary2017
summary2017DataFrame <- ldply(summary2017, data.frame)
colnames(summary2017DataFrame) <- "Vulnerability_Summary"

#[7]
publishedDateTime2017 <- dataNVD2017$published.datetime
publishedDateTime2017
#----------Vulnerability_Published_Date----------#
publishedDate2017 <- anydate(publishedDateTime2017) #Published Date 2017
publishedDate2017
publishedDate2017DataFrame <- ldply(publishedDate2017, data.frame)
colnames(publishedDate2017DataFrame) <- "Vulnerability_Published_Date"

#[8]
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2017 <- iso8601(anytime(publishedDateTime2017, tz = "UTC"))
publishedTime2017
#http://rfunction.com/archives/1499
publishedTimeSplit2017 <- strsplit(publishedTime2017, " ") 
publishedTimeSplit2017
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2017 <- sapply(publishedTimeSplit2017, "[", 2)
publishedTimeSplitSecondElement2017
publishedTime2017DataFrame <- ldply(publishedTimeSplitSecondElement2017, data.frame)
colnames(publishedTime2017DataFrame) <- "Vulnerability_Published_Time"

#[9]
lastModifiedDateTime2017 <- dataNVD2017$last.modified.datetime
lastModifiedDateTime2017
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2017 <- anydate(lastModifiedDateTime2017)
lastModifiedDate2017
lastModifiedDate2017DataFrame <- ldply(lastModifiedDate2017, data.frame)
colnames(lastModifiedDate2017DataFrame) <- "Vulnerability_Last_Modified_Date"

#[10]
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2017 <- iso8601(anytime(lastModifiedDateTime2017, tz = "UTC"))
lastModifiedTime2017
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2017 <- strsplit(lastModifiedTime2017, " ") 
lastModifiedTimeSplit2017
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2017 <- sapply(lastModifiedTimeSplit2017, "[", 2)
lastModifiedTimeSplitSecondElement2017
lastModifiedTime2017DataFrame <- ldply(lastModifiedTimeSplitSecondElement2017, data.frame)
colnames(lastModifiedTime2017DataFrame) <- "Vulnerability_Last_Modified_Time"

#[11]
cvss2017 <- dataNVD2017$cvss.base_metrics.score
cvss2017
cvss2017DataFrame <- ldply(cvss2017, data.frame)
colnames(cvss2017DataFrame) <- "CVSS_Score"

#[12]
#https://nvd.nist.gov/vuln-metrics/cvss
cvssSeverity2017 <- dataNVD2017$cvss.base_metrics.score
cvssSeverity2017
cvssSeverity2017DataFrame <- ldply(cvssSeverity2017, data.frame)
colnames(cvssSeverity2017DataFrame) <- "CVSS_Severity"
str(cvssSeverity2017DataFrame)
View(cvssSeverity2017DataFrame)
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
levels(cvssSeverity2017DataFrame$CVSS_Severity)[levels(cvssSeverity2017DataFrame$CVSS_Severity) == "10.0"] <- "HIGH"
levels(cvssSeverity2017DataFrame$CVSS_Severity)[levels(cvssSeverity2017DataFrame$CVSS_Severity) >= 7.0 & 
																									levels(cvssSeverity2017DataFrame$CVSS_Severity) < 9.9] <- "HIGH"
levels(cvssSeverity2017DataFrame$CVSS_Severity)[levels(cvssSeverity2017DataFrame$CVSS_Severity) >= 4.0 & 
																									levels(cvssSeverity2017DataFrame$CVSS_Severity) <= 6.9] <- "MEDIUM"
levels(cvssSeverity2017DataFrame$CVSS_Severity)[levels(cvssSeverity2017DataFrame$CVSS_Severity) >= 0.0 & 
																									levels(cvssSeverity2017DataFrame$CVSS_Severity) <= 3.9] <- "LOW"
View(cvssSeverity2017DataFrame)

#[13]
cvssAccessVector2017 <- dataNVD2017$cvss.base_metrics.access.vector
cvssAccessVector2017
cvssAccessVector2017DataFrame <- ldply(cvssAccessVector2017, data.frame)
colnames(cvssAccessVector2017DataFrame) <- "CVSS_Access_Vector"

#[14]
cvssAccessComplexity2017 <- dataNVD2017$cvss.base_metrics.access.complexity
cvssAccessComplexity2017
cvssAccessComplexity2017DataFrame <- ldply(cvssAccessComplexity2017, data.frame)
colnames(cvssAccessComplexity2017DataFrame) <- "CVSS_Access_Complexity"

#[15]
cvssAuthentication2017 <- dataNVD2017$cvss.base_metrics.authentication
cvssAuthentication2017
cvssAuthentication2017DataFrame <- ldply(cvssAuthentication2017, data.frame)
colnames(cvssAuthentication2017DataFrame) <- "CVSS_Authentication"

#[16]
cvssConfidentialityImpact2017 <- dataNVD2017$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2017
cvssConfidentialityImpact2017DataFrame <- ldply(cvssConfidentialityImpact2017, data.frame)
colnames(cvssConfidentialityImpact2017DataFrame) <- "CVSS_Confidentiality_Impact"

#[17]
cvssIntegrityImpact2017 <- dataNVD2017$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2017
cvssIntegrityImpact2017DataFrame <- ldply(cvssIntegrityImpact2017, data.frame)
colnames(cvssIntegrityImpact2017DataFrame) <- "CVSS_Integrity_Impact"

#[18]
cvssAvailabilityImpact2017 <- dataNVD2017$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2017
cvssAvailabilityImpact2017DataFrame <- ldply(cvssAvailabilityImpact2017, data.frame)
colnames(cvssAvailabilityImpact2017DataFrame) <- "CVSS_Availability_Impact"

#[19]
cvssGeneratedOnDateTime2017 <- dataNVD2017$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2017
#----------CVSS_Generated_On_Date----------#
cvssGeneratedOnDate2017 <- anydate(cvssGeneratedOnDateTime2017)
cvssGeneratedOnDate2017DataFrame <- ldply(cvssGeneratedOnDate2017, data.frame)
colnames(cvssGeneratedOnDate2017DataFrame) <- "CVSS_Generated_On_Date"

#[20]
#----------CVSS_Generated_On_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
cvssGeneratedOnTime2017 <- iso8601(anytime(cvssGeneratedOnDateTime2017, tz = "UTC"))
cvssGeneratedOnTime2017
#http://rfunction.com/archives/1499
cvssGeneratedOnTimeSplit2017 <- strsplit(cvssGeneratedOnTime2017, " ") 
cvssGeneratedOnTimeSplit2017
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
cvssGeneratedOnTimeSplitSecondElement2017 <- sapply(cvssGeneratedOnTimeSplit2017, "[", 2)
cvssGeneratedOnTimeSplitSecondElement2017
cvssGeneratedOnTime2017DataFrame <- ldply(cvssGeneratedOnTimeSplitSecondElement2017, data.frame)
colnames(cvssGeneratedOnTime2017DataFrame) <- "CVSS_Generated_On_Time"

#cwe2017 <- dataNVD2017$cwe
#cwe2017
#cwe2017DataFrame <- ldply(cwe2017, data.frame)
#colnames(cwe2017DataFrame) <- "CWE_ID"

#[21]
cwe_1_2017 <- dataNVD2017$cwe
cwe_1_2017
cwe_1_2017DataFrame <- ldply(cwe_1_2017, data.frame)
colnames(cwe_1_2017DataFrame) <- "CWE_ID_1"

#[22]
cwe_1_Description2017 <- dataNVD2017$cwe
cwe_1_Description2017
cwe_1_Description2017DataFrame <- ldply(cwe_1_Description2017, data.frame)
colnames(cwe_1_Description2017DataFrame) <- "CWE_ID_1_Description"

#[23]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-254"] <- "Security Features"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-74"] <- "Injection"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-415"] <- "Double Free"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-361"] <- "Time and State"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-59"] <- "Link Following"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-17"] <- "Code"
levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2017DataFrame$CWE_ID_1_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
View(cwe_1_Description2017DataFrame)

#[24]
cwe_2_2017 <- dataNVD2017$cwe.1
cwe_2_2017
cwe_2_2017DataFrame <- ldply(cwe_2_2017, data.frame)
colnames(cwe_2_2017DataFrame) <- "CWE_ID_2"

#[25]
cwe_2_Description2017 <- dataNVD2017$cwe.1
cwe_2_Description2017
cwe_2_Description2017DataFrame <- ldply(cwe_2_Description2017, data.frame)
colnames(cwe_2_Description2017DataFrame) <- "CWE_ID_2_Description"

#[26]
#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-254"] <- "Security Features"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-74"] <- "Injection"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-415"] <- "Double Free"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-361"] <- "Time and State"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-59"] <- "Link Following"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-17"] <- "Code"
levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2017DataFrame$CWE_ID_2_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
View(cwe_2_Description2017DataFrame)

#[Test]
vulnerabilitySoftwareListProduct <- dataNVD2017$vulnerable.software.list.product
vulnerabilitySoftwareListProduct
vulnerabilitySoftwareListProduct2017DataFrame <- ldply(vulnerabilitySoftwareListProduct, data.frame)
colnames(vulnerabilitySoftwareListProduct2017DataFrame) <- "Vulnerability_Software_List_Product"

vulnerabilitySoftwareListProduct1 <- dataNVD2017$vulnerable.software.list.product.1
vulnerabilitySoftwareListProduct1
vulnerabilitySoftwareListProduct12017DataFrame <- ldply(vulnerabilitySoftwareListProduct1, data.frame)
colnames(vulnerabilitySoftwareListProduct12017DataFrame) <- "Vulnerability_Software_List_Product"

#[27]
nvd2017Total <- cbind(cveID2017DataFrame, summary2017DataFrame, 
											publishedDate2017DataFrame, publishedTime2017DataFrame, 
											lastModifiedDate2017DataFrame, lastModifiedTime2017DataFrame,
											cvss2017DataFrame, cvssSeverity2017DataFrame,
											cvssAccessVector2017DataFrame, cvssAccessComplexity2017DataFrame, 
											cvssAuthentication2017DataFrame, cvssConfidentialityImpact2017DataFrame, 
											cvssIntegrityImpact2017DataFrame, cvssAvailabilityImpact2017DataFrame, 
											cvssGeneratedOnDate2017DataFrame, cvssGeneratedOnTime2017DataFrame,
											cwe_1_2017DataFrame, cwe_1_Description2017DataFrame,
											cwe_2_2017DataFrame, cwe_2_Description2017DataFrame)
nvd2017TotalDistinct <- distinct(nvd2017Total)
write.csv(nvd2017TotalDistinct, "CVE_2017.csv", row.names = FALSE)

#[28]
#https://stat.ethz.ch/pipermail/r-help/2012-December/343413.html
nvd2017TotalDistinctLastRowRemoved <- nvd2017TotalDistinct[-nrow(nvd2017TotalDistinct),]
write.csv(nvd2017TotalDistinctLastRowRemoved, "CVE_2017_Last_Row_Removed.csv", row.names = FALSE)

#[29]
#http://www.duanqu.tech/questions/4900348/how-to-remove-rows-in-a-dataframe-that-contain-certain-words-in-r
nvd2017TotalDistinctReject <- nvd2017TotalDistinctLastRowRemoved[grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2017TotalDistinctLastRowRemoved$Vulnerability_Summary), ]
View(nvd2017TotalDistinctReject)
nvd2017TotalDistinctRejectRemoved <- nvd2017TotalDistinctLastRowRemoved[!grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2017TotalDistinctLastRowRemoved$Vulnerability_Summary), ]
View(nvd2017TotalDistinctRejectRemoved)
write.csv(nvd2017TotalDistinctRejectRemoved, "CVE_2017_Rejected_Removed.csv", row.names = FALSE)

#[30]
#https://stackoverflow.com/questions/20977972/how-to-remove-na-data-in-only-one-columns
nvd2017TotalDistinctNA <- nvd2017TotalDistinctRejectRemoved[is.na(nvd2017TotalDistinctRejectRemoved$CVSS_Score),]
View(nvd2017TotalDistinctNA)
nvd2017TotalDistinctNARemoved <- nvd2017TotalDistinctRejectRemoved[!is.na(nvd2017TotalDistinctRejectRemoved$CVSS_Score),]
View(nvd2017TotalDistinctNARemoved)
write.csv(nvd2017TotalDistinctNARemoved, "CVE_2017_NA_Removed.csv", row.names = FALSE)
