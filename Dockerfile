FROM ubuntu:22.04

ARG RUNNER_VERSION="2.299.2"
ENV DEBIAN_FRONTEND=noninteractive

RUN  useradd -m docker && \
    apt-get update && apt-get install -y --no-install-recommends \
    curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip && \
    cd /home/docker && mkdir actions-runner && cd actions-runner && \
    curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh

USER docker

ENTRYPOINT ["./start.sh"]
