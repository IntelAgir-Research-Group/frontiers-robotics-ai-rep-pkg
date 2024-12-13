pkill python3
rm -f *.csv
rm -f energy*
source setup.bash &&
python3 $EXPERIMENT_RUNNER_PATH exp_runners/RunnerConfig-pubsub.py
