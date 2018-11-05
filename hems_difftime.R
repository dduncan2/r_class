#this script is intended to provide, in hours, the average trip time for each agency: the total time from dispatch to hospital, the time from dispatch to first vitals taken and the time from first vitals to hospital. unfortunately some of my results don't make complete sense - a few of the agencites have negative values for timetovitals and/or the timetovitals + vitalstodestination values don't match the totaltime values. However, for more than half of the agencies, these match up perfectly. this leads me to believe some of the data might not have been entered correctly - but I may have just screwed something up too.

HEMS_difftime <- HEMS_responses %>% 
   group_by(Agency) %>% 
   summarise(
         totaltime = as.numeric(mean(DestinationArrivalDateTime-UnitNotifiedDateTime, na.rm = TRUE), units = "hours"),
         timetovitals = as.numeric(mean(VitalsTakenDateTime-UnitNotifiedDateTime, na.rm = TRUE), units = "hours"),
         vitalstodestination = as.numeric(mean(DestinationArrivalDateTime-VitalsTakenDateTime, na.rm = TRUE), units = "hours")
         )
