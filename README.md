## Federalist Papers Text Mining for Project Mosaic Workshop

## Sponsored by 
* [Project Mosaic](https://projectmosaic.uncc.edu/)

## Date, Time and Location

* Thursday, Oct 6, 2016 

* 10am - 12pm

* CHHS 386
 
## Instructor

* [Ryan Wesslen](http://wesslen.github.io)

## Text Analysis

In this workshop, we'll explore text analysis with exploratory visualizations, supervised and unsupervised algorithms to analyze the [Federalist Papers](https://en.wikipedia.org/wiki/The_Federalist_Papers). 

In part 1, we'll cover pre-processing and exploratory text visualizations. In part 2, we'll explore the predict the authorship of the [12 disputed papers](https://en.wikipedia.org/wiki/The_Federalist_Papers#Disputed_essays). In part 3, we'll analyze the prevalent topics across the collection of papers using topic modeling.

## Schedule

| Workshop Schedule   | Topics                                                  |
| ------------------- | ------------------------------------------------------- |
| Lecture             | Introduction to text analysis                  |
| Part 1              | [Data Pre-Processing](part1/preprocessing-01.Rmd) |
| Part 2              | [Disputed Authorship Problem](part2/supervised-02.Rmd) |
| Part 3              | [Topic Modeling](part3/topicmodeling-03.Rmd) |

The data is from Robert Stine's [Text Mining course website](http://www-stat.wharton.upenn.edu/~stine/mich/index.html#textanalytics).
                                                             
## Instructions
                                                            
To start, download the contents in this repository by clicking the "Download Zip" button on the right side. Save the zip file and extract the contents. Then open the respective RMarkdown (.Rmd)  file in the respective folder in R Studio.

To follow along, you don't need to run R code. Instead, all of the RMarkdown are accompanied by a RMarkdown HTML output file. For beginners or those having package installation problems, please follow along with the HTML output files.

## R Packages

You will need both R and R Studio previously installed. 

To run these examples, you will need several R libraries previously installed.

To install these packages, please run this code:

```{r}
packages <- c("knitr","quanteda", "glmnet", "doMC", "RColorBrewer","topicmodels", "RJSONIO", "dplyr", "stringi", "LDAvis", "tm", "d3heatmap","ggplot2","reshape","grid")

for (i in packages){
install.packages(i)
}

source("https://bioconductor.org/biocLite.R")
biocLite("graph")
biocLite("Rgraphviz")
```
