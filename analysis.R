#AUTHOR:AOLE ZHENG 
#START DATE:2026/04/30


rm(list=ls())
# set working directory to current folder
curr.dir<-dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(curr.dir)

# read data
col_names <- c("ID", "TIME", "Ventricular CSF", "Lumbar CSF", "Cisternal CSF", "Cortical ECF", "Subcortical ECF", "Plasma")
raw_data <- read_excel("C:/Users/11437/Documents/BaiduSyncdisk/PhD/2.Mechanistic BBB/01.data/porcine PK CNS/Cefazolin_Concentrations.xlsx",
                       range = "A2:H49", sheet = 1, col_names = col_names)
# clean data
obs <- raw_data %>%
  pivot_longer(3:8,names_to = "COMP", values_to = "DV")%>%
  mutate(COMP = factor(COMP, levels = c("Plasma", "Cortical ECF", "Subcortical ECF", 
                                        "Ventricular CSF", "Cisternal CSF", "Lumbar CSF")),
         ID = as.factor(ID))









