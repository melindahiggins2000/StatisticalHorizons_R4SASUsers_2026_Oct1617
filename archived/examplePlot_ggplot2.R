# ggplot2 plots of data over time
library(ggplot2)
library(ggpubr)

df3 <- ToothGrowth
head(df3, 10)
# Add jitter points and errors (mean_se)
ggline(df3, x = "dose", y = "len",
       add = c("mean_se", "jitter"))

ggline(
  df3,
  x = "dose",
  y = "len",
  color = "supp",
  shape = "supp",
  add = c("mean_ci", "jitter"),
  # add.params = list(
  #   shape = 21,
  #   color = "black",
  #   size = 3,
  #   aes(fill = factor(supp))
  # )
) +
  facet_wrap(vars(supp)) + 
  scale_shape_manual(values = c(21, 24)) + 
  scale_color_manual(values = c("#cf34eb",
                                "#34eb4c")) +
  # scale_fill_manual(values = c("lightblue",
  #                              "yellow")) + 
  # scale_color_manual(values = c("black",
  #                               "red")) +
  labs(x = "Dose (mg/day)",
       y = "Length",
       title = "Incisor Odontoblast Growth by Vitamin C Dose",
       subtitle = "Study of Guinea Pigs",
       caption = "Citation: The Journal of Nutrition, 33(5), 491–504. doi:10.1093/jn/33.5.491")



# get summary stats
library(dplyr)
df3.summary <- df3 %>%
  group_by(dose) %>%
  summarise(
    sd = sd(len, na.rm = TRUE),
    len = mean(len)
  )
df3.summary

# USE THIS ==================================
library(ggtext)
#library(ggthemes)

# Combine with jitter points
ggplot(df3, aes(x=dose, 
                y=len)) +
  # geom_pointrange(aes(ymin = len-sd, ymax = len+sd),
  #                 data = df3.summary) +
  geom_line(data = df3.summary,
            aes(group = 1),
            linewidth = 1.5) + 
  geom_point(data = df3.summary,
             size = 2) + 
  geom_errorbar(aes(ymin = len-sd, ymax = len+sd),
                width = 0.2,
                linewidth = 1.5,
                data = df3.summary) + 
  geom_jitter(position = position_jitter(0.2), 
              #color = "darkgray",
              aes(color = supp, 
                  shape = supp,
                  fill = supp),
              size = 3) + 
  scale_shape_manual(values = c(21, 24)) +
  scale_color_manual(values = c("black",
                                "blue")) +
  scale_fill_manual(values = c("#cf34eb",
                               "#34eb4c")) +
  facet_wrap(vars(supp)) +
  labs(x = "Dose (mg/day)",
       y = "Length",
       title = "Guinea Pig Incisor Odontoblast Growth by Vitamin C Dose",
       subtitle = "Means +/- SD",
       caption = "Citation: Crampton, E. W. (1947). The growth of the odontoblast of the incisor teeth <br>as a criterion of vitamin C intake of the guinea pig. <br>*The Journal of Nutrition*, **33**_(5)_, 491–504. <br>*doi:10.1093/jn/33.5.491*.",
       color = "Supplement Type",
       shape = "Supplement Type",
       fill = "Supplement Type") +
  theme(plot.caption = element_markdown())







library(ggpubr)
library(ggplot2)

# Create example data
df <- data.frame(
  x = rep(1:5, 2),
  val = c(10, 12, 15, 13, 11, 8, 9, 14, 16, 10),
  group = rep(c("A", "B"), each = 5)
)

# Define custom fill colors
custom_fill_colors <- c("A" = "lightblue", "B" = "salmon")

# Create the ggline plot with custom fill colors for shape 21 points
ggline(
  data = df,
  x = "x",
  y = "val",
  group = "group",
  add = "point",
  add.params = list(shape = 21, 
                    color = "black", 
                    size = 3, 
                    #aes(fill = factor(group)),
                    fill = "yellow")
  ) +
  scale_fill_manual(values = custom_fill_colors)


library(ggplot2)

#create data frame
df2 <- data.frame(x=c(1, 2, 4, 7, 7, 10),
                 y=c(5, 8, 10, 14, 13, 19),
                 group=c('A', 'A', 'A', 'B', 'B', 'B'))

#create scatter plot with multiple fill and border colors
ggplot(df2, aes(x=x, y=y)) + 
  geom_point(color='black', shape=21, size=4, 
             aes(fill=factor(group))) + 
  scale_fill_manual(values=c('pink', 'lightgreen'))

