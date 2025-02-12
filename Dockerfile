# Use an official Python image
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy the FastAPI app
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start the FastAPI app (only accessible internally)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
