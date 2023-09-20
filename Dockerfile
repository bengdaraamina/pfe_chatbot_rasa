#FROM python:3.7.7-stretch AS BASE
FROM rasa/rasa:latest

# Install Duckling as a service
#RUN docker run -d -p 8000:8000 rasa/duckling:latest
# Set the working directory to /app

WORKDIR /app
# Copy your Rasa project files into the container
COPY . .
# upgrade pip version
#RUN pip install --upgrade pip
#RUN pip install rasa
RUN pip install openai
# Train your Rasa model
#RUN rasa train

ADD config.yml config.yml
ADD domain.yml domain.yml
ADD credentials.yml credentials.yml
ADD endpoints.yml endpoints.yml
#RUN docker pull rasa/duckling
#RUN docker run -d -p 8010:8010 -p 5010:5010 --name rasa rasa/duckling:latest
# Start the Rasa server
#CMD ["rasa", "run", "-p", "5005", "--enable-api"]
CMD ["rasa", "run", "-m", "models", "--enable-api"]
