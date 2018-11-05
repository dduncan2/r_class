group_HEMS <- HEMS_responses %>% 
   group_by(Agency) %>% 
   summarise(
         totaltime = as.numeric(mean(DestinationArrivalDateTime-UnitNotifiedDateTime, na.rm = TRUE), units = "hours"),
         timetovitals = as.numeric(mean(VitalsTakenDateTime-UnitNotifiedDateTime, na.rm = TRUE), units = "hours"),
         vitalstodestination = as.numeric(mean(DestinationArrivalDateTime-VitalsTakenDateTime, na.rm = TRUE), units = "hours")
         )
