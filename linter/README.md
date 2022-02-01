# Linter

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)][docker-hub]

A docker image to ensure the code quality of our Python projects.

```shell
docker pull urnai/linter
```

Linters in this image and which command to invoke it:

| Linter                          | Command                       | Config file         |
|---------------------------------|-------------------------------|---------------------|
| [Commit (git)][linter-commit]   | `lint-commit <target_branch>` | `.commitlintrc`     |
| [Dockerfile][linter-dockerfile] | `lint-dockerfile`             | `.dockerfilelintrc` |
| [Markdown][linter-markdown]     | `lint-markdown`               | `.markdownlintrc`   |
| [Python][linter-python]         | `lint-python`                 | `.flake8`           |
| [Shell script][linter-shell]    | `lint-shell-script`           | `.shellcheckrc`     |
| [YAML][linter-yaml]             | `lint-yaml`                   | `.yamllint`         |

You can create a `.lint/` directory with your linters configs,
exceptionally the `.shellcheckrc` file must be in the main directory.

## How to use

```shell
docker run --rm -v $(pwd):/app urnai/linter " \
  lint-commit origin/main \
  lint-markdown \
  lint-python"
```

[docker-hub]: https://hub.docker.com/r/urnai/linter
[linter-commit]: https://github.com/conventional-changelog/commitlint
[linter-dockerfile]: https://github.com/replicatedhq/dockerfilelint
[linter-markdown]: https://github.com/igorshubovych/markdownlint-cli
[linter-python]: https://github.com/PyCQA/flake8
[linter-shell]: https://github.com/koalaman/shellcheck
[linter-yaml]: https://github.com/adrienverge/yamllint
