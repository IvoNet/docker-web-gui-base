#!/usr/bin/env bash

$agi $(cat "${GUACD_DIR}"/DEPENDENCIES)

chmod +x ${GUACD_DIR}/bin/*.sh
${GUACD_DIR}/bin/link-freerdp-plugins.sh ${GUACD_DIR}/lib/freerdp/guac*.so
