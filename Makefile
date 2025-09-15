.PHONY: cov lint flake8 pytest all

cov:
	python -m pytest --cov=src/greeting

lint:
# 	python -m pylint $(git ls-files '*.py')
	python -m pylint src tests

flake8:
	python -m flake8

pytest:
	python -m pytest 

all: cov lint flake8 pytest