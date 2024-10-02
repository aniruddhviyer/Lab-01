library(tidyverse)

visitors_with_nations |> 
  select(nation, admission) |> 
  group_by(nation) |>
  summarise(
    tot_atrcn = n(),
    fr_atrcn = sum(admission == "Free"),
    ratip = fr_atrcn *100 / tot_atrcn
    ) |>
  view()
 
