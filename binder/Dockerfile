FROM mcr.microsoft.com/dotnet/sdk:8.0

# Install minimal Jupyter setup
RUN apt-get update && apt-get install -y python3-pip python3-venv
RUN python3 -m venv /opt/venv
RUN . /opt/venv/bin/activate && pip install jupyterlab

# Install .NET Interactive
RUN dotnet tool install -g Microsoft.dotnet-interactive
ENV PATH="$PATH:/root/.dotnet/tools"

# Install .NET Interactive for Jupyter
RUN . /opt/venv/bin/activate && dotnet interactive jupyter install

EXPOSE 8888
CMD . /opt/venv/bin/activate && jupyter notebook --ip=0.0.0.0 --no-browser --allow-root
