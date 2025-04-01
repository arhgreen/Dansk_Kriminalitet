######Libraries####
library(tidyverse) # For data maniputation
library(stats) # For reshaping data
library(readxl) # For reading in excel data

###Data Preparation and manipulation#############
#imporing data
skyldig_kön_ålder_socialekonomisk_status <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 1)
skyldig_kön_ålder_ursprung <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 2)
anmälda_åtalade_region <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 3)
bidrag_ursprung_kön <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 4)
häktade_kön_ålder_utbildning <- read_excel("~/Documents/Dansk_Kriminalitet/RawData/Danmark_stats_crime_socioeconomic.xlsx", 5)
