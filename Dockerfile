FROM idm-docker-staging.packages.idmod.org/ubuntu-mono-pythonnet:c9372d5

COPY bin /app

# These are here to support user scripts.
RUN pip3 install numpy matplotlib scipy

# This causes pythonnet to include /app in the list of folders
# it looks in for assemblies.
ENV PYTHONPATH=/app
