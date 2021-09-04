#!/bin/sh
set -eu

# Set deploy key
ssh_path="${HOME}/.ssh"
mkdir -p "${ssh_path}"
echo "${INPUT_SSH_KEY}" >"${ssh_path}/deploy_key"
chmod 600 "${ssh_path}/deploy_key"

ls "${INPUT_SRC}"

rsync "${INPUT_OPTIONS}" -e "ssh -i ${ssh_path}/deploy_key -o StrictHostKeyChecking=no" "${GITHUB_WORKSPACE}${INPUT_SRC}" "${INPUT_DEST}"
