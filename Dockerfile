FROM python:3.9

RUN apt update
WORKDIR /app

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable; apt-get install -y libgdal-dev
RUN apt-get install -y libopencv-dev python3-opencv
RUN apt-get install -y exiftool

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --force-reinstall -r requirements.txt  

COPY ./src .

EXPOSE 8000

# CMD ["python", "manage.py", "runserver"]

