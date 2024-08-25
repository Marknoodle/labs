# Start with a base image that includes the .NET SDK
FROM mcr.microsoft.com/dotnet/sdk:8.0

# Install Python and virtualenv
RUN apt-get update && \
    apt-get install -y python3-pip python3-venv

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install Jupyter
RUN . /opt/venv/bin/activate && pip install jupyterlab

# Install .NET Interactive, which enables .NET support in Jupyter
RUN . /opt/venv/bin/activate && \
    dotnet tool install -g Microsoft.dotnet-interactive --version 8.0.0 && \
    dotnet interactive jupyter install

# Expose the Jupyter Notebook port
EXPOSE 8888

# Activate the virtual environment by default and start Jupyter
CMD . /opt/venv/bin/activate && jupyter notebook --ip=0.0.0.0 --no-browser --allow-root
