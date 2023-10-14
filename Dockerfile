# Get a small docker base image
FROM python:3.12.0-alpine

# Install dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Copy app
WORKDIR /app
COPY src/ .

# Run
CMD [ "gunicorn", "--bind", "0.0.0.0:8888", "wsgi:app"]
EXPOSE 8888
