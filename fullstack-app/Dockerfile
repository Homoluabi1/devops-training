FROM python:3.11-slim

WORKDIR /app

# Copy and install dependencies first (better caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Then copy app code
COPY app.py .

EXPOSE 5000

CMD ["python3", "app.py"]
