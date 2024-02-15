FROM alpine:3.19.1

# Set environment variables
ENV HOME=/root
ENV LINT_CONFIG_PATH="${HOME}/.lint"
ENV WORKDIR=/app
ENV LINT_CUSTOM_CONFIG_PATH="${WORKDIR}/.lint"

# Install packages
RUN apk --no-cache add findutils  \
    file \
    curl \
    bash-completion \
    git \
    nodejs \
    npm
RUN git config --global --add safe.directory /app

# Install linter for commits (https://github.com/conventional-changelog/commitlint)
RUN npm install -g \
    @commitlint/config-conventional@18.6.0 \
    @commitlint/cli@18.6.0

# Install linter for Dockerfile (https://github.com/hadolint/hadolint)
RUN wget --no-verbose -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 && \
    chmod +x /bin/hadolint

# Install linter for Markdown (https://github.com/igorshubovych/markdownlint-cli)
RUN npm install -g \
    markdownlint-cli@0.39.0

# Install linter for Shell scripts (https://github.com/koalaman/shellcheck)
RUN apk --no-cache add shellcheck

# Install linter for Yaml (https://github.com/adrienverge/yamllint)
RUN apk --no-cache add yamllint

# Install Python packages
RUN apk --no-cache add python3 \
  py3-pip

# Virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install linter for Python (https://github.com/astral-sh/ruff)
RUN pip3 install --no-cache-dir \
  ruff==0.2.1

# Adds shell commands
COPY ./commands/* /usr/bin/

# Default lint configurations
# hadolint ignore=SC2086
RUN mkdir -p ${LINT_CONFIG_PATH} ${LINT_CUSTOM_CONFIG_PATH}
COPY ./.lint/* ${LINT_CONFIG_PATH}/

# Workdir and entrypoint
WORKDIR ${WORKDIR}
ENTRYPOINT ["docker-entrypoint"]