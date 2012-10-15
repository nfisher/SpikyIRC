#!/bin/sh -eu

WORKSPACE=/root/SpikyIRC
ORIGIN=git://github.com/nfisher/SpikyIRC.git
CHANGE_FILE=changes.txt

if [ ! -d "$WORKSPACE" ]; then
  echo "Checking out $ORIGIN..."
  git clone $ORIGIN $WORKSPACE
fi

cd $WORKSPACE

  git fetch > $CHANGE_FILE 2>&1 || true # absorb the return code with true

  if [ -s $CHANGE_FILE ]; then
    sh commit.sh
    cd -
    rm -rf /etc/puppet
    mv $WORKSPACE /etc/puppet
  fi

