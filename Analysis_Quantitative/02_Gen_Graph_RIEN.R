library(tidyverse)
library(hrbrthemes)
rm(list = ls())

ds_RIEN <- read_rds("DS_Talleres_RIEN.rds")

ds_RIEN$x <- paste0(ds_RIEN$Region," - ",ds_RIEN$Grupo) 

##### --- Function for 1 - By Region----#####
get_graph_r <- function(ds,val) {
  names(ds) <- c("x","value1","value2","mymean")
  ggplot(ds) +
    geom_point( aes(x=x, y=mymean), pch = 8, size=2,shape=18 )+
    geom_segment( aes(x=x, xend=x, y=value1, yend=value2), color="grey") +
    geom_point( aes(x=x, y=value1), color=rgb(0.2,0.7,0.1,0.5), size=3 ) +
    geom_point( aes(x=x, y=value2), color=rgb(0.7,0.2,0.1,0.5), size=3 ) +
    coord_flip()+
    theme_ipsum() +
    theme(
      legend.position = "none",
    ) +
    xlab("") +
    ylab(val)
  
  ggsave(paste0("graphs/reg_",val,".png"))
}

##### --- Function by regions ----#####

get_graph_r(ds_RIEN[,c("x","Calorias_ref","Calorias_ref","Calorias")],"Calorias")
get_graph_r(ds_RIEN[,c("x","Proteina_RDA","Proteina_EAR","Proteina")],"Proteina")
get_graph_r(ds_RIEN[,c("x","CHO_EAR","CHO_RDA","CHO")],"CHO")
get_graph_r(ds_RIEN[,c("x","Grasas_AI_min","Grasas_AI_max","Grasas")],"Grasas")
get_graph_r(ds_RIEN[,c("x","Grasas_AI_min","Grasas_AI_max","Grasas")],"Grasas")
get_graph_r(ds_RIEN[,c("x","Fribra_AI","Fribra_AI","Fibra")],"Fibra")
get_graph_r(ds_RIEN[,c("x","Calcio_EAR","Calcio_RDA","Calcio")],"Calcio")
get_graph_r(ds_RIEN[,c("x","Hierro_EAR","Hierro_RDA","Hierro")],"Hierro")
get_graph_r(ds_RIEN[,c("x","Sodio_AI","Sodio_AI","Sodio")],"Sodio")

##### --- RIEN total ----#####
otros_rien <- ds_RIEN %>% select(Grupo,Calorias,Fibra,Calorias_ref,Fribra_AI)
macro_rien <- ds_RIEN %>% select(Grupo,Proteina,CHO,Grasas,Proteina_EAR,
                                 Proteina_RDA,CHO_EAR,CHO_RDA,Grasas_AI_min,Grasas_AI_max)
micro_rien <- ds_RIEN %>% select(Grupo,Calcio,Hierro,Sodio,Calcio_EAR:Sodio_AI)

##### ------------------------------------#####
#### Micronutrientes
##### ------------------------------------#####

  ds <- micro_rien %>% select(Grupo,Calcio,Hierro,Sodio)
  ds <- ds %>% group_by(Grupo) %>% summarise_if(is.numeric, mean, na.rm = TRUE)

  ds <- ds %>%  pivot_longer(
                            !Grupo,
                            names_to="val")

  ### Prepare Mmn
  ds_m <-  micro_rien %>% select(Grupo,Calcio_EAR:Sodio_AI)
  ds_m$Sodio_AI2 <- ds_m$Sodio_AI
  names(ds_m) <- c("Grupo","Calcio_Min","Calcio_Max","Hierro_Min","Hierro_Max","Sodio_Min","Sodio_Max")

    ### Min
    ds_min <- ds_m %>% select(Grupo,Calcio_Min,Hierro_Min,Sodio_Min)
    ds_min <- ds_min %>%  pivot_longer(
                              !Grupo,
                              names_to="val",
                              values_to = "value_min")
    ds_min$val <- gsub("_Min","",ds_min$val)
    ds_min <- ds_min %>% distinct_all()

    ### Max
    ds_max <- ds_m %>% select(Grupo,Calcio_Max,Hierro_Max,Sodio_Max)
    ds_max <- ds_max %>%  pivot_longer(
      !Grupo,
      names_to="val",
      values_to = "value_max")
    ds_max$val <- gsub("_Max","",ds_max$val)
    ds_max <- ds_max %>% distinct_all()

    #DS PIT
      ds_out <- merge(ds,ds_min,by=c("Grupo","val"))
      ds_out <- merge(ds_out,ds_max,by=c("Grupo","val"))

  ggplot(ds_out) +
      geom_point( aes(x=Grupo, y=value), 
      pch = 8, size=2,shape=18 )+
      geom_segment( aes(x=Grupo, xend=Grupo, 
      y=value_min, yend=value_max), color="grey") +
      geom_point( aes(x=Grupo, y=value_min), 
      color=rgb(0.2,0.7,0.1,0.5), size=3 ) +
      geom_point( aes(x=Grupo, y=value_max), 
      color=rgb(0.7,0.2,0.1,0.5), size=3 ) +
      coord_flip()+
      theme_ipsum() +
      theme(
        legend.position = "none",
      ) +
      xlab("") +facet_grid(~ val,scales = "free")

  ggsave(paste0("graphs/ALL_Micronutrientes.png"))

