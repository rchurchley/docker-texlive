# Dockerized TeX Live distributions

Dockerfiles for current and historical versions of TeX Live


## Supported tags

- `latest` ([*rchurchley/texlive-latest/Dockerfile*][latest])

[latest]: https://github.com/rchurchley/docker-texlive/blob/latest/Dockerfile


## About TeX Live

[TeX Live](https://www.tug.org/texlive/) is a comprehensive TeX system with all the major TeX-related programs, macro packages, and fonts that are free software, including support for many languages around the world.
This repo provides Dockerfiles for current and historical versions of TeX Live  based on the disk images released by the [TeX Users Group](https://www.tug.org).


## Basic usage

These images can be used to compile TeX and LaTeX documents by mounting the directory containing your document files.

```
docker run --rm -v $(pwd):/data rchurchley/texlive
```

If your document depends on custom packages, you can also mount a local `texmf` tree where you have them installed.

```
docker run --rm -v $(pwd):/data -v ~/texmf:/texmf rchurchley/texlive
```

The default command executed when running these images is `latexmk -pdf`, which compiles all `*.tex` files in the directory. If you need to run a different command, you can always pass it to `docker run`.

```
docker run --rm -v $(pwd):/data rchurchley/texlive latex foo.dtx
```