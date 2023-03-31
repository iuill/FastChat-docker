FROM python:3.11.2-slim-bullseye

RUN apt update && apt install -y \
    curl \
    git \
    gcc \
    g++ \
    cmake \
    libssl-dev \
    pkg-config \
    locales-all

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN pip install setuptools-rust transformers

RUN git clone https://github.com/lm-sys/FastChat.git
ENV APP_PATH=/FastChat
WORKDIR  $APP_PATH

RUN pip install -e .

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ=Asia/Tokyo

CMD ["/bin/bash"]
