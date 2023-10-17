# Build .env files for each example app
build_file_from_sample = if [ ! -e $(1) ]; then cp $(1)-sample $(1); echo "Created $(1)"; else echo "Already built $(1)"; fi
EXAMPLES = legacy-settings multi-app zero-config fully-loaded
.PHONY: .env
.env:
	@for dir in $(shell find ./examples -mindepth 1 -maxdepth 1 -type d); do \
		$(call build_file_from_sample, $$dir/.env); \
	done

.PHONY: legacy-settings-demo
legacy-settings-demo: .env
	sh run_example_app.sh legacy-settings
