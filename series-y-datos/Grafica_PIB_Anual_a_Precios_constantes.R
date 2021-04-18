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
df <- read_xlsx("Datos_PIB_ANUAL_A_PRECIOS _CONSTANTES.xlsx")
view(df)
#####grafica#######

###replicando tidyverse####

df %>% 
  ggplot(aes(x=Período, y= `PIB medido en millones de pesos a precios constantes`, color = "PIB a Precios Constantes-2004"))+
  geom_line(size=1)+
  geom_point(size = 2)+
  ylab('PIB a precios constantes (en millones de pesos 2004)')+
  ggtitle("PIB Anual a Precios constantes", 
          "Evolución del PIB Anual 2004-2020 en pesos a precios constantes 2004 ")+
  theme_hc()+
  scale_x_continuous(breaks = seq(2004,2020,2))+
  scale_y_continuous(labels = scales :: dollar, breaks = seq(0,700000,50000))+
  theme(legend.title = element_blank())
