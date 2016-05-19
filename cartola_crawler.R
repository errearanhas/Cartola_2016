require(jsonlite)
require(plyr)
source(caminho.R)

rodada <- "Rodada_01"

baixar.json <- function(caminho, rodada){
  download.file(caminho,rodada)
}


# mudando tudo
# Lendo dado pelo formato Json
dados <- fromJSON(paste(caminho,rodada))

# separando dados dos atletas
atletas.dados <- dados$atletas 

clubes.dados <- do.call(rbind, dados$clubes)
posicoes.dados <- do.call(rbind, dados$posicoes)
status.dados <- do.call(rbind, dados$status)

escudos.links <- do.call(rbind,dados$clubes)

