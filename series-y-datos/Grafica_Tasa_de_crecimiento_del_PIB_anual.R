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
df <- read_xlsx("Datos_Tasa_de_Crecimiento_del_PIB_Anual_en_pesos_constantes.xlsx")
view(df)
#####grafica#######

###replicando tidyverse####

df %>% 
  ggplot(aes(x= Período, y= `tasa de crecimiento acumulado`*100, color = "Tasa de crecimiento del PIB"))+
  geom_line(size=1)+
  geom_point(size = 2)+
  ylab('%')+
  ggtitle("Tasa de crecimiento del PIB anual", 
          "Evolución de la tasa de crecimiento del PIB anual en pesos constantes ")+
  theme_hc()+
  scale_x_continuous(breaks = seq(2004,2020,2))+
  scale_y_continuous(breaks = seq(-20,20,2))+
  theme(legend.title = element_blank())
