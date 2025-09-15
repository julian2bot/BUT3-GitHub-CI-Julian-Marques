.PHONY: cov covV2 lint flake8 pytest all

cov:
	python -m pytest --cov=src/greeting

lint:
# 	python -m pylint $(git ls-files '*.py')
	python -m pylint src tests

flake8:
	python -m flake8

pytest:
	python -m pytest 

covV2: 
	python -m pytest --cov --cov-report=term-missing

all: cov covV2 lint flake8 pytest