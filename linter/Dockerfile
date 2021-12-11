FROM python:3.9

# Set environment variables
ENV HOME=/root
ENV LINT_CONFIG_PATH="${HOME}/.lint"
ENV WORKDIR=/app
ENV LINT_CUSTOM_CONFIG_PATH="${WORKDIR}/.lint"

# Add repo for Node.js
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

# Install requirements
RUN apt-get update \
  && apt-get install --no-install-recommends -qy \
    nodejs \
    git \
    apt-transport-https \
  && rm -rf /var/lib/apt/lists/*

# Install linter for commits (https://github.com/conventional-changelog/commitlint)
RUN npm install -g \
  @commitlint/config-conventional@15.0.0 \
  @commitlint/cli@15.0.0

# Install linter for Dockerfile (https://github.com/replicatedhq/dockerfilelint)
RUN npm install -g \
  dockerfilelint@1.8.0

# Install linter for Markdown (https://github.com/igorshubovych/markdownlint-cli)
RUN npm install -g \
  markdownlint-cli@0.30.0

# Install linter for Shell scripts (https://github.com/koalaman/shellcheck)
RUN apt-get install --no-install-recommends -qy \
    xz-utils \
    && scversion="stable" # or "v0.4.7", or "latest" \
    && wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv \
    && cp "shellcheck-${scversion}/shellcheck" /usr/bin/ \
    && apt-get install --no-install-recommends -qy \
    shellcheck

# Install linter for Yaml (https://github.com/adrienverge/yamllint)
RUN pip3 install \
    yamllint==1.26.3

# Install linter for Python (https://github.com/PyCQA/flake8)
RUN pip3 install \
  flake8==4.0.1 \
  flake8-import-order==0.18.1 \
  flake8-quotes==3.3.1 \
  flake8-commas==2.1.0 \
  flake8-docstrings==1.6.0

# Adds shell commands
COPY ./commands/*.sh /usr/bin/
RUN find /usr/bin -type f -name "*.sh" | while read NAME ; do mv "${NAME}" "${NAME%.sh}" ; done

# Default lint configurations
RUN mkdir -p ${LINT_CONFIG_PATH} ${LINT_CUSTOM_CONFIG_PATH}
COPY ./.lint/* ${LINT_CONFIG_PATH}/

# Workdir and entrypoint
WORKDIR ${WORKDIR}

ENTRYPOINT ["docker-entrypoint"]
