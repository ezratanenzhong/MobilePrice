library(ggplot2)
library(gridExtra)
library(RColorBrewer)

# load dataset
data <- read.csv("train.csv")
# remove incomplete data - sceen width equals 0
df <- subset(data, sc_w != 0)

# Scatter plot of Battery Power against RAM
scatterPlot <- ggplot(df, aes(x=ram, y=n_cores, group=price_range, color=price_range)) + 
  geom_point() + 
  #labs(title = "Scatterplot of Battery Power against RAM")
  labs(title = "Mobile Price Classification", x="Ram", y="Cores")
scatterPlot + scale_color_gradient(low="blue", high="red")

# Change the names of classes
df$price_range <- factor(df$price_range, levels = c(0,1,2,3),
                         labels = c("low cost", "medium cost", "high cost", "very high cost"))

# Check price range distribution
ggplot(data=df, aes(x = price_range)) +
  geom_bar()

# Box plot of Battery Power vs Price Range
p1 <- ggplot(df, aes(x=price_range, y=battery_power, color=price_range, group=price_range)) +
geom_boxplot() +
labs(title = "Battery Power vs Price Range")

# Box plot of RAM vs Price Range
p2 <- ggplot(df, aes(x=price_range, y=ram, group=price_range, color=price_range)) +
  geom_boxplot() +
  #geom_boxplot(outlier.colour="red", outlier.shape=8, outlier.size=4) +
  labs(title = "RAM vs Price Range")

# Box plot of Pixel Resolution Height vs Price Range
p3 <- ggplot(df, aes(x=price_range, y=px_height, group=price_range, color=price_range)) + 
  geom_boxplot() +
  labs(title = "Pixel Resolution Height vs Price Range")

# Box plot of Pixel Resolution Width vs Price Range
p4 <- ggplot(df, aes(x=price_range, y=px_width, group=price_range, color=price_range)) +
  geom_boxplot() +
  labs(title = "Pixel Resolution Width vs Price Range")

# Plot the 4 plots as subplots and arranged the plots into 2 rows
grid.arrange(p1, p2, p3, p4, nrow = 2)



