FROM python

COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

RUN groupadd user
RUN useradd -g user user
RUN mkdir /app
RUN chown user:user /app

USER user

# Current pip>=2.0 is broken
#RUN pip install --upgrade pip

COPY app.py /app/app.py
COPY static /app/static
COPY templates /app/templates

ENV FLASK_APP=/app/app.py
CMD [ "flask", "run", "--host=0.0.0.0" ]