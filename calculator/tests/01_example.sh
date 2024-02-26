#!/usr/bin/env bash

CALCULATOR=$1

echo "We've set up a GitHub Actions Workflow that will run all"
echo "of the shell scripts in this directory as a series of tests."
echo
echo "To fail any test, you should use the exit 1 command;"
echo "To end a test early as a success, you should use the exit 0 command."

echo "Invoke your program with the \$CALCULATOR variable; an example is below"

if ! $CALCULATOR 1 + 1; then
  echo 'ERROR! A valid run of the calculator (1 + 1) failed!'
  exit 1
fi

if [[ $($CALCULATOR 1 + 1) -ne 2 ]]; then
  echo 'ERROR! A valid run of the calculator (1 + 1) failed to produce 2 as an output!'
  exit 1
fi

if $CALCULATOR 3 @ 2; then
  echo 'ERROR! An invalid run of the application (3 @ 2) apparently succeeded?!'
  exit 1
fi

if ! $CALCULATOR 5 - 3; then
  exit 1
fi

if [[ $($CALCULATOR 5 - 3) -ne 2 ]]; then
  exit 1
fi

if $CALCULATOR 1 / 0; then
  exit 1
fi

if ! $CALCULATOR 10 * 2; then
  exit 1
fi

if [[ $($CALCULATOR 10 * 2) -ne 20 ]]; then
  exit 1
fi

if [[ $($CALCULATOR 9 / 3) -ne 3 ]]; then
  exit 1
fi
