###First, lets make some fake data so we can run example code
Outcome<-runif(10,1,10)
Predictor<-c("A","A","A","B","B","B","C","C","C","C")
Predictor1<-Predictor
Predictor2<-c("D","E","F","D","E","F","D","E","F","D")



###Two options for performing an ANOVA

###First option, built in function "anova"

anova(lm(Outcome~Predictor))

###This can also work with multiple predictor variables

anova(lm(Outcome~Predictor1*Predictor2))

###Second option, built in function "aov"
summary(aov(Outcome~Predictor))
summary(aov(Outcome~Predictor1*Predictor2))

###However the anova and aov commands works slightly less well with multiple predictors than Anova does. anova will treat the first predictor variable as super special, if there's anyway to make it significant it will, predictor two is slightly less special etc. This is silly in my opinion. Anova will treat all your variables as equally special. It will also work for many different types of data, such as categorical variables as opposed to continous variables. To use Anova you will have to download and install the "car" package.

library(car)

###After that, the syntax looks much the same

Anova(lm(Outcome~Predictor))
Anova(lm(Outcome~Predictor1*Predictor2))

###There are a huge number of ways to do post-hoc tests. We should definitely discuss this a little bit when we meet, because honestly I'd say Tony's method is probably not the most popular method. But since you're doing the analysis for Tony, you should do it his way. Tony will want two sets of P-values. One is uncorrected and is generated like this:

pairwise.t.test(Outcome, Predictor, p.adj="none")

###The other is FDR corrected and is generated like this:

pairwise.t.test(Outcome, Predictor, p.adj="fdr")

###These commands will only work when you only have one Predictor Variable. If you want to run more than one predictor variable, please come talk to me! ^_^


