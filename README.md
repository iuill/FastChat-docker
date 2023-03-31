# FastChat-docker

## Usage

```
git clone https://github.com/iuill/FastChat-docker.git
cd FastChat-docker
docker build -t fastchat .
docker run --gpus all -it -p 7860:7860 fastchat /bin/bash
```

```
python3 -m fastchat.serve.controller --host 0.0.0.0 &
python3 -m fastchat.serve.model_worker --model-path facebook/opt-1.3b --host 0.0.0.0 &
python3 -m fastchat.serve.test_message
python3 -m fastchat.serve.gradio_web_server --host 0.0.0.0 &
```
