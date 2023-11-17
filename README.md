# khinsider Docker Container

[![Build](https://github.com/gabe565/docker-khinsider/actions/workflows/build.yml/badge.svg)](https://github.com/gabe565/docker-khinsider/actions/workflows/build.yml)

This repo builds container images for [obskyr/khinsider](https://github.com/obskyr/khinsider).

Release tags are automatically updated by Renovate bot, so new `khinsider.py` releases will be available in this repository within a few hours.

## Images

- [ghcr.io/gabe565/khinsider](https://github.com/gabe565/docker-khinsider/pkgs/container/khinsider)

## Usage

See [`khinsider.py` usage docs](https://github.com/obskyr/khinsider#usage). All arguments can be added to the following command:

```shell
docker run --rm -it -v "$PWD:/data" ghcr.io/gabe565/khinsider
```

For example, to download the soundtrack for Mother 3 as FLAC to the current directory, run:

```shell
docker run --rm -it -v "$PWD:/data" ghcr.io/gabe565/khinsider --format flac mother-3
```
