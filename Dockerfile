FROM python
ENV APP-VERSION=v1.0.0 APP-SECTION=testing APP-NAME=python-app
LABEL env=python-image author=mohamed
RUN  apt update -y 
RUN  apt install python3 -y
COPY . /main
WORKDIR /main
CMD ["python3","main"]

