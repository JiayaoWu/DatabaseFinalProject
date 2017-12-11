import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.linear_model import LogisticRegression
from sklearn import svm
from sklearn import tree
from sklearn.naive_bayes import GaussianNB
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import cross_val_score

#read the scorings.csv
scoreAll = pd.read_csv('Scoring.csv')
#select only NHL league
scoreAll = scoreAll.query('lgID=="NHL"')
#select only the columns we want
scores = scoreAll[['playerID', 'year', 'pos', 'GP', 'G', 'A', 'Pts', 'PIM']]
#data cleaning to remove NaN values
scores = scores.dropna()
scores = scores.reset_index(drop=True)

#For some pos, it's R/L. We choose the first one
scores.loc[scores['pos'] == 'L/D', 'pos'] = 'L'
scores.loc[scores['pos'] == 'D/L', 'pos'] = 'D'
scores.loc[scores['pos'] == 'L/C', 'pos'] = 'L'
scores.loc[scores['pos'] == 'C/D', 'pos'] = 'C'
scores.loc[scores['pos'] == 'C/L', 'pos'] = 'C'
scores.loc[scores['pos'] == 'C/R', 'pos'] = 'C'
scores.loc[scores['pos'] == 'D/F', 'pos'] = 'D'
scores.loc[scores['pos'] == 'D/R', 'pos'] = 'D'
scores.loc[scores['pos'] == 'D/W', 'pos'] = 'D'
scores.loc[scores['pos'] == 'F/D', 'pos'] = 'D'
scores.loc[scores['pos'] == 'L/R', 'pos'] = 'L'
scores.loc[scores['pos'] == 'R/C', 'pos'] = 'R'
scores.loc[scores['pos'] == 'R/D', 'pos'] = 'R'
scores.loc[scores['pos'] == 'R/L', 'pos'] = 'R'
scores.loc[scores['pos'] == 'W/D', 'pos'] = 'D'



#read from AwardsPlayers.csv
awardsAll = pd.read_csv('AwardsPlayers.csv')
#select only the columns we want
awardsAll = awardsAll[['playerID', 'award', 'year', 'lgID', 'pos']]
#filter only first team and second team all-star
awards = awardsAll.query('award=="First Team All-Star" or award=="Second Team All-Star"')
awards = awards.query('lgID=="NHL"')

#data cleaning
awards = awards.dropna()
awards = awards.reset_index(drop=True)

awards.loc[awards['pos'] == 'RW', 'pos'] = 'R'
awards.loc[awards['pos'] == 'LW', 'pos'] = 'L'



#create labels array: 3 labels: 0, 1, 2
(row, col) = scores.shape
labels = np.zeros((row, ))

for index, row in scores.iterrows():
	posT = row['pos']
	yearT = row['year']
	playerT = row['playerID']
	awardsTemp = awards.query('playerID==@playerT and year==@yearT and pos==@posT')
	if awardsTemp.empty:
		labels[index] = 0
	else:
		a = awardsTemp.query('award=="First Team All-Star"')
		if not a.empty:
			labels[index] = 1
		else:
			labels[index] = 2

#Split data into 70% training and 30% testing
scores = scores[['GP', 'G', 'A', 'Pts', 'PIM']]
Train_x = scores.head(n=29376)
Test_x = scores.tail(n=12590)

Train_y = labels[:29376]
Test_y = labels[29376:]


#Logistic regression
model = LogisticRegression()
model.fit(Train_x, Train_y)
print "Logistic Regression"
print "Training Accuracy", model.score(Train_x, Train_y)
print "Testing Accuracy", model.score(Test_x, Test_y)
log_cv = cross_val_score(model, Train_x, Train_y, cv=10).mean()
print "Cross Validation Accuracy", log_cv

#SVM
model = svm.SVC()
model.fit(Train_x, Train_y)
print "\nSVM"
print "Training Accuracy", model.score(Train_x, Train_y)
print "Testing Accuracy", model.score(Test_x, Test_y)
svm_cv = cross_val_score(model, Train_x, Train_y, cv=10).mean()
print "Cross Validation Accuracy", svm_cv


#Decision Tree
model = tree.DecisionTreeClassifier(criterion='gini')
model.fit(Train_x, Train_y)
print "\nDecision Tree"
print "Training Accuracy", model.score(Train_x, Train_y)
print "Testing Accuracy", model.score(Test_x, Test_y)
dec_cv = cross_val_score(model, Train_x, Train_y, cv=10).mean()
print "Cross Validation Accuracy", dec_cv


#Naive Bayes
model = GaussianNB()
model.fit(Train_x, Train_y)
print "\nNaive Bayes"
print "Training Accuracy", model.score(Train_x, Train_y)
print "Testing Accuracy", model.score(Test_x, Test_y)
nav_cv = cross_val_score(model, Train_x, Train_y, cv=10).mean()
print "Cross Validation Accuracy", nav_cv

#K-nearest neighbors
model = KNeighborsClassifier(n_neighbors=6)
model.fit(Train_x, Train_y)
print "\nK-Nearest Neighbors"
print "Training Accuracy", model.score(Train_x, Train_y)
print "Testing Accuracy", model.score(Test_x, Test_y)
k_cv = cross_val_score(model, Train_x, Train_y, cv=10).mean()
print "Cross Validation Accuracy", k_cv

#Random Forest
model= RandomForestClassifier()
model.fit(Train_x, Train_y)
print "\nRandom-forest"
print "Training Accuracy", model.score(Train_x, Train_y)
print "Testing Accuracy", model.score(Test_x, Test_y)
r_cv = cross_val_score(model, Train_x, Train_y, cv=10).mean()
print "Cross Validation Accuracy", r_cv

#Plot
