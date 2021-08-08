library(dplyr)


########### Deliverable 1 ###########
# Load mpg csv file
mecha_car_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_car_table) 

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_car_table)) 


########### Deliverable 2 ###########
# Load suspension coil csv file
s_coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#create summary table with multiple columns
total_summary  <- s_coil_table %>% group_by() %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD= sd(PSI) , .groups = 'keep') 
total_summary 

#create lot summary table 
lot_summary <- s_coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD= sd(PSI) , .groups = 'keep') 
lot_summary


########### Deliverable 3 ###########

# compare all lots versus population means
#t.test(log10(s_coil_table$PSI),mu=1500)
t.test(s_coil_table$PSI,mu=1500)

#Lot1
#t.test(subset(x=s_coil_table,Manufacturing_Lot == "Lot1")$PSI, mu=1500)
t.test(subset(x=s_coil_table$PSI,s_coil_table$Manufacturing_Lot == "Lot1"), mu=1500)


#Lot2
t.test(subset(x=s_coil_table$PSI,s_coil_table$Manufacturing_Lot == "Lot2"), mu=1500)

#Lot3
t.test(subset(x=s_coil_table$PSI,s_coil_table$Manufacturing_Lot == "Lot3"), mu=1500)


