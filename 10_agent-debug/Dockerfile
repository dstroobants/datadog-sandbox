FROM datadog/agent:7

# Configure Agent
COPY datadog.yaml /etc/datadog-agent/datadog.yaml
COPY conf-disk.yaml /etc/datadog-agent/conf.d/disk.d/conf.yaml
COPY disk.py /opt/datadog-agent/embedded/lib/python3.8/site-packages/datadog_checks/disk/disk.py
