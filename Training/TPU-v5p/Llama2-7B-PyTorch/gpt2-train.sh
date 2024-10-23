     
   gcloud storage cp gs://cloud-tpu-tpuvm-artifacts/config/xl-ml-test/pytorch/gpt2/my_config_2.json transformers/examples/pytorch/language-modeling/ --recursive
   gcloud storage cp gs://cloud-tpu-tpuvm-artifacts/config/xl-ml-test/pytorch/gpt2/fsdp_config.json transformers/examples/pytorch/language-modeling/
   export PJRT_DEVICE=TPU
      cd transformers/
      export LD_LIBRARY_PATH=/usr/local/lib/
      export PT_XLA_DEBUG=0
      export USE_TORCH=ON
      python3 examples/pytorch/xla_spawn.py \
         --num_cores=8 \
         examples/pytorch/language-modeling/run_clm.py \
         --num_train_epochs=3 \
         --dataset_name=wikitext \
         --dataset_config_name=wikitext-2-raw-v1 \
         --per_device_train_batch_size=16 \
         --per_device_eval_batch_size=16 \
         --do_train \
         --do_eval \
         --logging_dir=./tensorboard-metrics \
         --cache_dir=./cache_dir \
         --output_dir=/tmp/test-clm \
         --overwrite_output_dir \
         --cache_dir=/tmp \
         --config_name=examples/pytorch/language-modeling/my_config_2.json \
         --tokenizer_name=gpt2 \
         --block_size=1024 \
         --optim=adafactor \
         --adafactor=true \
         --save_strategy=no \
         --logging_strategy=no \
         --fsdp=full_shard \
         --fsdp_config=examples/pytorch/language-modeling/fsdp_config.json