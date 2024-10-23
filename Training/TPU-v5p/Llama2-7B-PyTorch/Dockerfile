FROM us-central1-docker.pkg.dev/tpu-pytorch-releases/docker/xla:r2.4.0_3.10_tpuvm
RUN git clone -b flash_attention https://github.com/pytorch-tpu/transformers.git
RUN cd transformers
RUN pip install .
RUN pip install torch~=2.4.0 torch_xla[tpu]~=2.4.0 torchvision -f https://storage.googleapis.com/libtpu-releases/index.html
RUN pip install -U "huggingface_hub[cli]"
RUN COPY requirements .
RUN pip install -r requirements.txt
   