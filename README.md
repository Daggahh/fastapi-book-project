# FastAPI Book Management API

## Overview

FastAPI Book Management API is a lightweight and efficient application that provides book information through a RESTful API. The application includes a fully automated CI/CD pipeline and is deployed using Nginx as a reverse proxy for improved performance and security.

## Features

- Retrieve book details by ID
- Add, update, and delete book entries
- CI pipeline for automated testing
- CD pipeline for automatic deployment
- Reverse proxy setup using Nginx for optimized request handling

### Prerequisites
## Before setting up the application, ensure you have the following installed:
- Docker & Docker Compose (for containerized deployment)
- Python 3.11+  (for local development)
- Git (for version control and cloning the repository)

## Installation

1. Clone the repository:

```bash
  git clone https://github.com/Daggahh/fastapi-book-project.git
  cd fastapi-book-project
```

2. Create a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:

```bash
pip install -r requirements.txt
```

## Running the Application
# Using Docker (Recommended)

1. Build and run the application with Docker Compose:
   ```bash
   docker-compose up --build
   ```
2. Access the API at:
   ```
   http://localhost/api/v1/books/{book_id}
   ```
   Example:
   ```bash
   curl http://localhost/api/v1/books/1
   ```
# Running Locally (Without Docker)

1. Start the FastAPI server:
   ```bash
  uvicorn main:app --host 0.0.0.0 --port 8000
   ```
2. Access the API at:
   ```
   http://localhost/api/v1/books/{book_id}
   ```

## API Endpoints

### Books

- `GET /api/v1/books/` - Retrieve all books
- `GET /api/v1/books/{book_id}` - Retrieve a specific book by ID
- `POST /api/v1/books/` - Add a new book
- `PUT /api/v1/books/{book_id}` - Update a book detail
- `DELETE /api/v1/books/{book_id}` - Delete a book

### Health Check

- `GET /healthcheck` - Check API status

## Book Schema

```json
{
  "id": 1,
  "title": "Book Title",
  "author": "Author Name",
  "publication_year": 2024,
  "genre": "Fantasy"
}
```

Available genres:

- Science Fiction
- Fantasy
- Horror
- Mystery
- Romance
- Thriller

## Running Tests

```bash
pytest
```

## Error Handling

The API includes proper error handling for:

- Non-existent books
- Invalid book IDs
- Invalid genre types
- Malformed requests

## CI/CD Pipeline

### CI (Continuous Integration)

- Trigger: Runs on pull requests to `main`
- Executes `pytest` to validate API functionality
- Failure Handling: Prevents merging if tests fail

### CD (Continuous Deployment)

- Trigger: Deploys automatically when changes are merged to `main`
- Deployment: Updates the live application with the latest code

## Nginx Configuration

Nginx is used as a reverse proxy to route requests to the FastAPI backend.

### Testing Nginx Proxy

Ensure requests are correctly handled by Nginx:

```bash
curl -I http://localhost/api/v1/books/1
```

## Submission Details

- **Base URL:** `https://fastapi-book-project-hdr9.onrender.com`
- **GitHub Repo:** `https://github.com/Daggahh/fastapi-book-project.git`
- **Collaborator:** Invited `hng12-devbot` to repository
