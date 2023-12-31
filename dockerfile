# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files to the working directory
COPY . .

# Expose port 8080 to the outside world
EXPOSE 8080

# Use a non-root user to run the application
RUN useradd --create-home appuser
USER appuser

# Set an environment variable
ENV PYTHONUNBUFFERED=1

# Start the application with Streamlit
CMD ["streamlit", "run", "Home.py", "--server.port", "8080"]
