FROM alpine:3.18

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
    npm \
    python3 \
    py3-pip
RUN git config --global --add safe.directory /app

# Install linter for commits (https://github.com/conventional-changelog/commitlint)
RUN npm install -g \
  @commitlint/config-conventional@17.6.6 \
  @commitlint/cli@17.6.6

# Install linter for Dockerfile (https://github.com/replicatedhq/dockerfilelint)
RUN npm install -g \
  dockerfilelint@1.8.0

# Install linter for Markdown (https://github.com/igorshubovych/markdownlint-cli)
RUN npm install -g \
  markdownlint-cli@0.33.0

# Install linter for Shell scripts (https://github.com/koalaman/shellcheck)
RUN apk --no-cache add shellcheck

# Install linter for Yaml (https://github.com/adrienverge/yamllint)
RUN apk --no-cache add yamllint

# Install linter for Python (https://github.com/PyCQA/flake8)
RUN pip3 install \
  flake8==6.0.0 \
  flake8-import-order==0.18.2 \
  flake8-quotes==3.3.2 \
  flake8-commas==2.1.0 \
  flake8-docstrings==1.7.0

# Adds shell commands
COPY ./commands/*.sh /usr/bin/
RUN find /usr/bin -type f -name "*.sh" | while read NAME ; do mv "${NAME}" "${NAME%.sh}" ; done

# Default lint configurations
RUN mkdir -p ${LINT_CONFIG_PATH} ${LINT_CUSTOM_CONFIG_PATH}
COPY ./.lint/* ${LINT_CONFIG_PATH}/

# Workdir and entrypoint
WORKDIR ${WORKDIR}
ENTRYPOINT ["docker-entrypoint"]
