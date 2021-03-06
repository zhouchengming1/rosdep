.PHONY: all setup clean_dist distro clean install testsetup test

clean_dist:
	-rm -f MANIFEST
	-rm -rf dist
	-rm -rf deb_dist

distro: setup clean_dist
	python setup.py sdist

clean: clean_dist
	echo "clean"

install: distro
	sudo checkinstall python setup.py install

testsetup:
	echo "running rosdep tests"

test: testsetup
	nosetests --with-coverage --cover-package=rosdep2 --with-xunit test
