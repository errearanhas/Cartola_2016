require(jsonlite)

#download.file("https://api.cartolafc.globo.com/atletas/mercado","Rodada_01")

# Lendo dado pelo formato Json
dados <- fromJSON("Dropbox/cartola/Cartola_2016/Cartola_2016/Rodada_01")

# separando dados dos atletas
atletas.dados <- dados$atletas 

partida.dados <- dados$atletas$partida

dados$clube

# #Calcular a média dos dois grupos
# # http://stackoverflow.com/questions/3505701/r-grouping-functions-sapply-vs-lapply-vs-apply-vs-tapply-vs-by-vs-aggrega
# # http://stackoverflow.com/questions/15214472/use-object-names-within-a-list-in-lapply-ldply
# lapply(dlply(info, .(pagina), function(x) x), function(x) mean(x$Votos.nominais, na.rm=T))

