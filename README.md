# Supported tags and Dockerfile links

- `latest` ([*latest/Dockerfile*][latest])
- `metropolis` ([*latest/metropolis/Dockerfile*][metropolis])
- `2015` ([*2015/Dockerfile*][2015])
- `2014` ([*2014/Dockerfile*][2014])
- `2013` ([*2013/Dockerfile*][2013])
- `2012` ([*2012/Dockerfile*][2012])

[latest]: https://github.com/rchurchley/docker-texlive/blob/latest/Dockerfile
[2015]: https://github.com/rchurchley/docker-texlive/blob/2015/Dockerfile
[2014]: https://github.com/rchurchley/docker-texlive/blob/2014/Dockerfile
[2013]: https://github.com/rchurchley/docker-texlive/blob/2013/Dockerfile
[2012]: https://github.com/rchurchley/docker-texlive/blob/2012/Dockerfile
[metropolis]: https://github.com/rchurchley/docker-texlive/blob/latest/metropolis/Dockerfile

The `latest` image contains a complete installation of the most recent general release of TeX Live (currently TeX Live 2016, released around 23 May 2016). The `metropolis` image additionally includes the [Fira Sans, Fira Code, and Fira Mono](https://carrois.com/typefaces/FiraSans/) type families, which is used by the [Metropolis theme](https://github.com/matze/mtheme) for Beamer presentations.



# About TeX Live

[TeX Live](https://www.tug.org/texlive/) is a comprehensive TeX system with all the major TeX-related programs, macro packages, and fonts that are free software, including support for many languages around the world.
This repo provides Dockerfiles for current and historical versions of TeX Live  based on the disk images released by the [TeX Users Group](https://www.tug.org).

These Dockerfiles are intended for authors and package maintainers who need a full TeX distribution for typesetting or testing purposes. If you are incorporating LaTeX into an automated build process, please consider using a more 


# Basic usage

These images can be used to compile TeX and LaTeX documents by mounting the directory containing your document files.

```bash
docker run --rm -v $(pwd):/data rchurchley/texlive
```

If your document depends on custom packages, you can also mount a local `texmf` tree where you have them installed.

```bash
docker run --rm -v $(pwd):/data -v ~/texmf:/texmf rchurchley/texlive
```

The default command executed when running these images is `latexmk -pdf`, which compiles all `*.tex` files in the directory. If you need to run a different command, you can always pass it to `docker run`.

```bash
docker run --rm -v $(pwd):/data rchurchley/texlive latex foo.dtx
```