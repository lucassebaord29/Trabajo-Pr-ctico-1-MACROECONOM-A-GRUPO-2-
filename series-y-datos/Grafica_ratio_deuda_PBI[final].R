####librerias utilizadas#####
library(ggplot2)
library(tidyverse)
library(readxl)
library(ggthemes)
theme_set(theme_minimal())
#####zona de trabajo#######
setwd("~/graficas macro")
#####datos#######
df <- read_xlsx("datos_ratio.xlsx")
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
  ggplot(aes(x=Periodo, y= valor*100, color = Tasa))+
  geom_line(size=1)+
  geom_point()+
  ylab('%')+
  ggtitle("Ratio Deuda/PBI", "Evolución del Ratio Deuda/PBI en %")+
  theme_hc()+
  scale_x_continuous(breaks = unique(df_wider$Periodo))+
  theme(legend.title = element_blank())
  

