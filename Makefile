# Build .env files for each example app
build_file_from_sample = if [ ! -e $(1) ]; then cp $(1)-sample $(1); echo "Created $(1)"; else echo "Already built $(1)"; fi
EXAMPLES = legacy-settings multi-app zero-config fully-loaded
.PHONY: .env
.env:
	@for dir in $(shell find ./examples -mindepth 1 -maxdepth 1 -type d); do \
		$(call build_file_from_sample, $$dir/.env); \
	done

.PHONY: build
build:
	sh scripts/build.sh

.PHONY: legacy-settings-demo
legacy-settings-demo: .env
	sh examples/legacy_settings/start.sh

.PHONY: legacy-settings-demo
new-settings-demo: .env
	sh examples/new_settings/start.sh

.PHONY: build-multi-app-demo
build-multi-app-demo: .env
	sh scripts/build_app.sh multi_app

.PHONY: multi-app-demo
multi-app-demo: .env
	sh scripts/run_app.sh multi_app
