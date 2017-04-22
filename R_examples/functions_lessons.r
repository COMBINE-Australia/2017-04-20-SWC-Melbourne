# Manually converting temperature
temp <- 32
kelvin <- ((temp -32) * (5/9)) + 273.15

# Using a function
farh_to_kelvin <- function(temp) {
    kelvin <- ((temp -32) * (5/9)) + 273.15
    return(kelvin)
    #kelvin
}

# A function will multiple inputs
my_sum <- function(a,b) {
    the_sum <- a + b
    the_sum
}

# A Second temperature conversion function
kelvin_to_celsius <- function(temp) {
    celsius <- temp - 273.15
    return(celsius)
}

# A more complex example using the gapminder data
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

## Calculate total GDP
calcGDP <- function(dat) {
    gdp <- dat$pop * dat$gdpPercap
    return(gdp)
}

## Calculate total GDP after filtering year or country
calcGDP <- function(dat, year = NULL, country = NULL) {
    if(!is.null(year)){
        dat <- dat[dat$year == year, ]
    }

    if(!is.null(country)){
        dat <- dat[dat$country == country, ]
    }
    gdp <- dat$pop * dat$gdpPercap
    new <- cbind(dat,gdp=gdp)
    return(new)
}
