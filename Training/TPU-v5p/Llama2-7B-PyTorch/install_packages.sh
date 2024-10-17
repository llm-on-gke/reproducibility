git clone https://github.com/huggingface/transformers/
pip install git+https://github.com/huggingface/transformers
pip install transformers[torch] datasets evaluate
pip install torch~=2.4.0 torch_xla[tpu]~=2.4.0 torchvision -f https://storage.googleapis.com/libtpu-releases/index.html
