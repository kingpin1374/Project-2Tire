FROM python:3.9-alpine

WORKDIR /app

RUN apk update && apk add --no-cache gcc mariadb-dev pkgconfig musl-dev linux-headers \
	rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
