library(dplyr)
mechaCar <- read.csv(file="MechaCar_mpg.csv", stringsAsFactors = F)
head(mechaCar)

lm_mechaCar <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechaCar )

summary(lm_mechaCar)



suspensionCoil <- read.csv(file="Suspension_Coil.csv", stringsAsFactors = F)
head(suspensionCoil)

total_summary <- suspensionCoil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),SD=sd(PSI), .groups ="keep" )
lot_summary <- suspensionCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),SD=sd(PSI), .groups ="keep" )


t.test(suspensionCoil$PSI, mu=1500)
t.test(subset(suspensionCoil, Manufacturing_Lot == "Lot1")$PSI, mu = 1500)
t.test(subset(suspensionCoil, Manufacturing_Lot == "Lot2")$PSI, mu = 1500)
t.test(subset(suspensionCoil, Manufacturing_Lot == "Lot3")$PSI, mu = 1500)