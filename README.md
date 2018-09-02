# Ansible Linter

A dockerized `ansible-lint` with extended rules from [galaxy-lint-rules](https://github.com/ansible/galaxy-lint-rules)

## Usage

This runs `ansible-lint` in verbose mode against given volume.

```
docker run --rm -v /path/to/ansible/role/:/code alistr/ansible-linter
```