# Use an official Python image
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy FastAPI app
COPY . /app

# Create and activate virtual environment
RUN python3 -m venv venv
RUN . /app/venv/bin/activate

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose FastAPI port
EXPOSE 8000

# Start FastAPI
CMD ["/app/venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
