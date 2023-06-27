#!/usr/bin/env sh -e

# Brew needs to be setup first
[[ ! -x $(which brew) ]] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo "Brew already installed"

# Set the default screenshot folder
mkdir -p $HOME/screenshots
defaults write com.app.screencapture location $HOME/screenshots

brew install \
  7zip \
  ack \
  aws-sam-cli \
  awscli \
  bitrise \
  certbot \
  circleci \
  cloc \
  fastlane \
  git-delta \
  git-gui \
  gnupg \
  gpg \
  jenv \
  jq \
  jsonlint \
  pusher/brew/pusher \
  ripgrep \
  unix2dos \
  yamllint

