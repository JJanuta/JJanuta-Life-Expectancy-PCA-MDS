
# Read in the dataset containing life expectancy data from a CSV file
lifeexpectancy <- read.csv("Life Expectancy Data.csv")

# Remove rows with missing values (nulls) to ensure the dataset is complete for analysis
lifeexpectancy <- na.omit(lifeexpectancy)

# Create unique row names by combining 'Country' and 'Year' columns for better identification of each entry
rownames(lifeexpectancy) <- with(lifeexpectancy, paste(Country, Year, sep = ":"))

# Create a new dataset 'lifeexpectancy2' by removing non-numeric columns ('Country', 'Status', 'Year')
# This step prepares the data for numerical analysis, such as PCA
lifeexpectancy2 <- subset(lifeexpectancy, select = -c(Country, Status, Year))

# Display the first few rows of the cleaned numeric dataset to verify its structure
head(lifeexpectancy2)

# Perform Principal Component Analysis (PCA) on the numerical dataset to reduce dimensionality and identify key components
life.pca <- princomp(lifeexpectancy2, cor=TRUE)

# Display the loadings of each principal component to understand the contribution of each variable
life.pca$loadings

# Plot a biplot to visualize the PCA results, showing both the principal components and the original variables
biplot(life.pca, col = c("black", "red"), cex = 0.6, xlim = c(0, 0.1), ylim = c(0, 0.06))

# Scale the data and compute the distance matrix to standardize the variables for Multidimensional Scaling (MDS)
life.d <- dist(scale(lifeexpectancy2))

# Conduct Classical Multidimensional Scaling (MDS) to determine how many dimensions to retain using 19 dimensions
life.m <- cmdscale(life.d, k=19, eig=TRUE)

# Display the cumulative proportion of variance explained by the first 8 dimensions
head(cumsum(life.m$eig) / sum(life.m$eig), 8)

# Perform MDS again, reducing the dataset to 2 dimensions for easier visualization
life.mds <- cmdscale(life.d, k=2, eig=TRUE)

# Plot the MDS results to visualize the relative distances between data points in two dimensions
plot(life.mds$points[, 1:2], pch=".",
     main = "Multidimensional Scaling of Life Expectancy Data",
     xlab = "First Component",
     ylab = "Second Component")

# Add text labels to the MDS plot to identify each point by its country and year
text(life.mds$points[, 1:2], labels = rownames(lifeexpectancy2), cex = 0.6)

# Calculate the correlation matrix for the life expectancy dataset
life.cor <- cor(lifeexpectancy2)

# Convert the correlation matrix into a dissimilarity matrix (1 - correlation)
lifecd <- 1 - life.cor

# Display the dissimilarity matrix to understand the relationships between variables
lifecd

# Perform MDS on the dissimilarity matrix to reduce it to 2 dimensions
lifecd.mds <- cmdscale(lifecd, k=2, eig=TRUE)

# Plot the MDS results of the dissimilarity matrix to visualize the relationships between variables
plot(lifecd.mds$points[, 1:2], pch=".",
     main = "Multidimensional Scaling of Life Expectancy Data",
     xlab = "First Component",
     ylab = "Second Component")

# Add text labels to the MDS plot to identify each point by its corresponding variable
text(lifecd.mds$points[, 1:2], labels = rownames(lifecd), cex = 0.6)






