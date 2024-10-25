FROM taprosoft/kotaemon:v1.0

# Set permissions for the folder /app
RUN mkdir -p /app && \
    chown -R 1001:0 /app && \
    chmod -R 775 /app

 # Set permissions for the folder /usr/local/lib/python3.10/site-packages/llama_index
RUN mkdir -p /usr/local/lib/python3.10/site-packages/llama_index && \
chown -R 1001:0 /usr/local/lib/python3.10/site-packages/llama_index && \
chmod -R 775 /usr/local/lib/python3.10/site-packages/llama_index   


 # Set permissions for the folder /.config/matplotlib
 RUN mkdir -p /.config/matplotlib && \
 chown -R 1001:0 /.config/matplotlib && \
 chmod -R 775 /.config/matplotlib  