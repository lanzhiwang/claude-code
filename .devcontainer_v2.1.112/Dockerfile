FROM node:20
# [ 1/11] FROM docker.io/library/node:20@sha256:8789e1e0752d81088a085689c04fdb7a5b16e8102e353118a4b049bbf05db8ac

ARG TZ
ENV TZ="$TZ"

ARG CLAUDE_CODE_VERSION=latest

# Install basic development tools and iptables/ipset
RUN set -x && apt-get update && apt-get install -y --no-install-recommends \
    less \
    git \
    procps \
    sudo \
    fzf \
    zsh \
    man-db \
    unzip \
    gnupg2 \
    gh \
    iptables \
    ipset \
    iproute2 \
    dnsutils \
    aggregate \
    jq \
    nano \
    vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
# [ 2/11] RUN
# apt-get update &&
# apt-get install -y --no-install-recommends less git procps sudo fzf zsh man-db unzip gnupg2 gh iptables ipset iproute2 dnsutils aggregate jq nano vim &&
# apt-get clean && rm -rf /var/lib/apt/lists/*

# Ensure default node user has access to /usr/local/share
RUN set -x && mkdir -p /usr/local/share/npm-global && \
    chown -R node:node /usr/local/share
# [ 3/11] RUN
# mkdir -p /usr/local/share/npm-global &&
# chown -R node:node /usr/local/share

ARG USERNAME=node

# Persist bash history.
RUN set -x && SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R $USERNAME /commandhistory
# [ 4/11] RUN
# SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" &&
# mkdir /commandhistory &&
# touch /commandhistory/.bash_history &&
# chown -R node /commandhistory

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true

# Create workspace and config directories and set permissions
RUN set -x && mkdir -p /workspace /home/node/.claude && \
    chown -R node:node /workspace /home/node/.claude
# [ 5/11] RUN
# mkdir -p /workspace /home/node/.claude &&
# chown -R node:node /workspace /home/node/.claude

WORKDIR /workspace
# [ 6/11] WORKDIR /workspace

ARG GIT_DELTA_VERSION=0.18.2
RUN set -x && ARCH=$(dpkg --print-architecture) && \
    wget "https://github.com/dandavison/delta/releases/download/${GIT_DELTA_VERSION}/git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb" && \
    sudo dpkg -i "git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb" && \
    rm "git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb"
# [ 7/11] RUN
# ARCH=$(dpkg --print-architecture) &&
# wget "https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_${ARCH}.deb" &&
# sudo dpkg -i "git-delta_0.18.2_${ARCH}.deb" &&
# rm "git-delta_0.18.2_${ARCH}.deb"

# Set up non-root user
USER node

# Install global packages
ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH=$PATH:/usr/local/share/npm-global/bin

# Set the default shell to zsh rather than sh
ENV SHELL=/bin/zsh

# Set the default editor and visual
ENV EDITOR=nano
ENV VISUAL=nano

# Default powerline10k theme
ARG ZSH_IN_DOCKER_VERSION=1.2.0
RUN set -x && sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v${ZSH_IN_DOCKER_VERSION}/zsh-in-docker.sh)" -- \
    -p git \
    -p fzf \
    -a "source /usr/share/doc/fzf/examples/key-bindings.zsh" \
    -a "source /usr/share/doc/fzf/examples/completion.zsh" \
    -a "export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    -x
# [ 8/11] RUN
# sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.0/zsh-in-docker.sh)" -- -p git -p fzf -a "source /usr/share/doc/fzf/examples/key-bindings.zsh" -a "source /usr/share/doc/fzf/examples/completion.zsh" -a "export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" -x

# Install Claude
RUN set -x && npm install -g @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION}


# Copy and set up firewall script
COPY init-firewall.sh /usr/local/bin/
USER root
RUN set -x && chmod +x /usr/local/bin/init-firewall.sh && \
    echo "node ALL=(root) NOPASSWD: /usr/local/bin/init-firewall.sh" > /etc/sudoers.d/node-firewall && \
    chmod 0440 /etc/sudoers.d/node-firewall
USER node
