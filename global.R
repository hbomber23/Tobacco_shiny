library(shinyWidgets)
library(ggplot2)
library(tidyr)
library(dplyr)
library(shiny)

#####
#age bucket data
#####
ages = read.csv(file="D:/..NYCDSA/ShinyProject/Data/ages_v2.csv", 
                stringsAsFactors = T)



ages <- rename(ages, "16-24" = "X16.24")
ages <- rename(ages, "25-34" = "X25.34")
ages <- rename(ages, "35-49" = "X35.49")
ages <- rename(ages, "50-59" = "X50.59")
ages <- rename(ages, "60+" = "X60.and.Over")


clean_age <- ages %>% gather(key=AgeBracket, value=Count, '16-24', '25-34', '35-49', '50-59', '60+')



yearchoice= c(unique(clean_age$Year))
ts_age = c('16-24', '25-34', '35-49', '50-59', '60+')

#####
#state data
#####
states = read.csv(file="D:/..NYCDSA/ShinyProject/Data/CDC_US_v2.csv", 
                  stringsAsFactors = T)


smokechoicefreq = c('Smoke.everyday', 'Smoke.some.days',
                    'Former.smoker', 'Never.smoked')


#####
#Tobacco product data
#####
survey = read.csv(file="D:/..NYCDSA/ShinyProject/Data/SurveyNats_v2.csv", 
                  stringsAsFactors = T)

metricchoice = c('Initial.Age.of.Use', 'Years.of.Smoking',
                 'grams.per.day')




