# Coursera Data Science Capstone Project

### About:
All R scripts, files, presentations etc. in this repository are materials for the capstone project of the Coursera Data Science specialization held by professors of the Johns Hopkins University and in cooperation with SwiftKey.

### Dataset:

[Download Cource SwiftKey Dataset](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip)

### Plagiarism:
Johns Hopkins University defines plagiarism as "...taking for one's own use the words, ideas, concepts or data of another without proper attribution. Plagiarism includes both direct use or paraphrasing of the words, thoughts, or concepts of another without proper attribution." We take plagiarism very seriously, as does Johns Hopkins University.

We recognize that many students may not have a clear understanding of what plagiarism is or why it is wrong. Please see the following guide for more information on plagiarism:

(http://www.jhsph.edu/academics/degree-programs/master-of-public-health/current-students/JHSPH-ReferencingHandbook.pdf)


### Understanding the problem

The first step in analyzing any new data set is figuring out: 
    (a) what data you have and 
    (b) what are the standard tools and models used for that type of data.

In this capstone we will be applying data science in the area of natural language processing. As a first step toward working on this project, you should familiarize yourself with Natural Language Processing, Text Mining, and the associated tools in R. Here are some resources that may be helpful to you.

- Natural language processing Wikipedia page
- Text mining infrastucture in R
- CRAN Task View: Natural Language Processing
- Coursera course on NLP (not in R)

#### Dataset

This is the training data to get you started that will be the basis for most of the capstone. You must download the data from the Coursera site and not from external websites to start.

[Capstone Dataset](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip)

Your original exploration of the data and modeling steps will be performed on this data set. Later in the capstone, if you find additional data sets that may be useful for building your model you may use them.

#### Tasks to accomplish

Obtaining the data - Can you download the data and load/manipulate it in R?
Familiarizing yourself with NLP and text mining - Learn about the basics of natural language processing and how it relates to the data science process you have learned in the Data Science Specialization.

#### Questions to consider

1. What do the data look like?
2. Where do the data come from?
3. Can you think of any other data sources that might help you in this project?
4. What are the common steps in natural language processing?
5. What are some common issues in the analysis of text data?
6. What is the relationship between NLP and the concepts you have learned in the Specialization?


#### Tasks to accomplish

1. Tokenization - identifying appropriate tokens such as words, punctuation, and numbers. Writing a function that takes a file as input and returns a tokenized version of it.
2. Profanity filtering - removing profanity and other words you do not want to predict.

### Exploratory Data Analysis

#### Tasks to accomplish

1. Exploratory analysis - perform a thorough exploratory analysis of the data, understanding the distribution of words and relationship between the words in the corpora.
2. Understand frequencies of words and word pairs - build figures and tables to understand variation in the frequencies of words and word pairs in the data.

#### Questions to consider

Some words are more frequent than others - what are the distributions of word frequencies?
1. What are the frequencies of 2-grams and 3-grams in the dataset?
2. How many unique words do you need in a frequency sorted dictionary to cover 3. 50% of all word instances in the language? 90%?
4. How do you evaluate how many of the words come from foreign languages?
5. Can you think of a way to increase the coverage -- identifying words that may not be in the corpora or using a smaller number of words in the dictionary to cover the same number of phrases?

#### Goal

##### Tasks to accomplish

1. Build basic n-gram model - using the exploratory analysis you performed, build a basic n-gram model for predicting the next word based on the previous 1, 2, or 3 words.

2. Build a model to handle unseen n-grams - in some cases people will want to type a combination of words that does not appear in the corpora. Build a model to handle cases where a particular n-gram isn't observed.

##### Questions to consider

1. How can you efficiently store an n-gram model (think Markov Chains)?
2. How can you use the knowledge about word frequencies to make your model smaller and more efficient?
3. How many parameters do you need (i.e. how big is n in your n-gram model)?
4. Can you think of simple ways to "smooth" the probabilities (think about giving all n-grams a non-zero probability even if they aren't observed in the data) ?
5. How do you evaluate whether your model is any good?
6. How can you use backoff models to estimate the probability of unobserved n-grams?

### Prediction Model

#### Tasks to accomplish

1. Build a predictive model based on the previous data modeling steps - you may combine the models in any way you think is appropriate.
2. Evaluate the model for efficiency and accuracy - use timing software to evaluate the computational complexity of your model. Evaluate the model accuracy using different metrics like perplexity, accuracy at the first word, second word, and third word.

#### Questions to consider

1. How does the model perform for different choices of the parameters and size of the model?
2. How much does the model slow down for the performance you gain?
3. Does perplexity correlate with the other measures of accuracy?
4. Can you reduce the size of the model (number of parameters) without reducing performance?


## Folders
 1. Data - All Data files
 2. Quizs - Quiz files
 