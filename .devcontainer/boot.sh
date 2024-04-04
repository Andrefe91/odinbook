#!/bin/bash

echo "Updating RubyGems..."
gem update --system -N

echo "Installing dependencies..."
bundle install
yarn install
bin/setup

echo "Copying database.yml..."
cp -n config/database.yml config/database.yml

echo "Creating database..."
bin/rails db:prepare

echo "Done!"
