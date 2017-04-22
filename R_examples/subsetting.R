# Subsetting

## Vectors

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c("a", "b", "c", "d", "e")

### By index
x[1]
x[2]
x[5]

x[c(1, 3)]
x[1:4]
x[c(1, 1, 4, 2)]

### Out of range
x[6]

### Zero index
x[0]

### Skipping
x[-4]
x[-1:3] # this doesn't work
x[-c(1:3)] # this does work

### Challenge
x[2:4]
x[-c(1,5)]
x[c(2,3,4)]

### By name
x[c("a", "c")]

which(names(x) == "a")
x[-which(names(x) == "a")]

x[-which(names(x) %in% c("a", "c"))]


### New vector
xx <- 1:3
names(xx) <- c("a", "a", "a")

xx["a"]
xx[which(names(xx) == "a")]

### Logical
names(xx) == "a"
xx[c(TRUE, FALSE)]
xx[xx > 7]
x[x > 5]

### Challenge 2
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x[x > 4 & x < 7]

## Matrices

set.seed(1)
m <-matrix(rnorm(6 * 4), ncol = 4, nrow = 6)

m[2, 3]
m[2:4, 1:3]
m[3, ]
m[, 2]


## Lists

ll <- list(a = "COMBINE", b = 1:10,
            data = head(iris))

ll[1:2]
ll[1]
ll[[1]]

ll[-2]
ll$data

## Dataframes

data <- iris
data[["Sepal.Length"]]
data$Petal.Length
data[6:10, 3:4]
