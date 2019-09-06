#!/bin/sh

PWD=$(pwd)

# generic
APPNAME="OX Coi Xcode Templates Installer"
VERSION="1.0.0"

# Destination Templates
FILE_TEMPLATES_DIR="File Templates"
PROJECT_TEMPLATES_DIR="Project Templates"

TEMPLATE_PATH="${HOME}/Library/Developer/Xcode/Templates"
FILE_TEMPLATES_PATH="${TEMPLATE_PATH}/${FILE_TEMPLATES_DIR}"
PROJECT_TEMPLATES_PATH="${TEMPLATE_PATH}/${PROJECT_TEMPLATES_DIR}"

OX-COI_TEMPLATE="OX Coi"

# Installation related
TMP_SYS_DIR="/tmp"
TMP_INSTALL_PATH="${TMP_SYS_DIR}/ios-xctpl"

REPO_NAME="ox-coi-xcode-templates"
REPO_URL="https://github.com/open-xchange/${REPO_NAME}.git"


# Colors
ESC_SEQ="\x1b["
COL_RESET='\033[39m'
COL_RED='\033[31m'
COL_GREEN='\033[32m'
COL_YELLOW='\033[33m'



# If the FILE_TEMPLATES_DIR doesn't exists, it is possible that all
# templates are direct under TEMPLATE_PATH.
#
# This isn't ideal, because there might be a "Project Templates" folder, too.
# Both "File Templates" and "Project Templates" must be placed in TEMPLATE_PATH
# side by side!
#
# If this is the case we create a new FILE_TEMPLATES_DIR and move all existent
# templates into it.



# /////////////////////////////////////////////////////////////////////////////
# Generic Functions
# /////////////////////////////////////////////////////////////////////////////

function show_header() {
    _HEADER=`cat <<EOT
$COL_GREEN
>> \$1 $COL_RESET
EOT
`
    echo "$COL_GREEN $_HEADER $COL_RESET"
}

function show_version() {
    _VERSION=`cat <<EOF
\$APPNAME, v\$VERSION
EOF
`
    echo "$COL_YELLOW$_VERSION $COL_RESET"
}



# /////////////////////////////////////////////////////////////////////////////
# Installation Related Functions
# /////////////////////////////////////////////////////////////////////////////

function handle_file_templates() {
    show_header "Manage 'File Templates' Directory"

    if [ ! -d "${FILE_TEMPLATES_PATH}" ]; then
        echo "** Directory '${FILE_TEMPLATES_DIR}' doesn't exists! Creating."
        cd "${TEMPLATE_PATH}/"
        TMP_DIR=".${FILE_TEMPLATES_DIR}"
        mkdir "${TMP_DIR}" &>/dev/null
        echo "** Directory creation done."
    
        NUMBER_OF_FILES_IN_TEMPLATE_PATH=$(ls "${TEMPLATE_PATH}" | wc -l)
        if [ $NUMBER_OF_FILES_IN_TEMPLATE_PATH -gt 0 ]; then
            echo "** Moving existent templates into: '${FILE_TEMPLATES_DIR}'"
            for DIR in *; do
                mv "${DIR}" "${TMP_DIR}" &>/dev/null
            done
            echo "** Moving done."
        fi
    
        mv "${TMP_DIR}" "${FILE_TEMPLATES_DIR}" &>/dev/null
    fi
    
    echo "** Managing 'File Templates' directory done."
}

function handle_project_templates() {
    show_header "Manage 'Project Templates' Directory"

    if [ ! -d "${PROJECT_TEMPLATES_PATH}" ]; then
        echo "** Directory '${PROJECT_TEMPLATES_DIR}' doesn't exists! Creating."
        mkdir "${PROJECT_TEMPLATES_PATH}" &>/dev/null
        echo "** Directory creation done."
    fi
    
    echo "** Managing 'Project Templates' directory done."
}

function install_xcode_templates() {
    show_header "Install OX Coi Templates"
    
    mkdir "${TMP_INSTALL_PATH}"
    cd "${TMP_INSTALL_PATH}"
    
    git clone ${REPO_URL}
    cd ${REPO_NAME}

    cp -r "File\ Templates/*" "${FILE_TEMPLATES_PATH}" &>/dev/null

    echo "** File Templates installation done."
}



# /////////////////////////////////////////////////////////////////////////////
# Start Installation
# /////////////////////////////////////////////////////////////////////////////

show_version;
handle_file_templates;
handle_project_templates;
install_xcode_templates;



# /////////////////////////////////////////////////////////////////////////////
# We're done!
# /////////////////////////////////////////////////////////////////////////////

show_header "🎉🚀🤘🏻 Hooray... Xcode templates installation successfully finished! 👏"
echo
cd "$PWD"

exit 0