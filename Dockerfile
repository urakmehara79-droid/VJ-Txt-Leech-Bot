FROM python:3.11-slim

# Working directory
WORKDIR /app

# Copy all files
COPY . .

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    ffmpeg \
    aria2 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

# Install python requirements
RUN pip install --no-cache-dir -r requirements.txt

# Run your bot
CMD ["python", "main.py"]