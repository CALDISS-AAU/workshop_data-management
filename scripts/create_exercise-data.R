library(tidyverse)
library(stringr)

data <- read_csv('https://github.com/CALDISS-AAU/workshop_python-data-analysis/raw/master/datasets/ESS2014DK_subset.csv')
data2 <- read_csv('https://github.com/CALDISS-AAU/workshop_python-data-analysis/raw/master/datasets/ESS2014DK_polpartsub.csv')

data2 <- data2 %>%
    mutate(polpartvt = gsub("\\[\\d{1,2}\\]", "", polpartvt))

for (i in 1:nrow(data2)){
    data2$polpartvt[i] <- unlist(str_split(data2$polpartvt[i], " - "))[1]
}

typo_socdem <- function(string) {
    success = sample(c(0,1,2,3), 1)
    new_string = ifelse(success == 1, gsub("erne", "", string), string)
    return(new_string)
}

typo_konserv <- function(string) {
    success = sample(c(0,1,2,3,4), 1)
    new_string = ifelse(success == 1, gsub(" Det Konservative Folkeparti", "Konservative", string), string)
    return(new_string)
}

for (i in 1:nrow(data2)){
    if (data2$polpartvt[i] == " Socialdemokraterne"){
        data2$polpartvt[i] <- typo_socdem(data2$polpartvt[i])
    }
}

for (i in 1:nrow(data2)){
    if (data2$polpartvt[i] == " Det Konservative Folkeparti"){
        data2$polpartvt[i] <- typo_konserv(data2$polpartvt[i])
    }
}

data <- left_join(data, data2)
write_csv(data, "../data/ESS2014DK_polsub.csv")