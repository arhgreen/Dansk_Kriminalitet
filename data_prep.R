######Libraries####
library(tidyverse) # For data maniputation
library(reshape2) # For reshaping data
library(readxl) # For reading in excel data

###Data Preparation and manipulation#############
#imporing data
skyldig_kön_ålder_socialekonomisk_status <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 1)
skyldig_kön_ålder_ursprung <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 2)
anmälda_åtalade_region <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 3)
bidrag_ursprung_kön <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 4)
häktade_kön_ålder_utbildning <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 5)

## formating variables 

## SOCIOECONOMIC 
skyldig_kön_ålder_socialekonomisk_status <- skyldig_kön_ålder_socialekonomisk_status %>% 
  mutate(Kön = factor(Kön), 
         Ålder = factor(Ålder),
         Status = factor(Status))


#######Reshaping the data to long fromat#############

skyldig_kön_ålder_socialekonomisk_status_reshaped <- melt(data = skyldig_kön_ålder_socialekonomisk_status, 
             na.rm = FALSE, #to not ignore NA
             value.name = "Skyldiga", #variable name for the elongated data
             id = c("Kön", "Ålder", "Status")) 

# renaming column with long formated data
skyldig_kön_ålder_socialekonomisk_status_reshaped <- skyldig_kön_ålder_socialekonomisk_status_reshaped %>% 
  rename(År = variable)


# URSPRUNG
skyldig_kön_ålder_ursprung <- skyldig_kön_ålder_ursprung %>% 
  mutate(Ursprung= factor(Ursprung),
         Kön = factor(Kön),
         Ålder = factor(Ålder))

# reshaping
skyldig_kön_ålder_ursprung_reshaped <- melt(data = skyldig_kön_ålder_ursprung, 
                                                          na.rm = FALSE, #to not ignore NA
                                                          value.name = "Skyldiga", #variable name for the elongated data
                                                          id = c("Kön", "Ålder", "Ursprung")) 

# renaming column with long formated data
skyldig_kön_ålder_ursprung_reshaped <- skyldig_kön_ålder_ursprung_reshaped %>% 
  rename(År = variable)
