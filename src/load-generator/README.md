# Load Generator

The load generator creates simulated traffic to the demo.

## Architecture

The load generator is configured in a master-worker architecture to handle high load efficiently:

- **Master**: Coordinates test execution and provides the web UI
- **Workers**: Execute the actual load tests by generating requests

This distributed setup allows for better CPU utilization and higher scalability. By default, the system starts with 1 master and 3 worker nodes, but you can adjust the number of workers in the docker-compose.yml file based on your needs.

## Accessing the Load Generator

You can access the web interface to Locust at `http://localhost:8080/loadgen/`.

## Runtime Configuration

The load generator can run in three modes:

- **standalone**: Default single-node mode (set `LOCUST_MODE=""`)
- **master**: Coordinates test execution (set `LOCUST_MODE=master`)
- **worker**: Executes tests, connects to master (set `LOCUST_MODE=worker` and `LOCUST_MASTER=<master-hostname>`)

## Modifying the Load Generator

Please see the [Locust
documentation](https://docs.locust.io/en/2.16.0/writing-a-locustfile.html) to
learn more about modifying the locustfile.

For distributed load testing information, refer to [Locust's distributed load testing documentation](https://docs.locust.io/en/stable/running-distributed.html).
