FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    vim \
    strace \
    && rm -rf /var/lib/apt/lists/*

# Prepend log to /etc/profile
RUN echo "echo 'Sourced /etc/profile...'" | cat - /etc/profile > temp && mv temp /etc/profile

RUN useradd -ms /bin/bash other_user

CMD ["/bin/bash"]
