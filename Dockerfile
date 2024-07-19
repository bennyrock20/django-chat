# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libc-dev && \
    pip install --upgrade pip

# Install Django
RUN pip install django

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any additional requirements (if requirements.txt is present)
COPY requirements.txt /usr/src/app/
RUN pip install -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
