FROM python:3.7.7-stretch AS BASE

WORKDIR /app

# upgrade pip version

RUN pip install openai
RUN pip install -r requirements.txt
ADD config.yml config.yml
ADD domain.yml domain.yml
ADD credentials.yml credentials.yml
ADD endpoints.yml endpoints.yml
