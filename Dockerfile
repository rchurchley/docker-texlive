FROM debian:wheezy

# Download, extract, and run TeX Live installer from most recent CTAN disk image
# (Although downloading the whole disk image is slow and wasteful, for some
#  reason it still appears to be faster than running the online installer, at
#  least when Docker is running in a virtual machine.)

RUN apt-get update \
    && apt-get install -y wget bsdtar perl ca-certificates \
    && wget --progress=dot:giga \
            ftp://tug.org/texlive/historic/2013/texlive2013.iso \
    && mkdir /install \
    && bsdtar -xpC /install -f /texlive2013.iso \
    && rm /texlive2013.iso \
    && wget --directory-prefix=/install \
            https://raw.githubusercontent.com/rchurchley/docker-texlive/2013/installation.profile \
    && ./install/install-tl --profile /install/installation.profile \
    && rm -R /install \
    && mkdir /data \
    && mkdir /texmf

# Expose /data volume for user's document files and /texmf for user's packages
VOLUME ["/data", "/texmf"]
WORKDIR /data

# Default to compiling all .tex files in /data
CMD ["latexmk", "-pdf"]