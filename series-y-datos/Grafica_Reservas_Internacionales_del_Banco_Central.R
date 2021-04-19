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
df <- read_xlsx("Datos_Reservas_Internacionales.xlsx")
view(df)
#####grafica#######

###replicando tidyverse####

df %>% 
  ggplot(aes(x = Periodo, y= `Resevas como pocentaje del PBI`*100, color = "Reservas como porcentaje del PIB"))+
  geom_line(size=1)+
  geom_point(size = 2)+
  ylab('%')+
  ggtitle("Reservas Internacionales del Banco Central", 
          "Evolución de las reservas internacionales brutas del Banco Central como porcentaje del PIB")+
  theme_hc()+
  scale_x_continuous(breaks = seq(2004,2020,2))+
  scale_y_continuous(breaks = seq(0,20,1))+
  theme(legend.title = element_blank())
