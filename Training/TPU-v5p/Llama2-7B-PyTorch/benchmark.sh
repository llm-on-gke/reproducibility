TPU_NAME=rick-tpu-debian
PROJECT=northam-ce-mlai-tpu
ZONE=us-central1-a
# SCP the environment setup to all instances.
gcloud compute tpus tpu-vm scp config.json fsdp_config.json train.sh host.sh env.sh install_packages.sh requirements.txt $TPU_NAME:~ --worker=all --project $PROJECT --zone=$ZONE

# Actually runs the benchmark.
#gcloud compute tpus tpu-vm ssh $TPU_NAME --project $PROJECT --zone=$ZONE --worker=all --command="$(cat host.sh)"

# Copy the profile and output back
#gcloud compute tpus tpu-vm scp --recurse  $TPU_NAME:~/output ./ --project=$PROJECT --zone=$ZONE
