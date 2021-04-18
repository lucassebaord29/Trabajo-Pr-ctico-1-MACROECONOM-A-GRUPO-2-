####librerias utilizadas#####
library(ggplot2)
library(tidyverse)
library(readxl)
library(ggthemes)
theme_set(theme_minimal())
#####zona de trabajo#######
setwd("~/graficas macro")
#####datos#######
df <- read_xlsx("Datos_Tasa_de_inversion.xlsx")
view(df)
#####grafica#######
#----- version tidyverse

df_wider = df %>% 
  pivot_longer(cols = colnames(df)[2:ncol(df)],
               names_to = 'Tasa',
               values_to='valor') %>%
  rename(Periodo=colnames(df)[1])  
###theme_tufte()
df_wider %>% 
  ggplot(aes(x=Periodo, y= valor, color = Tasa))+
  geom_line(size=1)+
  geom_point()+
  ylab('%')+
  ggtitle("Tasa de inversión(FBKF) 2004-2020","Evolución de la Tasa de inversión(FBKF) a precios constantes y a precios corrientes en %")+
  theme_hc()+
  scale_x_continuous(breaks = seq(2004,2020,2))+
  scale_y_continuous(breaks = seq(-60,60,10))
  theme(legend.title = element_blank())
