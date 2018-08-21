## docker-texlive-alpine

simple dockerfile that runs TeX Live 2018 (in full scheme) in alpine linux 3.8

## usage

docker run -v **YOUR-WORKING-DIRECTORY-HERE**:/home -it *minisena/docker-texlive-alpine*
*then* xelatex/pdflatex/lualatex ...