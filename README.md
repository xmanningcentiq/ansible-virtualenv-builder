# ansible-virtualenv-builder

## Description

Bash script that automates the building of Ansible virtual environments. The
purpose of these virtual environments is to provide disposable Ansible
installations for running playbooks.

## Requirements

 * Docker

## Run

Basic usage:

```
$ ./build.sh [environment]
```

To get a list of environments, run `./build.sh` without arguments:

```
$ ./build.sh

Please provide an environment name!

Available Environments:

  - redhat7
  - sles12
  - ubuntuxenial

```

Virtual Environments will be output to the `out/` directory.
