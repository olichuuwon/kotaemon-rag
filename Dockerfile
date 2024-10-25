# Use miniconda as the base image
FROM continuumio/miniconda3

# Set the working directory
WORKDIR /app

# Install required system packages for compiling and building
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Create a conda environment with the required Python version
RUN conda create -n kotaemon python=3.10

# Activate the conda environment, clone the repository, and install dependencies
RUN /bin/bash -c "source activate kotaemon && \
    git clone https://github.com/Cinnamon/kotaemon . && \
    pip install -e 'libs/kotaemon[all]' && \
    pip install -e 'libs/ktem'"

# Set environment variable to ensure the conda environment is activated for all commands
ENV PATH /opt/conda/envs/kotaemon/bin:$PATH

# Change permissions for the /app directory
RUN chgrp -R 0 /app && \
    chmod -R g=u /app

# Change permissions for the /app directory
RUN chgrp -R 0 /opt/conda/envs/kotaemon/lib/python3.10/site-packages/llama_index && \
chmod -R g=u /opt/conda/envs/kotaemon/lib/python3.10/site-packages/llama_index

# Change file permissions for models directory
RUN mkdir -p /.config/matplotlib && \
    chgrp -R 0 /.config/matplotlib && \
    chmod -R g=u /.config/matplotlib

# Change file permissions for models directory
RUN mkdir -p /.cache/matplotlib && \
    chgrp -R 0 /.cache/matplotlib && \
    chmod -R g=u /.cache/matplotlib

# Expose the port that Gradio uses
EXPOSE 7860

# Run the application
CMD ["python", "app.py"]
