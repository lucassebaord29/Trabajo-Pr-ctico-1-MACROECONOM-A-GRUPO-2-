####librerias utilizadas#####
library(ggplot2)
library(tidyverse)
library(readxl)
library(ggthemes)
library(lubridate)
theme_set(theme_minimal())
#####zona de trabajo#######
setwd("~/graficas macro")
#####datos#######
df <- read_xlsx("datos_PIB_per_c�pita_Anual_en_D�lares_corrientes.xlsx")
view(df)
#####grafica#######

###replicando tidyverse####

df %>% 
  ggplot(aes(x=Per�odo, y= `PIB per capita anual en d�lares corrientes`, color = "PIB en D�lares corrientes"))+
  geom_line(size=1)+
  geom_point(size = 2)+
  ylab('PIB a precios corrientes en D�lares')+
  ggtitle("PIB per c�pita Anual en D�lares Corrientes", 
          "Evoluci�n del PIB per c�pita 2004-2020 a precios Corrientes en D�lares")+
  theme_hc()+
scale_x_continuous(breaks = seq(2004,2020,2))+
  scale_y_continuous(labels = scales :: dollar, breaks = seq(0,15000,2000))+
  theme(legend.title = element_blank())
