setup-hooks:
	chmod -f +x ./qa/scripts/setup-hooks.sh || true
	QA_DIR=$$(pwd)/qa ./qa/scripts/setup-hooks.sh