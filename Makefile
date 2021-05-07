.ONESHELL:
SHELL := /bin/bash
SRC = $(wildcard ./*.ipynb)

build: 
	nbdev_build_lib
	nbdev_build_docs --mk_readme true
	nbdev_clean_nbs