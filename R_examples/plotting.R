# Setting up
# 1. install ggplot
install.packages("ggplot2")
# 2. load ggplot
library(ggplot2)
# 3. load gapminder data
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

# Example using ggplot
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
    geom_point()

## Building up the command
## Base command
ggplot()

## Add data, set axes
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap))

## Specify type of plot to use
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
    geom_point()

# Challenge

ggplot(data = gapminder, aes(x = year, y = lifeExp)) +
    geom_point()

ggplot(data = gapminder,
       aes(col = continent, x = year, y =lifeExp)) +
    geom_point()

## Different geoms

ggplot(data = gapminder,
       aes(col = continent, x = year, y = lifeExp,
           by = country)) +
    geom_line() +
    geom_point()

ggplot(data = gapminder,
       aes(col = continent, x = year, y = lifeExp,
           by = country)) +
    geom_point() +
    geom_line()

ggplot(data = gapminder,
       aes(x = year, y = lifeExp, by = country)) +
    geom_point() +
    geom_line(aes(colour = continent))

## Transformations and statistics

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
    geom_point()

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
    geom_point() +
    scale_y_log10()

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
    geom_point() +
    scale_y_log10() +
    geom_smooth(method = "lm")

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
    geom_point() +
    scale_y_log10() +
    geom_smooth(method = "lm", size = 1.5, colour = "red")

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
    geom_point(aes(colour = continent)) +
    scale_y_log10() +
    geom_smooth(method = "lm", size = 1.5, colour = "red")

## Challenge

ggplot(data = gapminder,
       aes(x = year, y= lifeExp, by = country)) +
    geom_point(size=4, colour=gapminder$pop) +
    geom_line(aes(colour=continent))

ggplot(data = gapminder,
       aes(x=year, y=lifeExp,by=country))+
    geom_point(size=0.2, colour="red")+
    geom_line(size=0.2, aes(colour=continent))

## Setting colours

ggplot(data = gapminder,
       aes(x=year, y=lifeExp,by=country)) +
    geom_line(size=0.2, aes(colour=continent)) +
    scale_color_manual(values = c("red", "purple",
                                  "#EA6623", rgb(0.1, 0.8, 0.6),
                                  "yellow"))

## Multi-panel plot

ggplot(data = gapminder,
       aes(x = year, y = lifeExp, colour = continent)) +
    geom_line() +
    facet_wrap(~ country)

## Labelling

ggplot(data = head(gapminder, n = 20),
       aes(x = year, y = lifeExp, colour = continent)) +
    geom_line() +
    facet_wrap(~ country) +
    xlab("Year") +
    ylab("Life expectancy") +
    ggtitle("Figure 1")

ggplot(data = head(gapminder, n = 20),
       aes(x = year, y = lifeExp, colour = continent)) +
    geom_line() +
    facet_wrap(~ country) +
    xlab("Year") +
    ylab("Life expectancy") +
    ggtitle("Figure 1") +
    theme_light() +
    theme(axis.text.x = element_blank(),
          axis.ticks.x = element_blank())

## Challenge

ggplot(data = gapminder, aes(x=gdpPercap, colour=continent))+
    geom_density()+
    scale_x_log10()+
    facet_wrap(~continent)

ggplot(data = gapminder, aes(gdpPercap, by = country))+
    geom_density(aes(colour = country), show.legend = F)+
    facet_wrap(~continent)+
    scale_x_log10()+
    theme_light()

ggplot(data=gapminder, aes(x=pop, y=gdpPercap, colour=continent)) +
    geom_density_2d() +
    xlab ("Population") +
    ylab ("GDP Per-capita") +
    ggtitle("Figure 1")+
    theme_light()

ggsave("2d_density.png")

ANZAC <- gapminder[gapminder$country %in% c("Australia", "New Zealand"), ]

ggplot(data = ANZAC,
       aes(x = gdpPercap, color = continent)) +
    geom_density() +
    facet_wrap(~ country) +
    xlab("GDPperCap") +
    ggtitle("Figure 1")

## A fancy example

ggplot(data = gapminder,
       aes(x = year, y = gdpPercap, colour = continent, size = pop)) +
    geom_point(alpha = 0.2) +
    geom_smooth(method = "lm") +
    scale_y_log10(labels = function(n){format(n, scientific = FALSE)}) +
    geom_abline(slope = 0,
                intercept = log10(6124.371),
                size = 1,
                colour = "red",
                alpha = 0.5) +
    annotate("text",
             x = 1980, y = 7000,
             label = "2007 MEDIAN",
             size = 2,
             colour = "red") +
    facet_wrap(~ continent, nrow = 1) +
    scale_colour_brewer(palette = "Set1") +
    guides(colour = FALSE, size = FALSE) +
    ggtitle("GDP per capita over time (by continent)") +
    ylab("GDP per capita ($US)") +
    theme_minimal(base_size = 14) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          axis.title.x = element_blank(),
          panel.grid.minor = element_blank())

## Saving plots

# The `ggsave` function can be used to save the last plot to file
ggsave("fancy.png")
