Life Expectancy Data Analysis

Overview:
This repository contains an analysis of global life expectancy data using various statistical techniques, including Principal Component Analysis (PCA) and Multidimensional Scaling (MDS). The goal is to explore patterns, relationships, and key components within the dataset that contribute to differences in life expectancy across countries and years.

Dataset: The analysis is based on the "Life Expectancy Data.csv" file, which includes information on life expectancy, health indicators, and socio-economic factors for various countries over multiple years. It can be found at https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who

Data Cleaning: Rows with missing values were removed to ensure the dataset is complete for reliable analysis.

Analysis:
1. Principal Component Analysis (PCA)
PCA was performed to reduce the dimensionality of the dataset and identify the principal components that capture the most variance in the data.
The PCA results were visualized using a biplot to show both the principal components and the original variables.
2. Multidimensional Scaling (MDS)
MDS was conducted to visualize the data in a reduced dimensional space.
The dataset was scaled, and the distance matrix was calculated to conduct MDS with different dimensions (19 and 2 dimensions).
The MDS plots help to visualize the relationships between countries based on life expectancy data.
3. Correlation Analysis
A correlation matrix was calculated to understand the relationships between different variables in the dataset.
MDS was also applied to the dissimilarity matrix derived from the correlation matrix to explore the structure of the variables.
