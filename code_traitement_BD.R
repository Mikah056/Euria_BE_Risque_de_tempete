###########  Traitement de la base  ###########




#importation des 73 bases data-events-Details
Alldata=list(73)
for(i in 1950:1971){
  Alldata[[i]]=read.csv(paste0("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d",i,"_c20210803.csv"),header=T)
}
for(i in 1972:2013){
  Alldata[[i]]=read.csv(paste0("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d",i,"_c20220425.csv"),header=T)
}
Alldata[[2014]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d2014_c20220719.csv",header=T)
Alldata[[2015]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d2015_c20220425.csv",header=T)
Alldata[[2016]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d2016_c20220719.csv",header=T)
Alldata[[2017]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d2017_c20220719.csv",header=T)
Alldata[[2018]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d2018_c20220425.csv",header=T)
Alldata[[2019]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d2019_c20220425.csv",header=T)
Alldata[[2020]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d2020_c20220816.csv",header=T)
Alldata[[2021]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d2021_c20220921.csv",header=T)
Alldata[[2022]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Details/StormEvents_details-ftp_v1.0_d2022_c20220921.csv",header=T)

View(Alldata2[[2021]])
names(Alldata[[2021]])

#Suppression des variables inutiles
Alldata1=NULL
for (i in 1950:2022) {
  Alldata1[[i]]=Alldata[[i]][,-c(3,6,7,10,14,15,16,17,18,19,20,27,28,29,30,31,35,36,37,38,49,50,51)]
}

#Suppression des lignes des �venements autres que les tornades
Alldata2=NULL
for (i in 1950:2022) {
  Alldata2[[i]]=Alldata1[[i]][-which(Alldata1[[i]]$EVENT_TYPE!='Tornado'),]
}

#Fusion des 73 bases
Data=Alldata2[[1950]]
for (i in 1951:2022) {
  Data=rbind(Data,Alldata2[[i]])
}

#Suppression de la colonne 'tornade'
Data=Data[,-9]

str(Data)
View(Data)

#Nombre de NA par variable
nrow(Data)
is.na(Data)
data_na=apply(apply(Data,2,is.na),2,sum)
barplot(data_na[c(16,17,18,19,20,21,22,23,24,25,26,27)],las = 3)

library(ggplot2)
data_na=as.data.frame(data_na)
p = ggplot(data=data_na[c(16,17,18,19,20,21,22,23,24,25,26,27)], aes(y=data_na)) +
    geom_bar(stat='identity')
p






#Importation de la base
Data=read.csv(file='C:/Hakim/D1/Euria/M1/BE/Data/Base_BE.csv',header=TRUE)
View(Data)

#Exportation de la base obtenue
write.csv(Data,file='C:/Hakim/D1/Euria/M1/BE/Data/Base_BE.csv',row.names = FALSE)



