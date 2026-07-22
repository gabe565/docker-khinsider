FROM --platform=$BUILDPLATFORM alpine:3.23 AS source

ARG KHINSIDER_REPO=obskyr/khinsider
ARG KHINSIDER_REF=0c00205782afe9937d64165be6884fe7eaaae801
RUN wget "https://github.com/$KHINSIDER_REPO/raw/$KHINSIDER_REF/khinsider.py"

FROM python:3.14.6-alpine

WORKDIR /app
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY --from=source /khinsider.py .

WORKDIR /data
ENTRYPOINT ["python3", "/app/khinsider.py"]
