# Replication Package: Comparing Energy Efficiency in ROS Communication Across Programming Languages and Preset Workloads
Document under review: `Frontiers Robotics and AI`.


The Robot Operating System (ROS) is a widely used framework for robotic software development, providing robust client libraries for both C++ and Python. These languages, with their differing levels of abstraction, exhibit distinct resource usage patterns, including power and energy consumption - an increasingly critical quality metric in robotics. In this study, we evaluate the energy efficiency of ROS 2 nodes implemented in C++ and Python, focusing on the primary ROS communication paradigms: topics, services, and actions. Through a series of empirical experiments, with programming language, message interval, and number of clients as independent variables, we analyze the impact on energy efficiency across implementations of the three paradigms. Our data analysis demonstrates that Python consistently demands more computational resources, leading to higher power consumption compared to C++. Furthermore, we find that message frequency is a highly influential factor, while the number of clients has a more variable and less significant effect on resource usage, despite revealing unexpected architectural behaviors of underlying programming and communication layers.


## How to cite us

M. Albonico, M. B. Canizza, and A. Wortmann, “Energy Efficiency in ROS Communication: A Comparison Across Programming Languages and Workloads,” Front. Robot. AI, vol. 12, Jan. 2025, doi: 10.3389/frobt.2025.1548250.

Bibtex:
```

@article{albonico_energy_2025,
	title = {Energy {Efficiency} in {ROS} {Communication}: {A} {Comparison} {Across} {Programming} {Languages} and {Workloads}},
	volume = {12},
	issn = {2296-9144},
	shorttitle = {Energy {Efficiency} in {ROS} {Communication}},
	url = {https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.2025.1548250/abstract},
	doi = {10.3389/frobt.2025.1548250},
	language = {English},
	journal = {Frontiers in Robotics and AI},
	author = {Albonico, Michel and Canizza, Manuela Bechara and Wortmann, Andreas},
	month = jan,
	year = {2025},
	note = {Publisher: Frontiers}
}
```


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

Each experiment is defined in a single [RunnerConfig-**\[communication\]**.py](./exp_runners/) file.

Install the project dependencies:

```bash
python3 -m venv .venv
source .venv/bin/activate
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

For the experiments, we provide extra drivers (for Docker orchestrationg) and profilers (for CPU, Memory and Energy), which are available in the `exp_runners` folder.

If you prefer, you can also run it in `standalone` mode, with a fully bash-based orchestration (it eliminates the orchestration layer - no impact in the results):

```bash
source setup.bash
bash run-pubsub-standalone.sh
bash run-service-standalone.sh
bash run-action-standalone.sh
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
