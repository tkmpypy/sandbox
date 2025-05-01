.PHONY: act

act:
	act -W ./.github/workflows/cached-ci.yml --container-architecture linux/amd64
