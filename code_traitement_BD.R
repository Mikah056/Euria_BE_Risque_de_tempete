###########  Traitement de la base  ###########


<<<<<<< HEAD
######################importation des 73 bases data-events-Details
=======


#importation des 73 bases data-events-Details
>>>>>>> 097f81306eec8222e372e4ecc40a39d34425dc19
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

View(Alldata2[[1972]])
names(Alldata[[2021]])

#Suppression des variables inutiles
Alldata1=NULL
for (i in 1950:2022) {
  Alldata1[[i]]=Alldata[[i]][,-c(3,6,7,10,14,15,16,17,18,19,20,27,28,29,30,31,35,36,37,38,49,50,51)]
}

#Suppression des lignes des ï¿½venements autres que les tornades
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

#Pourcentage des observations manquantes après 1985
datam=Data[,c(16,17,18,19,20,21,22,23,24,25,26,27)]
(apply(apply(datam[which(Data$YEAR>1985),],2,is.na),2,sum)/apply(apply(datam,2,is.na),2,sum))*100
apply(apply(datam[which(Data$YEAR>1995),],2,is.na),2,sum)


##################################### Fin de la constitution de la base Details




######################importation des 51 bases data-events-Locations
Alldata0=list(51)

for(i in 1972:2013){
  Alldata0[[i]]=read.csv(paste0("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d",i,"_c20220425.csv"),header=T)
}
Alldata0[[2014]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d2014_c20220719.csv",header=T)
Alldata0[[2015]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d2015_c20220425.csv",header=T)
Alldata0[[2016]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d2016_c20220719.csv",header=T)
Alldata0[[2017]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d2017_c20220719.csv",header=T)
Alldata0[[2018]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d2018_c20220425.csv",header=T)
Alldata0[[2019]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d2019_c20220425.csv",header=T)
Alldata0[[2020]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d2020_c20220816.csv",header=T)
Alldata0[[2021]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d2021_c20220921.csv",header=T)
Alldata0[[2022]]=read.csv("C:/Hakim/D1/Euria/M1/BE/Data/Storm Events _ Locations/StormEvents_Locations-ftp_v1.0_d2022_c20220921.csv",header=T)

#Ces bases sont vides en deçà de 1996
View(Alldata0[[1996]])
names(Alldata0[[2021]])
p=NULL
for (i in 1996:2022) { 
 p=View(Alldata0[[i]])
  }

#Fusion des 51 bases
DataL=Alldata0[[1996]]
for (i in 1997:2022) {
  DataL=rbind(DataL,Alldata0[[i]])
}

#Suppression des lignes des évenements autres que les tornades à partir de EVENT_ID
z=NULL
for (i in 1:nrow(DataL)) {
  z=rbind(z,DataL[which(DataL$EVENT_ID[i]==Data$EVENT_ID),])
}
View(z)

#No,bre de valeurs manquantes a partir de 1996
dataL_na=apply(apply(z,2,is.na),2,sum)
dataL_na


str(Data)
View(Data)
##################################### Fin de la constitution de la base




#Importation de la base Details
Data=read.csv(file='C:/Hakim/D1/Euria/M1/BE/Data/Base_BE.csv',header=TRUE)
View(Data)

#Exportation de la base Details obtenue
write.csv(Data,file='C:/Hakim/D1/Euria/M1/BE/Data/Base_BE.csv',row.names = FALSE)



#Importation de la base Locations
z=read.csv(file='C:/Hakim/D1/Euria/M1/BE/Data/Base_BE2.csv',header=TRUE)
View(z)

#Exportation de la base Locations obtenue
write.csv(z,file='C:/Hakim/D1/Euria/M1/BE/Data/Base_BE2.csv',row.names = FALSE)


#####################################



#####################  Traitement des valeurs manquantes


#Les bases Locations sont vides en deçà de 1972; on peut supposer que les coordonnées
#n'étaient pas encore enregistrés de façon précise, et ont été estimés à partir des
#différentes sources d'information et des récits sur les évènements.

#On a vu qu'au dela de 1995, locations a plus de NA que Details

##Répartition des NA par année
Nombre_NA=c()
for (i in 1955:2022) { 
  Nombre_NA=c(Nombre_NA,sum(apply(apply(datam[which(Data$YEAR==i),],2,is.na),2,sum)))
}
annee=1955:2022
v1=cbind(annee,Nombre_NA)
plot(v1,main="Répartition des NA par année")
lines(v1,col="blue",main="Répartition des NA par année")

#Proportion de NA dans chaque variable
l=nrow(datam[which(Data$YEAR>=2000),])
na1=apply(apply(datam[which(Data$YEAR>=2000),],2,is.na),2,sum)
na2=100*na1/l
na2
#Exportation 
write.csv(na2,file='C:/Hakim/D1/Euria/M1/BE/Data/na2.csv',row.names = TRUE)




#Nombre de tornade n'ayant pas d'information d'arrivée sachant qu'elles n'ont pas
#d'information de départ
length(Data$END_LON[which(is.na(Data$BEGIN_LON))])


##Evolution des fréquences de tornade
frequence=c()
for (i in 1980:2022) {
  frequence=c(frequence,sum(Data$YEAR==i))
}
v2=cbind(annee,frequence)
plot(v2)
lines(v2,col="red",main="Evolution des fréquences de tornade")


#Proportion des tornades dont nous n'avons aucune information géographique
(1191/length(Data$YEAR>=1980))*100
##On se propose de les supprimer et d'appliquer les méthodes de lissage aux autres valeurs manquantes





#Suppression des individus n'ayant pas d'observation au départ 
length(which(is.na(Data$BEGIN_LAT) & is.na(Data$BEGIN_LON) & is.na(Data$END_LAT) & is.na(Data$END_LON)))
Data = Data[-which(is.na(Data$BEGIN_LON)),]


##Staistiques descriptives

#Evolution des fréquence au fil des années
p1=table(Data$YEAR)
p2=ts(p1, start=1950, end=2022, frequency=1)
plot(p2)
summary(summary(as.factor(Data$YEAR)))

#Evolution de la sévérité au fil des années







#Importation de la base
Data=read.csv(file='C:/Hakim/D1/Euria/M1/BE/Data/Base_BE.csv',header=TRUE)
View(Data)

#Exportation de la base obtenue
write.csv(Data,file='C:/Hakim/D1/Euria/M1/BE/Data/Base_BE.csv',row.names = FALSE)



