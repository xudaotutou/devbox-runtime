#!/bin/bash

app_env=${1:-development}

# Define build target
build_target="hello_world"

# Development environment commands
dev_commands() {
    echo "Running development environment commands..."
    cargo run
}

# Production environment commands
prod_commands() {
    echo "Running production environment commands..."
    cargo build --release --bin $build_target
    ./target/release/$build_target
}

# Check environment variables to determine the running environment
if [ "$app_env" = "production" ] || [ "$app_env" = "prod" ] ; then
    echo "Production environment detected"
    prod_commands
else
    echo "Development environment detected"
    dev_commands
fi
