FROM --platform=$BUILDPLATFORM alpine:3.23 AS source

ARG KHINSIDER_REPO=obskyr/khinsider
ARG KHINSIDER_REF=dabe21823e3cca8e8c36da3c46566f4e72cbeaae
RUN wget "https://github.com/$KHINSIDER_REPO/raw/$KHINSIDER_REF/khinsider.py"

FROM python:3.14.3-alpine

WORKDIR /app
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY --from=source /khinsider.py .

WORKDIR /data
ENTRYPOINT ["python3", "/app/khinsider.py"]
