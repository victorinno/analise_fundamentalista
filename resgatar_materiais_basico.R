library(RCurl)
library(XML)
library(dplyr)


tabela_links <- read.csv(file = "materiais_basicos.csv", sep = ";")

dados_trabalhados <- mutate(tabela_links, Lucro_Liquido = gsub("%","" ,Lucro_Liquido)) %>%
                    mutate(Margem_Liquida = gsub("%","" ,Margem_Liquida)) %>%
                    mutate(ROE = gsub("%","" ,ROE)) %>%
                    mutate(DY = gsub("%","" ,DY)) %>%
                    mutate(Payout = gsub("%","" ,Payout)) %>%
                    mutate(Margem_Seguranca = gsub("%","" ,Margem_Seguranca)) %>%
                    mutate(Lucro_Liquido = as.numeric(Lucro_Liquido)/100) %>%
                    mutate(Margem_Liquida = as.numeric(Margem_Liquida)/100) %>%
                    mutate(ROE = as.numeric(ROE)/100) %>%
                    mutate(DY = as.numeric(DY)/100) %>%
                    mutate(Payout = as.numeric(Payout)/100) %>%
                    mutate(Margem_Seguranca = as.numeric(Margem_Seguranca)/100) 



for(i in 1:length(dados_trabalhados$Acao_Link)){
  url <- dados_trabalhados[i,1]
  webpage <- getURL(url)
  #webpage <- readLines(tc <- textConnection(webpage)); close(tc)
  

  pagetree <- readHTMLTable(webpage)

  data_got <- data.frame(pagetree[8][1], stringsAsFactors=FALSE)
  
  
}

