# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 4000 available to the world outside this container
EXPOSE 4000

# Use Gunicorn to run the Flask app on port 5000
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:4000", "app:app"]