library(tidyverse)

visitors_with_nations <- visitors %>%
  mutate(
    nation = case_when(
      region == "Northern Ireland" ~ "Northern Ireland",
      region == "Scotland" ~ "Scotland",
      region == "Wales" ~ "Wales",
      TRUE ~ "England"
    )
  )

visitors_with_nations |> 
  select(nation, n_2021, n_2022) |> 
  summarise(
    title <- "Last column is the % change",
    tot_2021 = sum(n_2021, na.rm = "True"),
    tot_2022 = sum(n_2022, na.rm = "True"),
    p_change = (tot_2022 - tot_2021)*100 / tot_2021
  )

visitors_with_nations |> 
  filter(nation == "Scotland") |>
  group_by(admission) |>
  summarise(
    v_2021 = sum(n_2021, na.rm = TRUE),
    v_2022 = sum(n_2022, na.rm = TRUE),
    ptg_ch = (v_2022 - v_2021) * 100 / v_2021
  ) |>
  arrange(ptg_ch)
