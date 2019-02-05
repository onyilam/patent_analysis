# patent_analysis

This repo contains the analysis scripts for the Google patents public database <https://console.cloud.google.com/marketplace/browse?q=google%20patents%20public%20datasets&filter=solution-type:dataset&_ga=2.249841734.-1360113471.1540898778>.

# Summary stats

focus on the specific patent families that have increased most in patent share from 2000 to 2018:
  * G06 COMPUTING; CALCULATING; COUNTING
  * H04 ELECTRIC COMMUNICATION TECHNIQUE

Summary statistics for these categories:
  1. Number of inventors per patent
  2. Whether assignee is a company or individual
  3. The most common word in the claim
  4. Country of inventors

## distance of claims
Train a deep learning model to measure distance of claims text.
The goal of the analysis is two fold:
  1. Understand whether distance of claims across companies is wider than within claims that are made within companies
  2. provide validation of using text distance as a metric
