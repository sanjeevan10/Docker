
# Use the official image as a parent image
FROM ubuntu:latest

# Update the system
RUN apt-get update && apt-get install openssh-server sudo -y

RUN useradd -rm -d /home/sanjeevan -s /bin/bash -g root -G sudo -u 1000 sanjeevan

RUN echo 'sanjeevan:sanjeevan' | chpasswd


RUN service ssh start

# Expose the SSH port
EXPOSE 22

# Run SSH
CMD ["/usr/sbin/sshd", "-D"]
