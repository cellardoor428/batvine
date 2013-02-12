# Run this file by executing the following line in R, after changing the path 
# to this file to be correct
# source("/Users/jkitzes/Projects/batvine/src/stats.R", chdir=T)

#
# Preliminary variables
#

options(scipen=4)  # Disable scientific notation

# Set path to data table file
file_tab <- '../results/pass_full_hab.csv'

# Set path to directory to save results
path_output <- '../results'

# Choose list of species to run analysis for
spp_list <- c('TOTA', 'TABR', 'EPFU', 'MYYU')

#
# Read and process initial data
#

# Load table and new_data (bat calls per night at each point, by species)
table <- read.csv(file_tab, header=TRUE)

# Remove all records from "extra" locations
table <- table[table$extra==0,]

# Drop bug_count col, since has no data for 2012 and hence can't be used in an 
# analysis of both years.
table <- subset(table, select=-bug_count)

# Omit all records with NAs from analysis
table <- na.omit(table)

# Make appropriate cols into factors and logicals. Factors are variables with 
# different levels, like site. Logicals are variables that are 1/0, like 
# pair. Anything not converted here probably came in as numeric, which is OK.

# Site is a factor since it's a unique ID
table$site <- as.factor(table$site)

# Using date as a factor instead of a number, for random effect
table$date <- as.factor(table$date)

# Pair is logical
table$pair <- as.logical(table$pair)

# Add col for year, just in case there's a clear year effect
table$year <- as.factor(substr(table$date, 1, 4))

# Add an individual col, which is used later for an individual-level random 
# effect. This corrects for overdispersion (remove individ random effect from 
# model spec below to see the parameter with and without this effect).
table$individ <- 1:dim(table)[1]
table$individ <- as.factor(table$individ)

# Set contrasts. This controls how to interpret the final model coefficients - 
# in particular, whether all results are relative to some control level, or 
# relative to the mean of all levels.
#contrasts(table$year) <- contr.sum(2)

#
# Fit poisson model, with and without individual random effect, to all calls. 
# Save model output for individual random effects model and overdispersion 
# parameters for both. 
#

# Load libraries
library(lme4)
#library(glmmADMB)
#admb.opts=admbControl(shess=FALSE,noinit=FALSE)

# Set up a table and a vector to store the overdispersion parameters for each 
# species.
overdisp_table <- data.frame(spp = spp_list)
overdispersion_pois <- numeric(0)
overdispersion_poislogn <- numeric(0)

# Set up to save model output in text file
sink(paste(path_output, '/summary_results.txt', sep=''))

for (spp in spp_list) {
  command <- paste('dep <- table$', spp, sep = '')  # Store dep var in dep
  eval(parse(text=command))
  print(command)

  # The model itself. Number of passes for a species is assumed to be a 
  # function of this model. Just using Hab at 05 and 50 km for now.
  fit1 <- lmer(dep ~ 1 + pair + mean_temp + year + Hab05km + 
    Hab60km + (1|site) + (1|date), data=table, family='poisson')
  fit2 <- lmer(dep ~ 1 + pair + mean_temp + year + Hab05km + 
    Hab60km + (1|site) + (1|date) + (1|individ), data=table, family='poisson')
  #fit3 <- glmmadmb(dep ~ 1 + pair + mean_temp + year + Hab05km + 
  #  Hab60km + (1|site) + (1|date), data=table, family='nbinom', 
  #  zeroInflation=T)

#  x11()
#  plot(resid(fit1) ~ log(fitted(fit1)))
#  x11()
#  plot(resid(fit2) ~ log(fitted(fit2)))

  # Save results of fit2 in text file
  print(fit2)

  # Calculation of overdispersion parameter
  rdev1 <- sum(residuals(fit1)^2)
  mdf1 <- length(fixef(fit1))
  rdf1 <- nrow(table) - mdf1
  overdispersion_pois <- c(overdispersion_pois, rdev1/rdf1)

  rdev2 <- sum(residuals(fit2)^2)
  mdf2 <- length(fixef(fit2))
  rdf2 <- nrow(table) - mdf2
  overdispersion_poislogn <- c(overdispersion_poislogn, rdev2/rdf2)
}

# Close saving of file
sink()

# Store overdispersion parameters
overdisp_table$overdisp_pois <- overdispersion_pois
overdisp_table$overdisp_poislogn <- overdispersion_poislogn

write.table(overdisp_table, paste(path_output, '/overdispersion.csv',
  sep = ''), sep = ',', col.names = NA)
