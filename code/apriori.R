# Apriori

# Data Preprocessing
#install.packages('arules')
library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Training Apriori on the dataset
# FIRST we set wanted support. In our case we want to aim for products
#   which are bought at least 3 or 4 times a day. That means support = (4*7)/7501
# SECOND we set the confidence to default value (0.8) and see how many rules we find.
#   if we don't find enough rules then we lessen the confidence
rules = apriori(data = dataset, parameter = list(support = 0.003, confidence = 0.2)) 

# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])