FROM python:3.7.5

EXPOSE 8000

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

RUN adduser -D -u 1000 appuser

COPY . /app

USER appuser

ENTRYPOINT [ "gunicorn" ]

CMD [ "-b", "0.0.0.0:8000", "run:app" ]
