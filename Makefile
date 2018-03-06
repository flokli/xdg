check: lint test

lint:
	mypy --ignore-missing-imports --strict xdg.py test/*.py
	flake8 xdg.py test/*.py
	pylint -r n -s n xdg.py test/*.py

test:
	pytest

format:
	yapf -i xdg.py test/*.py

upload: check
	python setup.py sdist bdist_wheel
	twine upload -s dist/*

clean:
	$(RM) -r $(wildcard *.egg-info *.pyc) build dist

.PHONY: clean format check lint test upload
