# Start from official Python image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy our app file into the container
COPY app.py .

# Tell Docker what port our app uses
EXPOSE 8080

# The command to run when the container starts
CMD ["python3", "app.py"]
