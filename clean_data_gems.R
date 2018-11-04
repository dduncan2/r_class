#load necessary packages - note that I'm using readxl as opposed to xlsx

library(tidyverse)
library(readxl)

#import HESM 911 response data
GEMS_fac_transports <- read_excel("data\\Dr. Harinder Dhindsa GEMS and HEMS Response 9-13-2018.xlsx", sheet = "GEMS Interfacility Transports")

#create vector of new column names
GEMS_cols <- c("Agency", "UnitNotifiedDateTime", "ServiceTypeRequested", "UnitRole", "ComplaintReported", "UnitCareLevel", "CrewCareLevel", "SituationComplaintType", "InitialPatientAcuity", "DestinationCode", "DestinationName", "SceneCity", "SceneCounty", "SceneZip", "TransportMode")

#use character vector to rename columns by position
colnames(GEMS_fac_transports) <- GEMS_cols

#create character vector for patient acuity factor levels and convert to factor
acuity_lvl_GEMS <- c("Critical (Red)", "Emergent (Yellow)")
GEMS_fac_transports$InitialPatientAcuity <- parse_factor(GEMS_fac_transports$InitialPatientAcuity, levels = acuity_lvl_GEMS)

#create character vector for unit care factor levels and convert to factor
unitcare_lvl <- c("ALS-Physician", "ALS-Registered Nurse", "ALS-Paramedic", "ALS-Intermediate", "Specialty Critical Care")
GEMS_fac_transports$UnitCareLevel <- parse_factor(GEMS_fac_transports$UnitCareLevel, levels = unitcare_lvl)

#create character vector for transport mode factor levels and convert to factor
transportmode_lvl_GEMS <- c("Emergent (Immediate Response)", "Non-Emergent Upgraded to Emergent", "Emergent Downgraded to Non-Emergent", "Non-Emergent")
GEMS_fac_transports$TransportMode <- parse_factor(GEMS_fac_transports$TransportMode, levels = transportmode_lvl_GEMS)

#create character vector for crew care factor levels and convert to factor
crewcare_lvl <- c("Physician", "Z-Critical Care Paramedic", "EMT-Paramedic", "Registered Nurse", "2009 Paramedic", "Respiratory Therapist", "Advanced Emergency Medical Technician (AEMT)", "Z-Advanced EMT - A / EMT Enhanced", "EMT-Intermediate", "Emergency Medical Technician (EMT)", "2009 Emergency Medical Technician (EMT)", "Emergency Medical Responder (EMR)", "Other Healthcare Professional", "Other Non-Healthcare Professional (i.e., Driver/Pilot/Third/, etc.)", "Student", "Not Recorded")
GEMS_fac_transports$CrewCareLevel <- parse_factor(GEMS_fac_transports$CrewCareLevel, levels = crewcare_lvl)

#convert remaining character fields to factors
GEMS_fac_transports <- mutate_if(GEMS_fac_transports, is.character, as.factor)

