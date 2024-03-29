#!/usr/bin/env bash

set -e

echo "Ensuring that pom <version> matches $TRAVIS_TAG"
mvn org.codehaus.mojo:versions-maven-plugin:2.5:set -DnewVersion=$TRAVIS_TAG

echo "Uploading to oss repo and GitHub"
mvn deploy --settings .travis/settings.xml --batch-mode --update-snapshots -Prelease

