# data-visualization
Create a simple dockerized visualization dashboard by integrating Bokeh library with Django.

# Setting up
This is a production-ready setup for running Django on Docker. It's a robust and simple way to run Django projects based on LAMP stack on production servers.

# Installation:
First, install Docker. If you're new to Docker, you might also want to check out the Hello, world! tutorial.

Next, clone this repo:
	git clone https://github.com/Navera-Arifi/data-visualization.git
	cd data-visualization
	
# Build project
Build via docker command:
	docker build -t dashboard .

# Run
	docker run -p 5000:80 dashboard

# Output:
Check the your browser with the corresponding IP address with port :)
	
