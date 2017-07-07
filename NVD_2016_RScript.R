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
colnames(cveID2016DataFrame) <- "CVE_ID"

summary2016 <- dataNVD2016$summary
summary2016
summary2016DataFrame <- ldply(summary2016, data.frame)
colnames(summary2016DataFrame) <- "Vulnerability_Summary"

publishedDateTime2016 <- dataNVD2016$published.datetime
publishedDateTime2016
#----------Vulnerability_Published_Date----------#
publishedDate2016 <- anydate(publishedDateTime2016)
publishedDate2016DataFrame <- ldply(publishedDate2016, data.frame)
colnames(publishedDate2016DataFrame) <- "Vulnerability_Published_Date"
#----------Vulnerability_Published_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
publishedTime2016 <- iso8601(anytime(publishedDateTime2016, tz = "UTC"))
publishedTime2016
#http://rfunction.com/archives/1499
publishedTimeSplit2016 <- strsplit(publishedTime2016, " ") 
publishedTimeSplit2016
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
publishedTimeSplitSecondElement2016 <- sapply(publishedTimeSplit2016, "[", 2)
publishedTimeSplitSecondElement2016
publishedTime2016DataFrame <- ldply(publishedTimeSplitSecondElement2016, data.frame)
colnames(publishedTime2016DataFrame) <- "Vulnerability_Published_Time"

lastModifiedDateTime2016 <- dataNVD2016$last.modified.datetime
lastModifiedDateTime2016
#----------Vulnerability_Last_Modified_Date----------#
lastModifiedDate2016 <- anydate(lastModifiedDateTime2016)
lastModifiedDate2016
lastModifiedDate2016DataFrame <- ldply(lastModifiedDate2016, data.frame)
colnames(lastModifiedDate2016DataFrame) <- "Vulnerability_Last_Modified_Date"
#----------Vulnerability_Last_Modified_Time----------#
#http://dirk.eddelbuettel.com/code/anytime.html
#https://cran.r-project.org/web/packages/anytime/anytime.pdf
lastModifiedTime2016 <- iso8601(anytime(lastModifiedDateTime2016, tz = "UTC"))
lastModifiedTime2016
#http://rfunction.com/archives/1499
lastModifiedTimeSplit2016 <- strsplit(lastModifiedTime2016, " ") 
lastModifiedTimeSplit2016
#https://stackoverflow.com/questions/14347970/splitting-strings-in-r-and-extracting-information-from-lists
lastModifiedTimeSplitSecondElement2016 <- sapply(lastModifiedTimeSplit2016, "[", 2)
lastModifiedTimeSplitSecondElement2016
lastModifiedTime2016DataFrame <- ldply(lastModifiedTimeSplitSecondElement2016, data.frame)
colnames(lastModifiedTime2016DataFrame) <- "Vulnerability_Last_Modified_Time"

cvss2016 <- dataNVD2016$cvss.base_metrics.score
cvss2016
cvss2016DataFrame <- ldply(cvss2016, data.frame)
colnames(cvss2016DataFrame) <- "CVSS_Score"

cvssAccessVector2016 <- dataNVD2016$cvss.base_metrics.access.vector
cvssAccessVector2016
cvssAccessVector2016DataFrame <- ldply(cvssAccessVector2016, data.frame)
colnames(cvssAccessVector2016DataFrame) <- "CVSS_Access_Vector"

cvssAccessComplexity2016 <- dataNVD2016$cvss.base_metrics.access.complexity
cvssAccessComplexity2016
cvssAccessComplexity2016DataFrame <- ldply(cvssAccessComplexity2016, data.frame)
colnames(cvssAccessComplexity2016DataFrame) <- "CVSS_Access_Complexity"

cvssAuthentication2016 <- dataNVD2016$cvss.base_metrics.authentication
cvssAuthentication2016
cvssAuthentication2016DataFrame <- ldply(cvssAuthentication2016, data.frame)
colnames(cvssAuthentication2016DataFrame) <- "CVSS_Authentication"

cvssConfidentialityImpact2016 <- dataNVD2016$cvss.base_metrics.confidentiality.impact
cvssConfidentialityImpact2016
cvssConfidentialityImpact2016DataFrame <- ldply(cvssConfidentialityImpact2016, data.frame)
colnames(cvssConfidentialityImpact2016DataFrame) <- "CVSS_Confidentiality_Impact"

cvssIntegrityImpact2016 <- dataNVD2016$cvss.base_metrics.integrity.impact
cvssIntegrityImpact2016
cvssIntegrityImpact2016DataFrame <- ldply(cvssIntegrityImpact2016, data.frame)
colnames(cvssIntegrityImpact2016DataFrame) <- "CVSS_Integrity_Impact"

