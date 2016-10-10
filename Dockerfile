FROM quay.io/pires/docker-elasticsearch:2.4.1

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch kubernetes discovery plug-in
RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.4.1 --verbose
# Install Elasticsearch prometheus exporter plug-in
RUN /elasticsearch/bin/plugin install vvanholl/elasticsearch-prometheus-exporter/2.4.1.0 --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery
