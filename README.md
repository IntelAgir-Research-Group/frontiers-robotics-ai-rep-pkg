# energy-ros2-cpp-python
Replication package of our paper: *Comparing Energy Efficiency in ROS Communication]{Comparing Energy Efficiency in ROS Communication Across Programming Languages and Preset Workloads* - Document under review: `Frontiers Robotics and AI`.

## How to cite us

TBA

## Algoritm Complexity Measurement

We have a local SonarQube deployment to check the algorithm measurements.

To run it in your machine, follow the steps:

```bash
bash sonarqube.sh
bash sonarqube-scanner.sh
```

In your browser, navigate to `http://localhost:9000` and use the default username `admin`, which is also the password (you are requested to change it after loggin in).

Since we need special wrappers for `Cpp` algorithms, which are not trivial to set up, you can also use the [`lizard`](https://ascl.net/1906.011) tool for both, `Python` and `Cpp`.

## Running Experiments

For running the experiments, we rely on [Experiment-Runner](https://github.com/S2-group/experiment-runner) (ER). Please, look at its documentation to get started.

Each experiment is defined in a single [RunnerConfig-**\[communication\]**.py](./exp-runner/) file.

Install the project dependencies:

```bash
pip3 install -r requirements.txt
```

Install `PowerJoular` for energy consumption measurements: [Documentation WebSite](https://joular.github.io/powerjoular/guide/installation.html).

Configure the right paths in the `setup.bash` file, and then run the experiments for the three communication patterns, one by one:

```bash
source setup.bash
bash run-pubsub-er.sh
bash run-service-er.sh
bash run-action-er.sh
```

## Statistical Analysis and Graph Generation

Change directory to `data-analys` folder:

```bash
cd data-analisys/
```

Run the statistical tests:
```bash
python3 statistical_tests.py
```

The statistical log will be separated by run identification. All the graphs are saved in the `graphs` folder, with the following subfolders:

```
- no_transf-no_out/  Original data.
- no_transf-out/     Transformed data.
- transf-no_out/     Data without outliers.
- tranf-out/         Transformed data without outliers.
```

For overall violin plotting, run the follow command:
```bash
python3 gen_overall_graphs.py
```

For `Latex` tables with mean values, run the follow command:
```bash
python3 gen_mean_table.py
```

## Reporting Issues

For any issues, please contact Professor Michel Albonico (e-mail: [michelalbonico@utfpr.edu.br](mailto:michelalbonico@utfpr.edu.br))