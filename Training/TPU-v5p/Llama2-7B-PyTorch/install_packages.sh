git clone -b v4.40.0  https://github.com/huggingface/transformers/
cd transformers
pip install . e
pip install torch~=2.4.0 torch_xla[tpu]~=2.4.0 torchvision -f https://storage.googleapis.com/libtpu-releases/index.html
pip install -U "huggingface_hub[cli]"
