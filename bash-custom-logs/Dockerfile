FROM debian

ARG DD_API_KEY
ARG DD_SITE

WORKDIR /logging-script
COPY app/. .

# Install curl to download the datadog agent
RUN apt-get update && apt-get install curl -y

# Install Datadog Agent
RUN DD_AGENT_MAJOR_VERSION=7 \
    DD_API_KEY=$DD_API_KEY DD_SITE=$DD_SITE \
    bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

# For whatever reason, the security-agent.yaml file is missing when installing on debian
RUN cp /etc/datadog-agent/security-agent.yaml.example /etc/datadog-agent/security-agent.yaml \
    && chmod 755 /etc/datadog-agent/security-agent.yaml

# Update Datadog agent to activate log collection
RUN sed -i 's/# logs_enabled: false/logs_enabled: true/' /etc/datadog-agent/datadog.yaml

# Set log level to Debug
# RUN sed -i "s/# log_level: 'info'/log_level: 'debug'/" /etc/datadog-agent/datadog.yaml

# Create configuration file for the agent
RUN touch script.log \
    && mkdir /etc/datadog-agent/conf.d/logging-script.d \
    && cat script-conf.yaml > /etc/datadog-agent/conf.d/logging-script.d/conf.yaml

# Can be used for testing
# RUN service datadog-agent start

CMD ["bash","script.sh"]
