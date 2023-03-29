# Features in Stylometry

# Welcome!
# This is an R script file, created by Simone
# Everything written after an hashtag is a comment
# Everything else is R code
# To activate the code, place the cursor on the corresponding line
# (or highlight multiple lines/pieces of code) 
# ...and press Ctrl+Enter (or Cmd+Enter for Mac)
# (the command will be automatically copy/pasted into the console)

# before you start, install the required packages
# (if a warning is shown above)

# Call the packages
library(stylo)
library(udpipe)
# ...you'll have to do it each time you re-start the project

### 1. Stylometry with character n-grams

# run an analysis with 4-charachter n-grams
stylo_result <- stylo(distance.measure="dist.delta",
                      analyzed.features = "c",
                      ngram.size = 4,
                      mfw.min=100, 
                      mfw.max=100)

# explore the results
names(stylo_result)

# see the features
stylo_result$features

# see a specific feature (to distinguish spaces)
stylo_result$features[6]

# see the n-gram frequencies
ngram_freq <- stylo_result$table.with.all.freqs
ngram_freq <- as.data.frame(t(ngram_freq))
View(ngram_freq)

# repeat analysis with different n-gram selections
stylo_result <- stylo(distance.measure="dist.delta",
                      analyzed.features = "c",
                      ngram.size = 4,
                      mfw.min=1000, 
                      mfw.max=1000)

stylo_result <- stylo(distance.measure="dist.delta",
                      analyzed.features = "c",
                      ngram.size = 3,
                      mfw.min=2000, 
                      mfw.max=2000)

stylo_result <- stylo(distance.measure="dist.wurzburg",
                      analyzed.features = "c",
                      ngram.size = 3,
                      mfw.min=2000, 
                      mfw.max=2000)

### 2. Udpipe

# choose a text
my_text <- "To be or not to be. That is the question, my dear Watson."

# annotate it with udpipe!
x <- udpipe(x = my_text, object = "english")
View(x)

# of course, you can also work on different languages
my_text <- "Nel mezzo del cammin della mia vita, mi ritrovai con il mio caro Watson."

# annotate it with udpipe!
x <- udpipe(x = my_text, object = "italian")
View(x)

# let's work on one entire novel
novel <- readLines("corpus/Doyle_Study_1887.txt", warn = F)
text <-  paste(novel, collapse = "\n")
result <- udpipe(x = text, object = "english")
View(result)

# we can re-write the novel by just writing the POS tags
cat(result$upos, sep = " ", file = "materials/Doyle_Study_1887_UPOS.txt")

### 3. Stylometry with POS

# the cake was already cooked :)
# see materials/POS_analysis/corpus

# we just need to change the working directory!
setwd("materials/POS_analysis/")
# important note: once you change the working directory
# you will be reading/writing files from there

# run an analysis with 2-POS n-grams
stylo_result <- stylo(distance.measure="dist.delta",
                      analyzed.features = "w",
                      ngram.size = 2,
                      mfw.min=100, 
                      mfw.max=100)

# see the actual features
stylo_result$features

#####
# Your turn!
#####

# try different POS ngram selections in the last analysis
# does it improve?
