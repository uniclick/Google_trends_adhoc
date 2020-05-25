library(gtrendsR)
library(tidyverse)
#define the keywords
keywords=c("Credito empresas","Credito Pyme")
#set the geographic area: DE = Germany
country=c('MX')
#set the time window
time=("2020-01-01 2020-04-30")
#set channels 
channel='web'

trends = gtrends(keywords, gprop =channel,geo=country, time = time )
#select only interst over time 
time_trend=trends$interest_over_time
head(time_trend)

library(ggplot2)

plot<-ggplot(data=time_trend, aes(x=date, y=hits,group=keyword,col=keyword))+
  geom_line()+xlab('Time')+ylab('Relative Interest')+ theme_bw()+
  theme(legend.title = element_blank(),legend.position="bottom",legend.text=element_text(size=12))+ggtitle("Google Search Volume")
plot

time_trend2=time_trend[time_trend$hits<45,]

plot<-ggplot(data=time_trend2, aes(x=date, y=hits,group=keyword,col=keyword))+
  geom_smooth(span=0.5,se=FALSE)+xlab('Time')+ylab('Relative Interest')+
  theme_bw()+theme(legend.title = element_blank(),legend.position="bottom",
                   legend.text=element_text(size=12))+ggtitle("Google Search Volume")
plot