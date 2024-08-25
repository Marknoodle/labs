FROM mcr.microsoft.com/dotnet/sdk:8.0

# Install Jupyter and .NET Interactive
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install jupyter
RUN dotnet tool install -g Microsoft.dotnet-interactive
ENV PATH $PATH:/root/.dotnet/tools
RUN dotnet interactive jupyter install

# Set up work directory
WORKDIR /app
COPY . .

# Start Jupyter when the container launches
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
