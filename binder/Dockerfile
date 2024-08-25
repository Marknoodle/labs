# Start with a base image that includes the .NET SDK
FROM mcr.microsoft.com/dotnet/sdk:8.0

# Install Jupyter Notebook
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install jupyterlab

# Install .NET Interactive, which enables .NET support in Jupyter
RUN dotnet tool install -g Microsoft.dotnet-interactive \
    --version 8.0.0 && \
    dotnet interactive jupyter install

# Expose the Jupyter Notebook port
EXPOSE 8888

# Set up a default command to run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
