## Federalist Papers Text Mining for Project Mosaic Workshop

Classification problems can be divided into supervised and unsupervised algorithms. To explain the difference, assume there are two variables: X (independent variable) and Y (dependent variable). In supervised techinques, we can observe and use both variables. The algorithm is "trained" by finding patterns in how X can be used to predict Y. On the other hand, unsupervised techinques are when we only observe X. These problems are more difficult because we're trying to predict Y without ever observing Y. 

In this workshop, I use supervised and unsupervised techinques to analyze the [Federalist Papers](https://en.wikipedia.org/wiki/The_Federalist_Papers) to predict the authorship of the [12 disputed papers](https://en.wikipedia.org/wiki/The_Federalist_Papers#Disputed_essays).

The data is from Robert Stine's [Text Mining course website](http://www-stat.wharton.upenn.edu/~stine/mich/index.html#textanalytics) and the Naive Bayes code was built from code in the book [Social Media Mining with R](https://www.packtpub.com/big-data-and-business-intelligence/social-media-mining-r). 
                                                             
## Instructions
                                                            
To start, download the contents in this repository by clicking the "Download Zip" button on the right side. Save the zip file and extract the contents. Then open the two R files (FederalistPapers.R and topicmodel_function.R) in R Studio.
                                                             
Part 1 covers basic text mining preparation. Part 2 covers supervised learning. Part 3 covers unsupervised learning, specifically LDA (topic modeling).