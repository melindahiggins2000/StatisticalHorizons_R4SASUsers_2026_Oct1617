# Making and Saving Plots =======================
# Saving Plots From Base R ======================

# 1. Open a file to accept the plot output
# from the "graphics device"
# learn more at 
# help(png, package = "grDevices")
png("my_plot.png", width = 800, height = 600) 

# 2. Create the plot
plot(1:10, main = "Sample Plot") 

# 3. Close the device (CRITICAL: Saves the file)
dev.off() 

# This approach also works with ggplot() ========

library(ggplot2)

png("my_plot2.png", width = 800, height = 600)

ggplot(mtcars, aes(mpg, wt)) + geom_point()

dev.off() 

# another option with ggsave() ==================
# Save the ggplot object
p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()

# Write the plot object 'p' to a PDF file
ggsave("my_ggplot.pdf", plot = p, width = 6, height = 4) 

# Write the plot object 'p' to a PNG file
ggsave("my_ggplot.png", plot = p, 
       device = "png", 
       width = 6, height = 4) 