cvssAvailabilityImpact2016 <- dataNVD2016$cvss.base_metrics.availability.impact
cvssAvailabilityImpact2016
cvssAvailabilityImpact2016DataFrame <- ldply(cvssAvailabilityImpact2016, data.frame)
colnames(cvssAvailabilityImpact2016DataFrame) <- "CVSS_Availability_Impact"

cvssGeneratedOnDateTime2016 <- dataNVD2016$cvss.base_metrics.generated.on.datetime
cvssGeneratedOnDateTime2016
cvssGeneratedOnDate2016 <- anydate(cvssGeneratedOnDateTime2016)
cvssGeneratedOnDate2016DataFrame <- ldply(cvssGeneratedOnDate2016, data.frame)
colnames(cvssGeneratedOnDate2016DataFrame) <- "CVSS_Generated_On_Date"

#cwe2016 <- dataNVD2016$cwe
#cwe2016
#cwe2016DataFrame <- ldply(cwe2016, data.frame)
#colnames(cwe2016DataFrame) <- "CWE_ID"

cwe_1_2016 <- dataNVD2016$cwe
cwe_1_2016
cwe_1_2016DataFrame <- ldply(cwe_1_2016, data.frame)
colnames(cwe_1_2016DataFrame) <- "CWE_ID_1"

cwe_1_Description2016 <- dataNVD2016$cwe
cwe_1_Description2016
cwe_1_Description2016DataFrame <- ldply(cwe_1_Description2016, data.frame)
colnames(cwe_1_Description2016DataFrame) <- "CWE_ID_1_Description"

#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
#----------#
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-254"] <- "Security Features"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-74"] <- "Injection"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-415"] <- "Double Free"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-361"] <- "Time and State"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-59"] <- "Link Following"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-17"] <- "Code"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-18"] <- "Source Code"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description)[levels(cwe_1_Description2016DataFrame$CWE_ID_1_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
View(cwe_1_Description2016DataFrame)

cwe_2_2016 <- dataNVD2016$cwe.1
cwe_2_2016
cwe_2_2016DataFrame <- ldply(cwe_2_2016, data.frame)
colnames(cwe_2_2016DataFrame) <- "CWE_ID_2"

cwe_2_Description2016 <- dataNVD2016$cwe.1
cwe_2_Description2016
cwe_2_Description2016DataFrame <- ldply(cwe_2_Description2016, data.frame)
colnames(cwe_2_Description2016DataFrame) <- "CWE_ID_2_Description"

