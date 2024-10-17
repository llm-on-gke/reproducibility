FROM us-central1-docker.pkg.dev/tpu-pytorch-releases/docker/xla:r2.4.0_3.10_tpuvm
RUN git clone https://github.com/huggingface/transformers/
RUN pip install git+https://github.com/huggingface/transformers
RUN pip install transformers[torch]
RUN pip install torch~=2.4.0 torch_xla[tpu]~=2.4.0 torchvision -f https://storage.googleapis.com/libtpu-releases/index.html
   