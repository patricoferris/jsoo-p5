

.PHONY: docs
docs:
			dune build @default @doc
			mkdir -p ./docs/api
			cp -r _build/default/_doc/_html/ ./docs/api
			chmod -R +w ./docs