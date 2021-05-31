FROM ubuntu:18.04
COPY content/requirements.txt /tmp/
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip

RUN pip install -qr /tmp/requirements.txt
COPY /content/* /opt/webapp/
WORKDIR /opt/webapp
EXPOSE 5000
CMD ["python","app.py"]
