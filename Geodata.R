library(rnaturalearth)
library(tidyverse)
#plot(ne_countries(continent = "Africa"))

africa <- ne_countries(continent = "Africa")
electricity_tbl <- read_csv("International Energy Agency - Total electricity production, Africa.csv")

africa <- africa |> 
  select(sov_a3, name_long)

africa_electricity <- left_join(africa, electricity_tbl, by = join_by("sov_a3" =="ISO3")) |>
  filter(!is.na(Electricity))

plot(africa_electricity)

ggplot(data = africa_electricity) +
  geom_sf(aes(fill=Electricity))
  scale_color_distiller(1)


ggplot(data = africa_electricity) +
  geom_col(mapping = aes(y=sov_a3, x= Electricity))


