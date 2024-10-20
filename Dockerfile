FROM taprosoft/kotaemon:v1.0

# Set permissions for the folder /app/ktem_app_data
RUN mkdir -p /app/ktem_app_data && \
    chown -R 1001:0 /app/ktem_app_data && \
    chmod -R 775 /app/ktem_app_data