##### ------------------------------------#####
#### Macronutrientes
##### ------------------------------------#####

  ds <- macro_rien %>% select(Grupo,Proteina,CHO,Grasas)
  ds <- ds %>% group_by(Grupo) %>% summarise_if(is.numeric, mean, na.rm = TRUE)

  ds <- ds %>%  pivot_longer(
                            !Grupo,
                            names_to="val")

  ### Prepare Mmn
  ds_m <-  macro_rien %>% select(Grupo,Proteina_EAR:Grasas_AI_max)
  ds_m$Sodio_AI2 <- ds_m$Sodio_AI
  names(ds_m) <- c("Grupo","Proteina_Min","Proteina_Max",
                    "CHO_Min","CHO_Max",
                    "Grasas_Min","Grasas_Max")

    ### Min
    ds_min <- ds_m %>% select(Grupo,Proteina_Min,CHO_Min,Grasas_Min)
    ds_min <- ds_min %>%  pivot_longer(
                              !Grupo,
                              names_to="val",
                              values_to = "value_min")
    ds_min$val <- gsub("_Min","",ds_min$val)
    ds_min <- ds_min %>% distinct_all()

    ### Max
    ds_max <- ds_m %>% select(Grupo,Proteina_Max,CHO_Max,Grasas_Max)
    ds_max <- ds_max %>%  pivot_longer(
      !Grupo,
      names_to="val",
      values_to = "value_max")
    ds_max$val <- gsub("_Max","",ds_max$val)
    ds_max <- ds_max %>% distinct_all()

    #DS PIT
      ds_out <- merge(ds,ds_min,by=c("Grupo","val"))
      ds_out <- merge(ds_out,ds_max,by=c("Grupo","val"))

  ggplot(ds_out) +
      geom_point( aes(x=Grupo, y=value), 
      pch = 8, size=2,shape=18 )+
      geom_segment( aes(x=Grupo, xend=Grupo, 
      y=value_min, yend=value_max), color="grey") +
      geom_point( aes(x=Grupo, y=value_min), 
      color=rgb(0.2,0.7,0.1,0.5), size=3 ) +
      geom_point( aes(x=Grupo, y=value_max), 
      color=rgb(0.7,0.2,0.1,0.5), size=3 ) +
      coord_flip()+
      theme_ipsum() +
      theme(
        legend.position = "none",
      ) +
      xlab("") +facet_grid(~ val,scales = "free")

  ggsave(paste0("graphs/ALL_Macronutrientes.png"))

##### ------------------------------------#####
#### Otras - Calorias y Fibra
##### ------------------------------------#####
  ds <- otros_rien %>% select(Grupo,Calorias,Fibra)
  ds <- ds %>% group_by(Grupo) %>% summarise_if(is.numeric, mean, na.rm = TRUE)

  ds <- ds %>%  pivot_longer(
                            !Grupo,
                            names_to="val")

  ### Prepare Mmn
  ds_m <-  otros_rien %>% select(Grupo,Calorias_ref:Fribra_AI) %>%
                  mutate(Calorias_Min = Calorias_ref,
                         Calorias_Max = Calorias_ref,
                         Fibra_Min = Fribra_AI,
                         Fibra_Max = Fribra_AI)
  ds_m$Calorias_Min <- ds_m$Calorias_ref
  ds_m$Calorias_Max <- ds_m$Calorias_ref
  ds_m$Fibra_Min <- ds_m$Fribra_AI
  ds_m$Fibra_Max <- ds_m$Fribra_AI
  ds_m <- ds_m %>% dplyr::select(Grupo,Calorias_Min,Calorias_Max,
                          Fibra_Min,Fibra_Max)

    ### Min
    ds_min <- ds_m %>% select(Grupo,Calorias_Min,Fibra_Min)
    ds_min <- ds_min %>%  pivot_longer(
                              !Grupo,
                              names_to="val",
                              values_to = "value_min")
    ds_min$val <- gsub("_Min","",ds_min$val)
    ds_min <- ds_min %>% distinct_all()

    ### Max
    ds_max <- ds_m %>% select(Grupo,Calorias_Max,Fibra_Max)
    ds_max <- ds_max %>%  pivot_longer(
      !Grupo,
      names_to="val",
      values_to = "value_max")
    ds_max$val <- gsub("_Max","",ds_max$val)
    ds_max <- ds_max %>% distinct_all()

    #DS PIT
      ds_out <- merge(ds,ds_min,by=c("Grupo","val"))
      ds_out <- merge(ds_out,ds_max,by=c("Grupo","val"))

  ggplot(ds_out) +
      geom_point( aes(x=Grupo, y=value), 
      pch = 8, size=2,shape=18 )+
      geom_segment( aes(x=Grupo, xend=Grupo, 
      y=value_min, yend=value_max), color="grey") +
      geom_point( aes(x=Grupo, y=value_min), 
      color=rgb(0.2,0.7,0.1,0.5), size=3 ) +
      geom_point( aes(x=Grupo, y=value_max), 
      color=rgb(0.7,0.2,0.1,0.5), size=3 ) +
      coord_flip()+
      theme_ipsum() +
      theme(
        legend.position = "none",
      ) +
      xlab("") +facet_grid(~ val,scales = "free")

  ggsave(paste0("graphs/ALL_Otros.png"))
