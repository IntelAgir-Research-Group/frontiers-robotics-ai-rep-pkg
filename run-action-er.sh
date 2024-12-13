while true;
do
    echo "Cleaning the environment..."
    pkill python3
    rm -f *.csv
    rm -f energy*
    source setup.bash
    (echo "Killing..." && sleep 650 && pkill python3) &
    echo "Running actions on background..." 
    python3 $EXPERIMENT_RUNNER_PATH exp_runners/RunnerConfig-action.py
done
