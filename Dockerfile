# Dockerfile for a Mac jupyter notebook based on Ubuntu with the packages I care about
# Eric Gottlieb
# Rev 1 17 July 2024

# Using Ubuntu 24.04 as my base
FROM python:3.12

ARG PYTHON_ENV=devenv

ENV PYTHON_ENV=$PYTHON_ENV

# Install items that are required via apt-get
RUN apt-get update && apt-get -y install libhdf5-dev

# Setup/activate virtual environment and install libraries stored in requirements.txt via pip3
RUN mkdir requirements
COPY requirements.txt set_python_env.sh /requirements/
RUN bash ./requirements/set_python_env.sh

# Make port 8888 available outside of the container
EXPOSE 8888

# Default command to run when the container starts
# but can be overridden by passing command when use docker run with an arguemnt
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
