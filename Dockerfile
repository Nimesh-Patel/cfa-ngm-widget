FROM python:3.13-slim-buster

WORKDIR /app

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
      build-essential \
      curl \
      software-properties-common \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip3 install poetry \
    && poetry config virtualenvs.in-project true \
    && poetry install

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["poetry", "run", "streamlit", "run", "scripts/widget.py", "--server.port=8501", "--server.address=0.0.0.0"]
