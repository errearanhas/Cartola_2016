install.packages("googleVis");
library(googleVis);
require(jsonlite);

getwd();
setwd("C:/BKP-Renato/Renato Aranha/Desktop/Meus Documentos/Pessoal/R/cartola_2016");
setwd("C:/BKP-Renato/Renato Aranha/Desktop/Meus Documentos/Pessoal/R/cartola_2016/backup_rodadas/");

API <-"https://api.cartolafc.globo.com/atletas/mercado"
rodada <- "Rodada_25"

download.file(API,rodada);
dados <- fromJSON(rodada);

posicoes <- do.call(rbind,dados$posicoes)
clubes <- do.call(rbind,dados$clubes)
status <- do.call(rbind,dados$status)

atletas <- data.frame(#nome=dados$atletas$nome,
                      apelido=dados$atletas$apelido,
                      status=dados$atletas$status_id,
                      posicao=dados$atletas$posicao_id,
                      #rodada_id=dados$atletas$rodada_id,
                      clube_casa=dados$atletas$partida$clube_casa_id,
                      clube=dados$atletas$clube_id,
                      mando=ifelse(dados$atletas$partida$clube_casa_id==dados$atletas$clube_id,"C","F"),
                      pontos_ult=round(dados$atletas$pontos_num,2),
                      preco=round(dados$atletas$preco_num,2),
                      variacao=round(dados$atletas$variacao_num,2),
                      media=round(dados$atletas$media_num,2),
                      qtd_jogos=dados$atletas$jogos_num,
                      PE=dados$atletas$scout$PE,
                      ind1=round(ifelse(dados$atletas$scout$PE!=0,dados$atletas$scout$PE/dados$atletas$jogos_num,"-"),2),
                      DD=dados$atletas$scout$DD,
                      GS=dados$atletas$scout$GS,
                      FC=dados$atletas$scout$FC,
                      ind6=round(ifelse(dados$atletas$scout$FC!=0,dados$atletas$scout$FC/dados$atletas$jogos_num,"-"),2),
                      RB=dados$atletas$scout$RB,
                      ind2=round(ifelse(dados$atletas$scout$RB!=0,dados$atletas$scout$RB/dados$atletas$jogos_num,"-"),2),
                      SG=dados$atletas$scout$SG,
                      FD=dados$atletas$scout$FD,
                      ind3=round(ifelse(dados$atletas$scout$FD!=0,dados$atletas$scout$FD/dados$atletas$jogos_num,"-"),2),
                      FF=dados$atletas$scout$FF,
                      ind4=round(ifelse(dados$atletas$scout$FF!=0,dados$atletas$scout$FF/dados$atletas$jogos_num,"-"),2),
                      FS=dados$atletas$scout$FS,
                      ind5=round(ifelse(dados$atletas$scout$FS!=0,dados$atletas$scout$FS/dados$atletas$jogos_num,"-"),2),
                      I=dados$atletas$scout$I,
                      CA=dados$atletas$scout$CA,
                      A=dados$atletas$scout$A,
                      G=dados$atletas$scout$G,
                      FT=dados$atletas$scout$FT,
                      CV=dados$atletas$scout$CV,
                      DP=dados$atletas$scout$DP,
                      PP=dados$atletas$scout$PP);

atletas2<-merge(atletas,clubes[,c(1:2)], by.x = "clube",by.y="id");
atletas3<-merge(atletas2,status,by.x="status",by.y="id",select=c(-status,-clube));
atletas4<-merge(atletas3,posicoes[,c(1,3)],by.x="posicao",by.y="id");
atletas5<-subset(atletas4,select=c(-posicao,-status,-clube_casa,-clube));
names(atletas5)[24:26]<-c("time","status","posição")

typeof(atletas5$time)

write.table(atletas,file="rodada_25.xls",na="",dec=",",sep="\t",row.names=FALSE);


apoio <- c()

for (i in 1:15) {
  apoio <- append(apoio,paste(getwd(),"/rodada_",i,".xls",sep=""))
}

juncao <- do.call(rbind, lapply(apoio, read.csv, header = TRUE,sep=""))
write.table(juncao, file="total.xls",sep="\t");


atletas[1:4,1:2];
nrow(juncao);
ncol(juncao);

atletas <- atletas[atletas$posicao == "5",]