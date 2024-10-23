git clone -b flash_attention https://github.com/pytorch-tpu/transformers.git
cd transformers
pip install .
pip install torch~=2.4.0 torch_xla[tpu]~=2.4.0 torchvision -f https://storage.googleapis.com/libtpu-releases/index.html
pip install -U "huggingface_hub[cli]"
