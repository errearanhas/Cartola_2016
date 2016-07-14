require(jsonlite)
#require(plyr)

API <-"https://api.cartolafc.globo.com/atletas/mercado"
rodada <- "Rodada_14"

dados <- fromJSON(rodada);

# criando proposta de data frame
atletas <- data.frame(nome=dados$atletas$nome,
                      apelido=dados$atletas$apelido,
                      status=dados$atletas$status_id,
                      posicao=dados$atletas$posicao_id,
                      rodada_id=dados$atletas$rodada_id,
                      clube_casa=dados$atletas$partida$clube_casa_id,
                      clube=dados$atletas$clube_id,
                      pontos_ult=dados$atletas$pontos_num,
                      preco=dados$atletas$preco_num,
                      variacao=dados$atletas$variacao_num,
                      media=dados$atletas$media_num,
                      qtd_jogos=dados$atletas$jogos_num,
                      PE=dados$atletas$scout$PE,
                      DD=dados$atletas$scout$DD,
                      GS=dados$atletas$scout$GS,
                      FC=dados$atletas$scout$FC,
                      RB=dados$atletas$scout$RB,
                      SG=dados$atletas$scout$SG,
                      FD=dados$atletas$scout$FD,
                      FF=dados$atletas$scout$FF,
                      FS=dados$atletas$scout$FS,
                      I=dados$atletas$scout$I,
                      CA=dados$atletas$scout$CA,
                      A=dados$atletas$scout$A,
                      G=dados$atletas$scout$G,
                      FT=dados$atletas$scout$FT,
                      CV=dados$atletas$scout$CV,
                      DP=dados$atletas$scout$DP,
                      PP=dados$atletas$scout$PP);

#exportando em xls
write.table(atletas, file="rodada_14.xls",sep="\t");

#consolidando todas as rodadas (proposta de data frame acima) e exportando em um arquivo só
apoio <- c()

for (i in 1:14) {
  apoio <- append(apoio,paste(getwd(),"/rodada_",i,".xls",sep=""))
}

juncao <- do.call(rbind, lapply(apoio, read.csv, header = TRUE,sep=""))

write.table(juncao, file="total.xls",sep="\t");

# data frames com os dados dos clubes, posições dos atletas, status dos atletas e escudos dos times
clubes.dados <- do.call(rbind, dados$clubes)
posicoes.dados <- do.call(rbind, dados$posicoes)
status.dados <- do.call(rbind, dados$status)
escudos.links <- do.call(rbind,dados$clubes)

