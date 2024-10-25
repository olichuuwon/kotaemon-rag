FROM taprosoft/kotaemon:v1.0

# Set permissions for the folder /app
RUN mkdir -p /app && \
    chown -R 1001:0 /app && \
    chmod -R 775 /app
