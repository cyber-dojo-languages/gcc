#!/usr/bin/env bash
set -Eeu

# gcc and make come with the base image. gcovr is what a kata's coverage
# report is made with. apt's package lists are left in place: the images
# built on this one install their test frameworks with apt-get install.
apt-get update
apt-get install --yes gcovr

# Records the C this image holds, in the shape every image shares. The
# installed compiler is asked, so the version is one the image can run rather
# than one written down when someone last edited this file. -dumpfullversion
# prints the version alone, where --version prints a sentence around it.
readonly LANGUAGE_VERSION=$(gcc -dumpfullversion)

if [ -z "${LANGUAGE_VERSION}" ]; then
  echo 'Could not read a version from gcc -dumpfullversion' >&2
  exit 1
fi

cat > /versions.json <<EOF
{
  "language": {
    "name": "C (gcc)",
    "version": "${LANGUAGE_VERSION}"
  },
  "test_frameworks": []
}
EOF
