FROM python:3.11

WORKDIR /app

# Copy the Frappe setup files into the container
COPY . /app

# Install any dependencies, if needed

# Set the command to run your Frappe services
CMD ["sh", "-c", "./your_start_script.sh"]
