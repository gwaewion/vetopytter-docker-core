#!/bin/sh

if [ -f /vetopytter-core/VetoPytter.py ]
then
	cd /vetopytter-core
	python3 -B VetoPytter.py
else
	cd /vetopytter-core
	git clone https://github.com/gwaewion/vetopytter-core.git .
	sed -i "s/host: CHANGE_ME/host: "${MONGODB_ADDRESS}"/" config.yml
	sed -i "s/database: CHANGE_ME/database: "${MONGODB_DBNAME}"/" config.yml
	sed -i "s/username: CHANGE_ME/username: "${MONGODB_USERNAME}"/" config.yml
	sed -i "s/password: CHANGE_ME/password: "${MONGODB_PASSWORD}"/" config.yml
	python3 -B VetoPytter.py
fi