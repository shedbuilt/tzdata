#!/bin/bash
SHED_PKG_LOCAL_ZONEINFO="${SHED_FAKE_ROOT}/usr/share/zoneinfo"
mkdir -pv "$SHED_PKG_LOCAL_ZONEINFO"/{posix,right}
for SHED_PKG_LOCAL_TZ in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward pacificnew systemv; do
    zic -L /dev/null   -d "$SHED_PKG_LOCAL_ZONEINFO"       -y "sh yearistype.sh" ${SHED_PKG_LOCAL_TZ} &&
    zic -L /dev/null   -d "$SHED_PKG_LOCAL_ZONEINFO"/posix -y "sh yearistype.sh" ${SHED_PKG_LOCAL_TZ} &&
    zic -L leapseconds -d "$SHED_PKG_LOCAL_ZONEINFO"/right -y "sh yearistype.sh" ${SHED_PKG_LOCAL_TZ} || exit 1
done
cp -v zone.tab zone1970.tab iso3166.tab "$SHED_PKG_LOCAL_ZONEINFO" &&
zic -d "$SHED_PKG_LOCAL_ZONEINFO" -p America/New_York || exit 1
