FROM --platform=$BUILDPLATFORM alpine:3.20 AS source

ARG KHINSIDER_REPO=obskyr/khinsider
ARG KHINSIDER_REF=bd7ef673ec7af5ce8f580df8f7a3f0746ff1a1ad
RUN wget "https://github.com/$KHINSIDER_REPO/raw/$KHINSIDER_REF/khinsider.py"

FROM python:3.14.3-alpine

WORKDIR /app
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY --from=source /khinsider.py .

WORKDIR /data
ENTRYPOINT ["python3", "/app/khinsider.py"]
