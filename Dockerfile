FROM python:3.7.7-stretch AS BASE

WORKDIR /app

# upgrade pip version

RUN pip install openai
# Copy the requirements file into the container at /app
COPY requirements.txt /app/
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
ADD config.yml config.yml
ADD domain.yml domain.yml
ADD credentials.yml credentials.yml
ADD endpoints.yml endpoints.yml
# Define the command to run your application
CMD ["python", "app.py"]
