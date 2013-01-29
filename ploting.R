




?plot







getwd()

set.seed(1)
rnorm(5)

x
summary(x)

x1<-rpois(10,1)
x2<-rpois(10,2)
plot(x1)
plot(x2)

set.seed(20)
e<-rnorm(100,0,1)


x<-rnorm(100)
y<-x + rnorm(100)
par(las = 1)
plot(x,y)



hist(y)
x<-rbinom(100,1,.5)