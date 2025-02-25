FROM python:3.11-slim

# Install git and build dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install project in editable mode
RUN pip install -e .

# Set default command
CMD ["python", "main.py"]

