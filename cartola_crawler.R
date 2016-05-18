require(jsonlite)

download.file("https://api.cartolafc.globo.com/atletas/mercado","Rodada_01")

dados <- fromJSON("Rodada_01")

str(dados)
