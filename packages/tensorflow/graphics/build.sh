#!/usr/bin/env bash
set -ex

# Clone the repository if it doesn't exist
git clone --branch=v${TENSORFLOW_GRAPHICS_VERSION} --depth=1 --recursive https://github.com/tensorflow/graphics /opt/tensorflow_graphics || \
git clone --depth=1 --recursive https://github.com/tensorflow/graphics /opt/tensorflow_graphics

cd /opt/tensorflow_graphics 

pip3 wheel --no-build-isolation --wheel-dir=/opt/tensorflow_graphics/wheels .
pip3 install --no-cache-dir --verbose /opt/tensorflow_graphics/wheels/tensorflow-graphics*.whl

cd /opt/tensorflow_graphics
pip3 install 'numpy<2'

# Optionally upload to a repository using Twine
twine upload --verbose /opt/tensorflow_graphics/wheels/tensorflow-graphics*.whl || echo "Failed to upload wheel to ${TWINE_REPOSITORY_URL}"
