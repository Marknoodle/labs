# Use .NET SDK base image
FROM mcr.microsoft.com/dotnet/sdk:8.0

# Install Python and venv
RUN apt-get update && apt-get install -y python3-pip python3-venv

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Jupyter in the virtual environment
RUN pip3 install jupyter

# Install .NET Interactive
RUN dotnet tool install -g Microsoft.dotnet-interactive
ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet interactive jupyter install

# Set up work directory
WORKDIR /app
COPY . .

# Start Jupyter when the container launches
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
