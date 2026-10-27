name := site.orgpedia

.DEFAULT_GOAL := help
.PHONY: help install docs serve clean

help:
	$(info Please use 'make <target>', where <target> is one of:)
	$(info )
	$(info   install     Set up environment (npm packages and Python virtualenv))
	$(info   docs        Generate and minify the website (HTML & CSS) into docs/)
	$(info   serve       Start local preview web server at http://localhost:8500)
	$(info   clean       Remove temporary generated template artifacts)
	$(info )
	@echo # dummy command

install:
	npm install
	@if command -v uv > /dev/null 2>&1; then \
		uv sync; \
	fi

docs:
	python3 tools/minifyCSS.py templates miniCSS
	npx tailwindcss -c tailwind.config.js -i miniCSS/tailwindcss/input_new.css -o docs/c/output.css --minify
	python3 tools/minifyHTML.py miniCSS docs
	@echo "Website generated successfully in docs/"

serve:
	cd docs && python3 cors-server.py 8500

clean:
	rm -rf miniCSS
