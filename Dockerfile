# Use .NET 8 SDK base image
FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy

# Install Python, venv, and Jupyter
RUN apt-get update && \
    apt-get install -y python3-pip python3-venv && \
    python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip3 install jupyter && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV PATH="/opt/venv/bin:/root/.dotnet/tools:${PATH}"

# Install .NET Interactive
RUN dotnet tool install -g Microsoft.dotnet-interactive && \
    dotnet interactive jupyter install

# Set up work directory
WORKDIR /app
COPY . .

# Start Jupyter when the container launches
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
