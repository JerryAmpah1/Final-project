library(rnaturalearth)
library(tidyverse)
#plot(ne_countries(continent = "Africa"))

africa <- ne_countries(continent = "Africa")
electricty <- read_csv("International Energy Agency - Total electricity production, Africa.csv")

africa <- africa |> 
  select(sov_a3, name_long)
