#!/usr/bin/env bash


# This setup step is necessary in ensuring pre-push scripts are configured to analyze
# the project. This helps eliminate most issues with code linting and problems before 
# pushing the codebase. 

flutter pub get

# set up git hooks
FILE=.git/hooks/pre-push
if test -f "$FILE"; then
    rm $FILE
fi

ln -s ../../.git-hooks/pre-push.sh .git/hooks/pre-push
chmod +x .git-hooks/pre-push.sh