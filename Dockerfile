# ベースイメージをインストール
# Ubuntu 20.04.6 LTS（Focal Fossa：debian）/ PyTorch 2.0.0（+cu117）/ Python 3.10.10 / CUDA 11.6.2 / cuDNN 8.5.0.96 / JupyterLab 4.2.5 /Jupyter Notebook 6.5.7
FROM rehabc/pytorch2.0.0-python3.10-cuda11.6-jupyter

# ベースイメージをインストール
# torch+cu117版だがCUDA 11.6を利用
# FROM runpod/pytorch:3.10-2.0.0-117

# JupyterLab・Jupyter Notebookのインストール
# RUN pip3 install --root-user-action=ignore --no-cache-dir -U jupyterlab==4.2.5 ipywidgets==8.1.5 jupyter-archive==3.4.0 jupyter_contrib_nbextensions==0.7.0 
# RUN pip3 install --root-user-action=ignore notebook==6.5.7
# RUN jupyter contrib nbextension install --user && \
#    jupyter labextension enable widgetsnbextension

#CUDA 11.6（11.7）用のPytorchをインストール（+cu117は表示されない）
# RUN pip3 install --root-user-action=ignore torch==2.0.0 torchvision==0.15.1 torchaudio==2.0.1 --index-url https://download.pytorch.org/whl/cu117

# ffmpegなどをインストール
RUN apt-get update
RUN apt install -y build-essential=12.8ubuntu1.1 python3-dev=3.8.2-0ubuntu2 python3.10-dev=3.10.15-1+focal1 ffmpeg=7:4.2.7-0ubuntu0.1 software-properties-common=0.99.9.12 git-all=1:2.25.1-1ubuntu3.13 zip=3.0-11build1 unzip=6.0-25ubuntu1.2 aria2=1.35.0-1build1
RUN apt-get clean

# JupyterLabの日本語化ファイルのインストール
RUN pip3 install --root-user-action=ignore jupyterlab-language-pack-ja-JP==4.2.post3

