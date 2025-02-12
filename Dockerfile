# Use an official Python image
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy the FastAPI app
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose only port 80 (Nginx)
EXPOSE 80

# Start both Nginx and FastAPI
CMD bash -c "service nginx start && uvicorn main:app --host 127.0.0.1 --port 8000"