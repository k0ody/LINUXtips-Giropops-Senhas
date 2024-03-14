FROM alpine:3.15.9                                
RUN apk update && apk add git --no-cache
RUN git clone https://github.com/badtuxx/giropops-senhas.git
WORKDIR /giropops-senhas
RUN apk update && apk add redis py-pip && pip install --no-cache-dir -r /giropops-senhas/requirements.txt
RUN pip install werkzeug===2.2.2
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]