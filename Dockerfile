FROM python:3.7
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install python python3-pip python-dev
RUN pip3 install boto3 flask jsonify
RUN useradd -ms /bin/bash dev && \
    usermod -aG sudo dev
RUN chown -R dev:dev /home/dev/
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER dev
WORKDIR /home/dev
COPY ./app.py /home/dev
ENTRYPOINT ["python"]
CMD ["app.py"]
