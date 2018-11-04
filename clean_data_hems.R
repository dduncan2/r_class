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

#convert appropriate values to factor
HEMS_responses$Agency <- parse_factor(HEMS_responses$Agency, levels = NULL)
HEMS_responses$IncidentPatientDisposition <- parse_factor(HEMS_responses$IncidentPatientDisposition, levels = NULL)
HEMS_responses$ComplaintReported <- parse_factor(HEMS_responses$ComplaintReported, levels = NULL)
HEMS_responses$SceneLocationType <- parse_factor(HEMS_responses$SceneLocationType, levels = NULL)
HEMS_responses$SceneCity <- parse_factor(HEMS_responses$SceneCity, levels = NULL)
HEMS_responses$SceneCounty <- parse_factor(HEMS_responses$SceneCounty, levels = NULL)
HEMS_responses$SceneZip <- parse_factor(HEMS_responses$SceneZip, levels = NULL)
HEMS_responses$SituationComplaintType <- parse_factor(HEMS_responses$SituationComplaintType, levels = NULL)
HEMS_responses$PossibleInjury <- parse_factor(HEMS_responses$PossibleInjury, levels = NULL)
HEMS_responses$SecondaryImpressionDesc <- parse_factor(HEMS_responses$SecondaryImpressionDesc, levels = NULL)
HEMS_responses$CauseInjuryDesc <- parse_factor(HEMS_responses$CauseInjuryDesc, levels = NULL)
#create character vector for patient acuity factor levels
acuity_lvl <- c("Critical (Red)", "Emergent (Yellow)", "Lower Acuity (Green)", "Dead without Resuscitation Efforts (Black)", "Not Recorded", "Not Applicable")
HEMS_responses$InitialPatientAcuity <- parse_factor(HEMS_responses$InitialPatientAcuity, levels = acuity_lvl)
HEMS_responses$TraumaCriteria <- parse_factor(HEMS_responses$TraumaCriteria, levels = NULL)
HEMS_responses$VehiclePedestrianInjuryRisk <- parse_factor(HEMS_responses$VehiclePedestrianInjuryRisk, levels = NULL)
HEMS_responses$VehicleImpactArea <- parse_factor(HEMS_responses$VehicleImpactArea, levels = NULL)
HEMS_responses$LocationInVehicle <- parse_factor(HEMS_responses$LocationInVehicle, levels = NULL)
HEMS_responses$OccupantSafetyEquip <- parse_factor(HEMS_responses$OccupantSafetyEquip, levels = NULL)
HEMS_responses$AirbagDeployment <- parse_factor(HEMS_responses$AirbagDeployment, levels = NULL)
HEMS_responses$StrokeScaleScore <- parse_factor(HEMS_responses$StrokeScaleScore, levels = NULL)
HEMS_responses$StrokeScaleType <- parse_factor(HEMS_responses$StrokeScaleType, levels = NULL)
HEMS_responses$DestinationName <- parse_factor(HEMS_responses$DestinationName, levels = NULL)
HEMS_responses$DestinationCode <- parse_factor(HEMS_responses$DestinationCode, levels = NULL)
HEMS_responses$TransportMode <- parse_factor(HEMS_responses$TransportMode, levels = NULL)
HEMS_responses$DestinationReason <- parse_factor(HEMS_responses$DestinationReason, levels = NULL)
HEMS_responses$PrearrivalAlert <- parse_factor(HEMS_responses$PrearrivalAlert, levels = NULL)
HEMS_responses$PrimaryImpressionDesc <- parse_factor(HEMS_responses$PrimaryImpressionDesc, levels = NULL)
