#!/bin/sh

# If a command fails then the deploy stops
set -e

# remove public folder before deployment
rm -rf public

# Build the project.
hugo -t roxo 

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
