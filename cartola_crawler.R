require(jsonlite)

#download.file("https://api.cartolafc.globo.com/atletas/mercado","Rodada_01")

# Lendo dado pelo formato Json
dados <- fromJSON("Dropbox/cartola/Cartola_2016/Cartola_2016/Rodada_01")

# separando dados dos atletas
atletas.dados <- dados$atletas 
