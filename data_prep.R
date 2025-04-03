#Libraries---------------------------------------------------------------------
library(tidyverse) # For data maniputation
library(reshape2) # For reshaping data
library(readxl) # For reading in excel data

#Data Preparation and manipulation----------------------------------------------
##imporing data----------------------------------------------------------------
skyldig_kön_ålder_socialekonomisk_status <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 1)
skyldig_kön_ålder_ursprung <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 2)
anmälda_åtalade_region <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 3)
bidrag_ursprung_kön <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 4)
häktade_kön_ålder_utbildning <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 5)

# Formating variables-----------------------------------------------------------

## SOCIOECONOMIC----------------------------------------------------------------
skyldig_kön_ålder_socialekonomisk_status <- skyldig_kön_ålder_socialekonomisk_status %>% 
  mutate(Kön = factor(Kön), 
         Ålder = factor(Ålder),
         Status = factor(Status))


#Reshaping the data to long fromat

skyldig_kön_ålder_socialekonomisk_status_reshaped <- melt(data = skyldig_kön_ålder_socialekonomisk_status, 
             na.rm = FALSE, #to not ignore NA
             value.name = "Skyldiga", #variable name for the elongated data
             id = c("Kön", "Ålder", "Status")) 

# renaming column with long formated data
skyldig_kön_ålder_socialekonomisk_status_reshaped <- skyldig_kön_ålder_socialekonomisk_status_reshaped %>% 
  rename(År = variable)

# Saving as rds file
skyldig_kön_ålder_socialekonomisk_status_reshaped %>% 
  write_rds("Data/skyldig_kön_ålder_socialekonomisk.rds")


## URSPRUNG---------------------------------------------------------------------
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

skyldig_kön_ålder_ursprung_reshaped %>% 
  write_rds("Data/skyldig_kön_ålder_ursprung.rds")

## ANMÄLDA OCH ÅTALADE-------------------------------------------------------- 
anmälda_åtalade_region <- anmälda_åtalade_region %>%
  mutate(Händelse = factor(Händelse),
         Brott = factor(Brott),
         Region = factor(Region))

anmälda_åtalade_region_reshaped <- melt(data = anmälda_åtalade_region,
                                        na.rm = FALSE,
                                        value.name = "Anmälda_Åtalade",
                                        id =c("Händelse", "Brott", "Region")) 

anmälda_åtalade_region_reshaped <- anmälda_åtalade_region_reshaped %>% 
  rename(År = variable)

anmälda_åtalade_region_reshaped %>% 
  write_rds("Data/anmälda_åtalade_region.rds")

## ANTALET PERSONER PÅ BIDRAG PER URSPRUNGsland OCH KÖN--------------------------
bidrag_ursprung_kön <- bidrag_ursprung_kön %>% 
  mutate(Ursprungsland = factor(Ursprungsland),
         Kön = factor(Kön),
         Typ_av_bidrag = factor(Typ_av_bidrag))

bidrag_ursprung_kön_reshaped <- melt(data = bidrag_ursprung_kön,
                                     na.rm = FALSE,
                                     value.name = "Antalet_på_bidrag",
                                     id = c("Kön", "Ursprungsland", "Typ_av_bidrag")) %>% 
  rename(Kvartal = variable)

bidrag_ursprung_kön_reshaped %>% 
  write_rds("Data/bidrag_ursprung_kön.rds")

## HÄKTADE PERSONER PER KÖN, UTBILDNING OCH ÅLDER-------------------------------
häktade_kön_ålder_utbildning <- häktade_kön_ålder_utbildning %>% 
  mutate(Utbildning = factor(Utbildning),
         Kön = factor(Kön),
         Ålder = factor(Ålder))

häktade_kön_ålder_utbildning_reshaped <- melt(häktade_kön_ålder_utbildning,
                                              na.rm = FALSE,
                                              value.name = "Antalet_häktade",
                                              id = c("Utbildning", "Kön", "Ålder")) %>% 
  rename(År = variable)

häktade_kön_ålder_utbildning_reshaped %>% 
  write_rds("Data/häktade_kön_ålder.rds")









