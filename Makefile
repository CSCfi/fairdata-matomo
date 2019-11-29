###############################################################
# Matomo Demo service deployment to cPouta.
#
# Usage: make
#
# Author(s):
#     Juhapekka Piiroinen <juhapekka.piiroinen@csc.fi>
#
# License: MIT
#
# (C) 2019 Copyright CSC – IT CENTER FOR SCIENCE LTD.
# All Rights Reserved.
###############################################################
all: venv
	@echo "=============================================================="
	@echo " Matomo Demo service deployment to cPouta."
	@echo "=============================================================="
	@test -f openrc.sh || echo
	@test -f openrc.sh || echo "Download the openrc.sh file from: https://pouta.csc.fi/dashboard/project/access_and_security/api_access/openrc/"
	@test -f openrc.sh || echo "Place the openrc.sh file into this directory: ${PWD}"
	@test -f openrc.sh || echo
	@test -f openrc.sh || echo "press <enter> when ready or <ctrl+c> to cancel."
	@test -f openrc.sh || read
	@echo
	@echo "The password is for your CSC account."
	@echo
	@source venv/bin/activate && source openrc.sh && ansible-playbook main.playbook.yml --ask-vault-pass

venv:
	@python3 -m venv venv
	@source venv/bin/activate && pip install -r requirements.txt
	@source venv/bin/activate && pip install --upgrade pip