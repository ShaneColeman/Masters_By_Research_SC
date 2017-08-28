#NVD_ARFF_Conversion.R

#----------ARFF (Attribute-Relation File Format) Conversion, from Data Frame to ARFF----------#
#https://stackoverflow.com/questions/40880549/how-to-write-data-frame-into-arff-using-r

install.packages("foreign")
library(foreign)

#NVD 2014 - 2017 Total Selected Columns Ordered (NA Removed)
#NAs removed (Columns): 
#CVSS_Score, CVSS_Severity, 
#CVSS_Access_Vector, CVSS_Access_Complexity, CVSS_Authentication, 
#CVSS_Confidentiality_Impact, CVSS_Integrity_Impact, CVSS_Availability_Impact,
#CVSS_Generated_On_Date, CVSS_Generated_On_Time, 
#CWE_ID_1, CWE_ID_1_Description, 
#CWE_ID_2, CWE_ID_2_Description.
#Data Frame RScript File Location: "Recommender_System_Similarity_Matrix_Modified_RScript.R"
#Data Frame: "nvd2014_2017SelectedColumnsModifiedOrdered"
View(nvd2014_2017SelectedColumnsModifiedOrdered)
str(nvd2014_2017SelectedColumnsModifiedOrdered)
write.arff(nvd2014_2017SelectedColumnsModifiedOrdered, 
					 file = "nvd_2014_2017_total_columns_na_removed_ordered.arff")

#----------NVD 2017 Selected Columns (NA Removed) Ordered----------#
#NAs removed (Columns): 
#CVSS_Score, CVSS_Severity, 
#CVSS_Access_Vector, CVSS_Access_Complexity, CVSS_Authentication, 
#CVSS_Confidentiality_Impact, CVSS_Integrity_Impact, CVSS_Availability_Impact,
#CVSS_Generated_On_Date, CVSS_Generated_On_Time, 
#CWE_ID_1, CWE_ID_1_Description, 
#CWE_ID_2, CWE_ID_2_Description.
#Data Frame RScript File Location: "NVD_Training_Testing_Updated_RScript.R"
#Data Frame: "nvd2017SelectedColumnsNARemovedOrdered"
View(nvd2017SelectedColumnsNARemovedOrdered)
write.arff(nvd2017SelectedColumnsNARemovedOrdered, file = "nvd_2017_selected_columns_na_removed_ordered.arff")

#----------NVD 2016 Selected Columns (NA Removed) Ordered----------#
#NAs removed (Columns): 
#CVSS_Score, CVSS_Severity, 
#CVSS_Access_Vector, CVSS_Access_Complexity, CVSS_Authentication, 
#CVSS_Confidentiality_Impact, CVSS_Integrity_Impact, CVSS_Availability_Impact,
#CVSS_Generated_On_Date, CVSS_Generated_On_Time, 
#CWE_ID_1, CWE_ID_1_Description, 
#CWE_ID_2, CWE_ID_2_Description.
#Data Frame RScript File Location: "NVD_Training_Testing_Updated_RScript.R"
#Data Frame: "nvd2016SelectedColumnsNARemovedOrdered"
View(nvd2016SelectedColumnsNARemovedOrdered)
write.arff(nvd2016SelectedColumnsNARemovedOrdered, 
					 file = "nvd_2016_selected_columns_na_removed_ordered.arff")

#----------NVD 2015 Selected Columns (NA Removed) Ordered----------#
#NAs removed (Columns): 
#CVSS_Score, CVSS_Severity, 
#CVSS_Access_Vector, CVSS_Access_Complexity, CVSS_Authentication, 
#CVSS_Confidentiality_Impact, CVSS_Integrity_Impact, CVSS_Availability_Impact,
#CVSS_Generated_On_Date, CVSS_Generated_On_Time, 
#CWE_ID_1, CWE_ID_1_Description, 
#CWE_ID_2, CWE_ID_2_Description.
#Data Frame RScript File Location: "NVD_Training_Testing_Updated_RScript.R"
#Data Frame: "nvd2015SelectedColumnsNARemovedOrdered"
View(nvd2015SelectedColumnsNARemovedOrdered)
write.arff(nvd2015SelectedColumnsNARemovedOrdered, 
					 file = "nvd_2015_selected_columns_na_removed_ordered.arff")

#----------NVD 2014 Selected Columns (NA Removed) Ordered----------#
#NAs removed (Columns): 
#CVSS_Score, CVSS_Severity, 
#CVSS_Access_Vector, CVSS_Access_Complexity, CVSS_Authentication, 
#CVSS_Confidentiality_Impact, CVSS_Integrity_Impact, CVSS_Availability_Impact,
#CVSS_Generated_On_Date, CVSS_Generated_On_Time, 
#CWE_ID_1, CWE_ID_1_Description, 
#CWE_ID_2, CWE_ID_2_Description.
#Data Frame RScript File Location: "NVD_Training_Testing_Updated_RScript.R"
#Data Frame: "nvd2015SelectedColumnsNARemovedOrdered"
View(nvd2014SelectedColumnsNARemovedOrdered)
write.arff(nvd2014SelectedColumnsNARemovedOrdered,
					 file = "nvd_2014_selected_columns_na_removed_ordered.arff")
