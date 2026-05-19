FROM python:3.11-slim

# system deps for OpenCV + dlib
RUN apt-get update && apt-get install -y \
    cmake build-essential libopenblas-dev \
    libx11-6 libglib2.0-0 libsm6 libxext6 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 7860

CMD ["python", "app.py"]