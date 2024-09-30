FROM python:3.9.6-slim
EXPOSE 8501
WORKDIR /app
COPY . .
ENV QUICKJS_VERSION="2021-03-27"
ENV QUICKJS_TAR="https://bellard.org/quickjs/quickjs-${QUICKJS_VERSION}.tar.xz"

VOLUME /mnt/src

RUN set -e -x && \
    apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    pandoc-citeproc \
    curl \
    gdebi-core \
    librsvg2-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG QUARTO_VERSION="1.5.56"
ARG QUARTO_VERSION
RUN set -e -x && \
  curl -o quarto-${QUARTO_VERSION}-linux-arm64.deb -L https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-arm64.deb \
  && gdebi --non-interactive quarto-${QUARTO_VERSION}-linux-arm64.deb \
  && rm -f quarto-${QUARTO_VERSION}-linux-arm64.deb    


ADD $QUICKJS_TAR .

RUN apt-get update && apt-get install -y build-essential libc6-dev bash

RUN tar Jxf quickjs-${QUICKJS_VERSION}.tar.xz && cd quickjs-${QUICKJS_VERSION} && make install

RUN python3 -m pip install jupyter
RUN pip install --upgrade pip ipython ipykernel
RUN ipython kernel install --name "python3" --user



RUN pip3 install -r requirements.txt
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
