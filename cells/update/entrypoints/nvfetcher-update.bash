#!/usr/bin/env bash
cd "$(dirname "$@")"
# shellcheck disable=all
nvfetcher -c "$PRJ_ROOT/$@" -l nvfetcher-changelog
# shellcheck disable=all
if [[ -n "$(cat changelog)" && -v "${GITHUB_ENV}" ]]; then
	echo "COMMIT_MSG<<EOF" >>"$GITHUB_ENV"
	echo "$(cat changelog)" >>"$GITHUB_ENV"
	echo "EOF" >>"$GITHUB_ENV"
	rm -rf "$PRJ_ROOT"/nvfetcher-changelog
else
	rm -rf "$PRJ_ROOT"/nvfetcher-changelog
fi