#https://stackoverflow.com/questions/14634964/how-does-one-change-the-levels-of-a-factor-column-in-a-data-table
#https://nvd.nist.gov/vuln/categories
#----------#
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-264"] <- "Permissions, Privileges, and Access Control"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-119"] <- "Buffer Errors"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-20"] <- "Input Validation"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-200"] <- "Information Leak / Disclosure"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-284"] <- "Improper Access Control"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-476"] <- "NULL Pointer Dereference"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-79"] <- "Cross-Site Scripting (XSS)"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-704"] <- "Incorrect Type Conversion or Cast"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-352"] <- "Cross-Site Request Forgery (CSRF)"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-254"] <- "Security Features"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-19"] <- "Data Handling"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-287"] <- "Authentication Issues"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-190"] <- "Integer Overflow or Wraparound"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-295"] <- "Improper Certificate Validation"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-74"] <- "Injection"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-118"] <- "Improper Access of Indexable Resource ('Range Error')"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-275"] <- "Permission Issues"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-129"] <- "Improper Validation of Array Index"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-682"] <- "Incorrect Calculation"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-362"] <- "Race Conditions"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-399"] <- "Resource Management Errors"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-400"] <- "Uncontrolled Resource Consumption ('Resource Exhaustion')"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-384"] <- "Session Fixation"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-285"] <- "Improper Authorization"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-611"] <- "Improper Restriction of XML External Entity Reference ('XXE')"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-77"] <- "Command Injection"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-601"] <- "URL Redirection to Untrusted Site ('Open Redirect')"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-326"] <- "Inadequate Encryption Strength"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-320"] <- "Key Management Errors"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-22"] <- "Path Traversal"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-78"] <- "OS Command Injections"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-426"] <- "Untrusted Search Path"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-93"] <- "Improper Neutralization of CRLF Sequences ('CRLF Injection')"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-89"] <- "SQL Injection"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-255"] <- "Credentials Management"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-416"] <- "Use After Free"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-310"] <- "Cryptographic Issues"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-134"] <- "Format String Vulnerability"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-125"] <- "Out-of-bounds Read"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-415"] <- "Double Free"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-189"] <- "Numeric Errors"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-640"] <- "Weak Password Recovery Mechanism for Forgotten Password"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-94"] <- "Code Injection"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-428"] <- "Unquoted Search Path or Element"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-191"] <- "Integer Underflow (Wrap or Wraparound)"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-787"] <- "Out-of-bounds Write"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-502"] <- "Deserialization of Untrusted Data"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-485"] <- "Insufficient Encapsulation"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-532"] <- "Information Exposure Through Log Files"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-99"] <- "Improper Control of Resource Identifiers ('Resource Injection')"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-427"] <- "Uncontrolled Search Path Element"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-306"] <- "Missing Authentication for Critical Function"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-798"] <- "Use of Hard-coded Credentials"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-943"] <- "Improper Neutralization of Special Elements in Data Query Logic"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-327"] <- "Use of a Broken or Risky Cryptographic Algorithm"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-388"] <- "Error Handling"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-918"] <- "Server-Side Request Forgery (SSRF)"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-346"] <- "Origin Validation Error"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-91"] <- "XML Injection (aka Blind XPath Injection)"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-361"] <- "Time and State"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-434"] <- "Unrestricted Upload of File with Dangerous Type"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-417"] <- "Channel and Path Errors"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-613"] <- "Insufficient Session Expiration"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-369"] <- "Divide By Zero"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-358"] <- "Improperly Implemented Security Check for Standard"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-59"] <- "Link Following"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-113"] <- "Improper Neutralization of CRLF Sequences in HTTP Headers ('HTTP Response Splitting')"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-404"] <- "Improper Resource Shutdown or Release"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-116"] <- "Improper Encoding or Escaping of Output"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-90"] <- "Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-17"] <- "Code"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-338"] <- "Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)"
#----------#
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-693"] <- "Protection Mechanism Failure"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-345"] <- "Insufficient Verification of Data Authenticity"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-297"] <- "Improper Validation of Certificate with Host Mismatch"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-21"] <- "Path Equivalence"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-331"] <- "Insufficient Entropy"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-172"] <- "Encoding Error"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-669"] <- "Incorrect Resource Transfer Between Spheres"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-330"] <- "Use of Insufficiently Random Values"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-199"] <- "Information Management Errors"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-184"] <- "Incomplete Blacklist"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-18"] <- "Source Code"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-749"] <- "Exposed Dangerous Method or Function"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-347"] <- "Improper Verification of Cryptographic Signature"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-754"] <- "Improper Check for Unusual or Exceptional Conditions"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-664"] <- "Improper Control of a Resource Through its Lifetime"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-775"] <- "Missing Release of File Descriptor or Handle after Effective Lifetime"
levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description)[levels(cwe_2_Description2016DataFrame$CWE_ID_2_Description) == "CWE-332"] <- "Insufficient Entropy in PRNG"
View(cwe_2_Description2016DataFrame)

nvd2016Total <- cbind(cveID2016DataFrame, summary2016DataFrame, 
											publishedDate2016DataFrame, publishedTime2016DataFrame, 
											lastModifiedDate2016DataFrame, lastModifiedTime2016DataFrame,
											cvss2016DataFrame, cvssAccessVector2016DataFrame, cvssAccessComplexity2016DataFrame, 
											cvssAuthentication2016DataFrame, cvssConfidentialityImpact2016DataFrame, 
											cvssIntegrityImpact2016DataFrame, cvssAvailabilityImpact2016DataFrame, 
											cvssGeneratedOnDate2016DataFrame, 
											cwe_1_2016DataFrame, cwe_1_Description2016DataFrame,
											cwe_2_2016DataFrame, cwe_2_Description2016DataFrame)
nvd2016TotalDistinct <-distinct(nvd2016Total)
write.csv(nvd2016TotalDistinct, "CVE_2016.csv", row.names = FALSE)

#https://stat.ethz.ch/pipermail/r-help/2012-December/343413.html
nvd2016TotalDistinctLastRowRemoved <- nvd2016TotalDistinct[-nrow(nvd2016TotalDistinct),]
write.csv(nvd2016TotalDistinctLastRowRemoved, "CVE_2016_Last_Row_Removed.csv", row.names = FALSE)

#http://www.duanqu.tech/questions/4900348/how-to-remove-rows-in-a-dataframe-that-contain-certain-words-in-r
nvd2016TotalDistinctRejectRemoved <- nvd2016TotalDistinct[!grepl("DO NOT USE THIS CANDIDATE NUMBER.", nvd2016TotalDistinct$Vulnerability_Summary), ]
write.csv(nvd2016TotalDistinctRejectRemoved, "CVE_2016_Rejected_Removed.csv", row.names = FALSE)

