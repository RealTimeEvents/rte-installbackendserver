FROM ubuntu:23.10

# Install SSH server
RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get install -y git && \
    apt-get install -y ufw&& \
    apt-get install -y openssh-server && \
    if [ ! -d "/var/run/sshd" ]; then mkdir /var/run/sshd; fi

# Allow root login and password authentication
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Add the startup script
COPY install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh

CMD ["/usr/local/bin/install.sh"]
