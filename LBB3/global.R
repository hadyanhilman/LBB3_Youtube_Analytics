
#load library

library(ggplot2)
library(scales)
library(glue)
library(plotly)
library(dplyr)
library(lubridate)
library(shiny)
library(shinydashboard)
library(visdat)
library(tidyverse)
library(hrbrthemes)


#Wrangling data for Graph

data <- read.csv("archive/youtubetrends.csv", stringsAsFactors = T,encoding = 'latin1')

vids_clean <- data %>% 
  select(-c(comments_disabled, ratings_disabled, video_error_or_removed)) %>%
  mutate(trending_date = ymd(trending_date),
         publish_time = ymd_hms(publish_time),
         timetotrend = as.integer(timetotrend),
         title = as.character(title),
         channel_title = as.character(channel_title),
         likesp = likes/views,
         dislikesp = dislikes/views,
         commentp = as.numeric(comment_count/views))
publish_time <- vids_clean %>% group_by(publish_when) %>% 
  summarise(average_views = mean(views)) %>% 
  arrange(desc(average_views)) %>% 
  ungroup() %>% mutate(label = glue("Publish When: {publish_when}
                      Average View: {comma(average_views)}"))
vids_count <- data %>% 
  group_by(category_id) %>% 
  summarise(count_cat = n()) %>% 
  arrange(desc(count_cat)) %>% 
  ungroup()

vids_count2 <- vids_count %>% 
  mutate(label = glue("Category {category_id}
                      Video Count: {count_cat}"))

