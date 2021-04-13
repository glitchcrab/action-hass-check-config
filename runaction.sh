#!/bin/bash

declare statuscode
statuscode=0

VENVDIR="/hass-venv/bin"

echo "::info:: Installing Home Assistant"

if [ ! -d "${VENVDIR}" ]; then
  echo "Python virtualenv doesn't exist at ${VENVDIR}; exiting"
  exit 1
fi

source ${VENVDIR}/activate

if [ ! -z "${INPUT_VERSION}" ]; then
  ${VENVDIR}/python -m pip install --disable-pip-version-check git+git://github.com/home-assistant/home-assistant.git@${INPUT_VERSION} || statuscode=1
else
  ${VENVDIR}/python -m pip install --disable-pip-version-check homeassistant || statuscode=1
fi

if [ -d "${INPUT_CONFIG_PATH}/custom_components/" ]; then
  echo "::info:: Install requirements for custom integrations"
  shopt -s globstar nullglob
  for manifest in "$INPUT_CONFIG_PATH"/custom_components/**/manifest.json; do
    echo "::info:: Checking manifest file $manifest"

      for requirement in $(jq -r '.[]' <<< "$(jq '.requirements' "$manifest")"); do
        echo "::info:: Installing requirement '$requirement'"
        ${VENVDIR}/python -m pip install --disable-pip-version-check "$requirement" || statuscode=1
      done
    done
fi

echo "::info:: Running config check"
${VENVDIR}/hass --script check_config --config "${GITHUB_WORKSPACE}"/"${INPUT_CONFIG_PATH}" || statuscode=1

echo "::info:: Config check is complete"
exit "$statuscode"
