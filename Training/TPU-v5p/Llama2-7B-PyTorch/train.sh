#!/bin/bash
# Remove existing repo and old data.
LOCAL_DIR=$PWD
#rm -rf "${LOCAL_DIR}/output"
#rm -rf "${LOCAL_DIR}/plugins"
#rm -rf "${LOCAL_DIR}/cache"
mkdir -p "${LOCAL_DIR}/output"
mkdir -p "${LOCAL_DIR}/plugins"
mkdir -p "${LOCAL_DIR}/cache"

unset LD_PRELOAD

source env.sh
cd transformers/
python3 examples/pytorch/language-modeling/run_clm.py \
  --dataset_name wikitext \
  --dataset_config_name wikitext-2-raw-v1 \
  --per_device_train_batch_size "$BATCH_SIZE" \
  --do_train \
  --output_dir "${LOCAL_DIR}/output/test-clm" \
  --overwrite_output_dir \
  --config_name "${LOCAL_DIR}/config.json" \
  --cache_dir "${LOCAL_DIR}/cache" \
  --tokenizer_name meta-llama/Llama-2-7b-hf \
  --block_size "$SEQ_LENGTH" \
  --optim adafactor \
  --save_strategy no \
  --logging_strategy no \
  --fsdp "full_shard" \
  --fsdp_config "${LOCAL_DIR}/fsdp_config.json" \
  --torch_dtype bfloat16 \
  --dataloader_drop_last yes \
  --flash_attention \
  --max_steps "$MAX_STEPS"

