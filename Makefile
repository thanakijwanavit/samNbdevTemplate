.PHONY: all test
.ONESHELL:
SHELL := /bin/bash
SRC = $(wildcard ./*.ipynb)

build: 
	nbdev_build_lib
	nbdev_build_docs --mk_readme true
	nbdev_clean_nbs
test: build
	sam validate
	sam build
	sam local invoke HelloWorld -e test/helloworld.json
    