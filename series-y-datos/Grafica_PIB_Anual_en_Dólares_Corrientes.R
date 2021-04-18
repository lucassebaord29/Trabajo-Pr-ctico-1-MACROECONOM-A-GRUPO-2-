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
df <- read_xlsx("Datos_PIB_Anual_Dolares_Precios_corrientes.xlsx")
view(df)
#####grafica#######

###replicando tidyverse####

df %>% 
  ggplot(aes(x = Periodo, y= `PIB a dólar corriente/1000`  , color = "PIB en Dólares corrientes"))+
  geom_line(size=1)+
  geom_point(size = 2)+
  ylab('PIB a precios corrientes (en millones)')+
  ggtitle("PIB Anual en Dólares Corrientes", 
          "Evolución del PIB 2004-2020 a precios Corrientes en Dólares")+
  theme_hc()+
  scale_x_continuous(breaks = seq(2004,2020,2))+
  scale_y_continuous(labels = scales :: dollar, breaks = seq(0,700000,75000))+
  theme(legend.title = element_blank())
