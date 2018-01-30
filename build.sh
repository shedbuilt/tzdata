#!/bin/bash
ZONEINFO="${SHED_FAKEROOT}/usr/share/zoneinfo"
mkdir -pv $ZONEINFO/{posix,right}
for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward pacificnew systemv; do
    zic -L /dev/null   -d $ZONEINFO       -y "sh yearistype.sh" ${tz} && \
    zic -L /dev/null   -d $ZONEINFO/posix -y "sh yearistype.sh" ${tz} && \
    zic -L leapseconds -d $ZONEINFO/right -y "sh yearistype.sh" ${tz} || exit 1
done
cp -v zone.tab zone1970.tab iso3166.tab "$ZONEINFO"
zic -d "$ZONEINFO" -p America/New_York || exit 1
unset ZONEINFO
