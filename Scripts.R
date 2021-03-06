rep(10, 4)

#function
point <- function(x , y){
  z1 <- 2*x+y 
  z2 <- x+2*y
  z3 <- 2*x + 2*y
  z4 <- x/y
  return(c(z1,z2,z3,z4))
}
point(4,7)


f1 <- function(x , y){
  return(x+y)
}


f2 <- function(x , y){
  return(x*y)
}

#vector
v1 <- seq(1:7)
v1


v2 <- seq(3,12,3)
v2

#matrix
mat1 <- matrix(c(1:4), 2, 2)
mat2 <- matrix(c(2,4,6,8), 2, 2)
f1(mat1 , mat2)
f2(mat1 , mat2)

mat1 * mat2
mat1 / mat2
mat1 %*% mat2
mat1[1, ]
mat1[ ,1]
mat1[1, 2, drop = FALSE]
mat1[1, , drop = FALSE]

#arithmetic oper
x <- 4:9
y <- 6:11
x + y
x - y
x * y
x / y
z

x > 7
x >= 7
x == 7
x != 7





x <- c("a", "b", "c", "d", "e", "f", "g")
x[5]
u <- x > "e"
x[u]


#list
x <- list(x = c(1:3), y = c(3:5))
x
x["y"]
x[["y"]]

name <- "x"
x[[name]]
x$name

y <- list(x = list(1:3), y = list(3:5))
y[[c(1,1)]]


z <- c(1, 2, 3, NA, NA)
bad <- is.na(z)
bad
good <- complete.cases(z)
z[!bad]
z[good]


attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")


x <- c(1:5);y<-x
par(pch=22,col="red")
par(mfrow=c(2,4))
opts=c("p", "l", "o", "b", "c", "s", "S", "h")
for(i in 1:length(opts)){
  heading = paste("type=",opts[i])
  plot(x,y,type="n",main = heading)
  lines(x,y,type=opts[i])
}


dotchart(mtcars$mpg,labels=row.names(mtcars),cex=.7,
         main="Gas Mileage ",
         xlab="Miles Per Galloon",
         )

x <- mtcars[order(mtcars$mpg),]
x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "green"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,labels = row.names(x),cex=.7,
         groups = x$cyl ,
         main="Gas Mileage /grouped by cylinder",
         xlab="Miles Per Galloon",gcolor = "black",color = x$color
         )


slices <- c(10, 12, 4, 16, 8)
lbls <- c("a", "b","c", "d", "e")
pie(slices,labels = lbls ,main = "Pie ")

library(plotrix)
pie3D(slices,labels = lbls ,explode = 0.1 ,main = "Pie ")


boxplot(mpg~cyl,data = mtcars, main = "Mileage data"
        , xlab = "NO of cylinder" , ylab = "Miles per Galloon")


library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3,names = c("$ cyl", "6 cyl", "* cyl"),
        col = "gold")
title("Violin Plots of Miles Per Galloon")
library(aplpack)
bagplot(wt, mpg, xlab = "Car Weight", ylab="Miles Per Gallon", 
        main="Bagplot Example")

hist(mtcars$mpg , main="HIstogram Example")


x <- mtcars$mpg
hist(x, breaks = 10,col = "red", xlab = "Miles per Galloon"
     ,main="HIstogram with Normal curve")

d <- density(mtcars$mpg)
plot(d)


plot(d, main = "Kernael Density per Galloon")
polygon(d, col = "red",border = "blue")


library(sm)

cyl.f <- factor(cyl , levels = c(4,6,8))


library(car)
scatterplot(mpg ~ wt|cyl,data = mtcars,
            xlab ="Weight of car" ,ylab="Miles Per Galloon"
            , main = "Enhanced Scatter plot",
            labels = row.names(mtcars))


library(MASS)
library(party)
iris_ctree <- ctree(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,
           data= iris)
print(iris_ctree)
plot(iris_ctree)


#correlation
attach(mtcars)
#syntax Cor.test(x,y)
cor.test(mpg,wt)
#syntax with(data,cor.test(x,yl))
with(mtcars,cor.test(mpg,wt))

library(MASS)
attach(cats)
View(cats)
#simple linear regression 
lm.out = lm(Hwt~Bwt , data = cats)
lm.out
summary(lm.out)

plot(Hwt~Bwt , data = cats)
abline(lm.out , col = "red")
par(mfrow = c(2,2))
plot(lm.out)

#multiple linear regression
attach(head_injury)
fit <- lm(clinically.important.brain.injury ~ age.65+ 
            basal.skull.fracture+
            loss.of.consciousness , data = head_injury)
summary(fit)
plot(fit)


#logistic regression

attach(Titanic2)
train(1:1313)
test(1:100)
model<-glm(Survived ~ PClass +Age ,data = Titanic2)
summary(model)
plot(model)
#analyse Twitter data
library(twitteR)
setup_twitter_oauth(consumer_key = "BaO3gQZjnFUi7eS85CNovU6uM"
                    , consumer_secret = "SJLvFpLfur08IvkIlH8nEs702wtV1XKmt8EfY1RwbD36BZaEmj"
                    , access_token = "835477396434255872-dLW4z8pP6JAhsi86vW8r5UW16CYbWTk"
                    , access_secret = "qNmUob0wgpcFQq5s5U6b4r4l4iah0MyckVlWvFnfSqcHV")
library(tm)
library(wordcloud)
library(RColorBrewer)
mach_tweets = searchTwitter("Donald Trump", n=50 ,lang = "en")
mach_text = sapply(mach_tweets,function(x)x$getText())
mach_corpus = Corpus(VectorSource(mach_text))
tdm = TermDocumentMatrix(mach_corpus,
      control = list(removePunctuation = "TRUE",
                stopwords = c("Donald" , "Trump", stopwords("english")),
                removeNumbers = TRUE,tolower= TRUE ))
png("MachinelearningCloud.png",
    width = 12,
    height = 8,
    units = "in",
    res = 300)
wordcloud(tdm$word, tdm$freg, random.order = FALSE ,
          colors = brewer.pal(8,"Dark2"))
dev.off()
