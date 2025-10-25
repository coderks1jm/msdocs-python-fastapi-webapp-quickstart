FROM python:3.11

# set the working directory in the container
WORKDIR /code

# copy the requirements file into the container
COPY requirements.txt .

# install the dependenices
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# copy rest of the application code into the container
COPY . .

# expose the port that the app will run on
EXPOSE 3100

# Command to run the application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3100", "--workers", "4"]
