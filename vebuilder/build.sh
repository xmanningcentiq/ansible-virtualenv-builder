#!/usr/bin/env bash

__TMP=$(mktemp -d /tmp/ve.XXXXXX)
__VE="${__TMP}/ve-ansible"
__CWD=$(pwd)

test -f "/etc/os-release" && source /etc/os-release
test -f "ansible-ve-${__OS_RELEASE}.tar.gz" && rm "ansible-ve-${__OS_RELEASE}.tar.gz"

test -d "${__VE}" && rm -r "${__VE}"
chmod 0755 "${__TMP}"

virtualenv --system-site-packages "${__VE}"

source "${__VE}/bin/activate"

pip install -r requirements.txt

deactivate

cd "$(dirname "${__TMP}")" || exit 1

tar -czf "ansible-ve-${__OS_RELEASE}.tar.gz" "$(basename "${__TMP}")"

cd "${__CWD}" || exit 1

echo ""
echo "+------------------------------------------------------------------------------+"
echo "|                            VE-BUILDER NOTICE                                 |"
echo "+------------------------------------------------------------------------------+"
echo "| Virtualenv has been created, however it will only run when extracted to the  |"
echo "| correct directory. Ensure you copy the tar.gz file to: /tmp                  |"
echo "|                                                                              |"
echo "| Please extract this archive to: ${__TMP}                               |"
echo "+------------------------------------------------------------------------------+"

echo ""
echo "Exported file: out/ansible-ve-${__OS_RELEASE}.tar.gz"
echo ""
