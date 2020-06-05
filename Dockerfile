FROM python:3

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN apt update              &&\
    apt install -q -y git   &&\
    rm -rf /var/lib/apt/lists

COPY mkdocs_deploy.sh /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/mkdocs_deploy.sh" ]