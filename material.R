# Minicurso R/RStudio
# --> Escolhendo diretório de trabalho
setwd("~/OneDrive/minicurso_r/")
getwd()

# ---> Instalação do R/Rstudio no ubuntu 18.04
    # --> Instalando R
# sudo apt install apt-transport-https software-properties-common
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
# sudo apt update
# sudo apt install r-base

    # --> Instalando Rstudio
# Baixar deb em https://www.rstudio.com/products/rstudio/download/#download
# sudo dpkg -i file.deb

# --> Pacotes
    # --> Instalando
install.packages("rmarkdown") # CRAN

if (!requireNamespace("BiocManager", quietly = TRUE)) # Exemplo de um fonte de pacotes para bioinformatica
  install.packages("BiocManager")
BiocManager::install("limma", version = "3.8")

    # --> Chamando
library(rmarkdown)
library(limma)

    # ---> Outros pacotes interessantes
#https://support.rstudio.com/hc/en-us/articles/201057987-Quick-list-of-useful-R-packages

# --> Variáveis
nome <- "João"
nome = "João"
class(nome)

idade <- 23
typeof(idade)
class(idade)
salario <- 4000.50
class(salario)
typeof(salario)

print(nome)
nome

letras <- c("a","b","c","d")
letras
as.numeric(letras[5])*2
class(letras)

l <- as.array(letras, 4, list(c("a","b"), c("x","y")))
l
head(l)
class(l)
l[-1]

print("meu nome é "+str(12))
print(paste("meu nome é ", nome, sep="-"))

aux = matrix(c(1,2,1,0, 3,3,6,1, 10,10,14,9, 6,7,12,11), 4, 4)
aux[2,1:3]


class(aux)
rownames(aux) <- c("a","b","c","d")
colnames(aux) <- c("c1","c2","c3","c4")
aux

# --> Operações
idade+1
idade*2
idade/2
idade-1
idade^2
idade^(1/2)
sqrt((idade^2))

# --> Estrutura de decisão e repetição
if(idade>18){
  print("Maior de idade")
}else{
  print("Menor")
}

matrix
i=1
while (i <= 10) {
  print(paste("number ",i, sep=" "))
  i=i+1
}

for (i in 10:20) {
  print(paste("number ",i, sep=" "))
  l[]
}

l <- vector("list", 10)
newl <- list()
for (i in 1:10) {
  print(paste("number ",i, sep=" "))
  l[i]<-i+2
  newl[i] <-i+1
}
print(l[1:4])
print(newl[2])

# --> Functions
x=5
fatorial_x <- function(x)  { # Fazendo nova função
  f=1
  for(i in 1:x){
    f=f*i
  }
  return(f)
}
fatorial_x(x)

factorial(x) # chamando função original do R

numeros=c("1","2","3","4")
numeros_aux=as.numeric(numeros)

sum(numeros_aux) # Somatório
median(numeros_aux) # Mediana
mean(numeros_aux) # Média
sd(numeros_aux) # Desvio padrão

# --> Escrita e leitura de arquivos
matriz <-  matrix(c(1,2,1,0, 3,3,6,1, 10,10,14,9, 6,7,12,11), 4, 4,
                  dimnames = list(Receita=c("< 15mil", "15-25mil", "25-40mil", "> 40mil"),
                                  c("M.Insatisfeito", "P.Insatisfeito", "Mod.Satisfeito", "M.Satisfeito")))
head(matriz)
View(matriz)
write.table(matriz, sep = ",", file="matriz.csv") # Também funciona write.csv e write.csv2

m <- read.csv("matriz.csv",sep = ",") # Também funciona read.table e read.csv2
head(m)
colnames(m)
names(m)
rownames(m)

# ---> Exemplos de Gráficos
dados <- read.table("Auto.csv", sep = ",", header = TRUE)
dim(dados)

head(dados$cylinders)
dados$weight

#dev.off() -> Funçãopara liberar área gráfica quando platou para algum pdf
hist(dados$weight, main="Histograma da variável Peso" , xlab="Peso", ylab="Densidade",
     col=c("pink"), col.main="darkgray") 

barplot(table(dados$year),
        space=.8, width=c(.2,.2),
        main="Veículos por ano",
        xlab="Ano", ylab="Quantidade") 
help(barplot)

boxplot(dados$weight, main="Boxplot de Pesos",
        ylab="Pesos", col=("green")) 

pie(table(dados$year),
    main="Gráfico de setores: anos") 

plot(dados$origin[1:100], dados$year[1:100], pch=1, lwd=2,
     main="Gráfico de dispersão: Origem x Ano",
     xlab="Origem", ylab="Ano")

plot(dados$origin[1:100], dados$weight[1:100], pch=1, lwd=2,
     main="Gráfico de dispersão: Origem x Peso",
     xlab="Origem", ylab="Peso")

# ---> Exemplos dde testes estatísticos
#Teste t para média populacional 
amostra = c(14.9,13.4,14.5,13.5,15.0,13.9,14.9,16.4,14.6,15.4)
t.test(amostra,mu=25) 

#Correlação de Pearson
#install.packages("nortest")
library(nortest)
library(Hmisc)
dec = "."
m_aux <- read.csv(file="teste_expressao_GDS963.txt", header=FALSE, sep=",", dec=dec,stringsAsFactors=FALSE)
m <-m_aux[2:8546,2:37]
head(m)
for (i in 1:36){
  m[, i]  <- as.numeric(m[, i])
}
m<-as.matrix(m)
x=rcorr(m, type="pearson")
help(rcorr)
pearson.test(x$r) 

pearson.test(rnorm(10, mean=10, sd=4))

# ---> Fontes utilizadas para este material
  # https://cran.r-project.org/doc/contrib/Itano-descriptive-stats.pdf
  # https://rpubs.com/gomes555/correlacao
  # http://www-bcf.usc.edu/~gareth/ISL/data.html