FROM python:3.12.0-alpine
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
WORKDIR /app
COPY src/ .
CMD [ "gunicorn", "--bind", "0.0.0.0:8888", "wsgi:app"]
EXPOSE 8888
