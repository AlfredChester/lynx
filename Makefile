help:
	@echo  "FastDevCli development makefile"
	@echo
	@echo  "Usage: make <target>"
	@echo  "Targets:"
	@echo  "    up      Updates dev/test dependencies"
	@echo  "    deps    Ensure dev/test dependencies are installed"
	@echo  "    check   Checks that build is sane"
	@echo  "    test    Runs all tests"
	@echo  "    style   Auto-formats the code"
	@echo  "    lint    Auto-formats the code and check type hints"

up:
	pipenv update

deps:
	pipenv install

_check:
	python setup.py check
check: deps _build _check

# _test:
# 	./scripts/test.py
# test: deps _test

# _style:
# 	./scripts/format.py
# style: deps _style

_build:
	rm -fR dist/
	python setup.py sdist build
build: deps _build