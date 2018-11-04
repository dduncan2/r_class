#load necessary packages - note that I'm using readxl as opposed to xlsx

library(tidyverse)
library(readxl)

#import HESM 911 response data
HEMS_responses <- read_excel("data\\Dr. Harinder Dhindsa GEMS and HEMS Response 9-13-2018.xlsx", sheet = " HEMS 911 Responses")

#create vector of new column names
HEMS_cols <- c("Agency", "IncidentPatientDisposition", "ComplaintReported", "UnitNotifiedDateTime", "SceneLocationType", "SceneCity", "SceneCounty", "SceneZip", "SituationComplaintType", "PossibleInjury", "SymptomOnsetDateTime", "SecondaryImpressionDesc", "CauseInjuryDesc", "InitialPatientAcuity", "TraumaCriteria", "VehiclePedestrianInjuryRisk", "VehicleImpactArea", "LocationInVehicle", "OccupantSafetyEquip", "AirbagDeployment", "FallHeight", "VitalsTakenDateTime", "BPSystolic", "RespRate", "GlasgowComaScore", "StrokeScaleScore", "StrokeScaleType", "DestinationName", "DestinationCode", "TransportMode", "DestinationReason", "PrearrivalAlert", "PrimaryImpressionDesc", "DestinationArrivalDateTime")

#use character vector to rename columns by position
colnames(HEMS_responses) <- HEMS_cols

#convert appropriate values to numeric
HEMS_responses$FallHeight <- parse_number(HEMS_responses$FallHeight) 
HEMS_responses$BPSystolic <- parse_number(HEMS_responses$BPSystolic)
HEMS_responses$RespRate <- parse_number(HEMS_responses$RespRate)
HEMS_responses$GlasgowComaScore <- parse_number(HEMS_responses$GlasgowComaScore)

#create character vector for patient acuity factor levels and convert to factor
acuity_lvl <- c("Critical (Red)", "Emergent (Yellow)", "Lower Acuity (Green)", "Dead without Resuscitation Efforts (Black)", "Not Recorded", "Not Applicable")
HEMS_responses$InitialPatientAcuity <- parse_factor(HEMS_responses$InitialPatientAcuity, levels = acuity_lvl)

#convert remaining character fields to factors without specified levels
HEMS_responses <- mutate_if(HEMS_responses, is.character, as.factor)
