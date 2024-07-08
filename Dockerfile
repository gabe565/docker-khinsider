FROM --platform=$BUILDPLATFORM alpine:3.20 AS source

ARG KHINSIDER_REPO=obskyr/khinsider
ARG KHINSIDER_REF=b1683fbf2897f04242bd8e67eade940d1b6f2f16
RUN wget "https://raw.githubusercontent.com/$KHINSIDER_REPO/$KHINSIDER_REF/khinsider.py"

FROM python:3.12-alpine

WORKDIR /app
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY --from=source /khinsider.py .

WORKDIR /data
ENTRYPOINT ["python3", "/app/khinsider.py"]
