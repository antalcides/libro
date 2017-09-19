library(agricolae) # cargar el paquete agricole a la memoria
peso<-c(58,42,51,40,40,49,56,58,57,59,63,58,66,70,73,71,69,70, 68,64)
par(mfrow=c(1,2),mar=c(4,3,0,1),cex=0.6)
h1<- graph.freq(peso,col="yellow",frequency=1,las=2,xlab="h1")
print(summary(h1))
h7<- graph.freq(peso, nclass=5,frequency =1,xlab="h7")
round(table.freq(h7), 2)
