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
df <- read_xlsx("Datos_PIB_per_c�pita_en pesos.xlsx")
view(df)
#####grafica#######

###replicando tidyverse####

df %>% 
  ggplot(aes(x=Per�odo, y= `PIB per c�pita en pesos`, color = "PIB Per C�pita a Precios constantes-2004"))+
  geom_line(size=1, color = "blue", linetype = "solid")+
  geom_point(size = 2, color = "blue")+
  ylab('PIB Per C�pita a precios constantes 2004')+
  ggtitle("PIB Per c�pita Anual a Precios constantes", 
          "Evoluci�n del PIB Anual 2004-2020 en pesos a precios constantes 2004 ")+
  theme_hc()+
  scale_x_continuous(breaks = seq(2004,2020,2))+
  scale_y_continuous(labels = scales :: dollar, breaks = seq(0,20000,1000))+
  theme(legend.title = element_blank())
