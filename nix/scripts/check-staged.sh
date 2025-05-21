#!/bin/sh

### Checks on staged files for Rails project ###
alias staged-files="git diff --name-only --cached --diff-filter=du"

# Check for style rule errors and autocorrect (ignore files excluded in rubocop config)
# todo: change to bin/rubocop and add script to cff
staged-files *.rb | xargs rubocop -a --force-exclusion || exit $?

# Check any updated specs #TODO: find specs related to any updated ruby classes
staged-files *_spec.rb | xargs bin/rspec || exit $?
