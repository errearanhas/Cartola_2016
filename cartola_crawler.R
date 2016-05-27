require(jsonlite)
#require(plyr)
setwd("~/Dropbox/cartola/Cartola_2016/Cartola_2016/")
source("caminho.R",local = TRUE)

rodada <- "Rodada_03"

site <- "https://api.cartolafc.globo.com/atletas/mercado"

baixar.json <- function(cam, rodada){
  download.file(cam, rodada)
}

paste(caminho,rodada,sep = "")
# mudando tudo
# Lendo dado pelo formato Json

baixar.json(site,rodada)

dados <- fromJSON(paste(caminho,rodada,sep = ""))

# separando dados dos atletas
atletas.dados <- dados$atletas 

clubes.dados <- do.call(rbind, dados$clubes)
posicoes.dados <- do.call(rbind, dados$posicoes)
status.dados <- do.call(rbind, dados$status)

escudos.links <- do.call(rbind,dados$clubes)

