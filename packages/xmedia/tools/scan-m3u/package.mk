# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="scan-m3u"
PKG_VERSION="latest"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain jq"
PKG_LONGDESC="scan-m3u: scan IPTV channels for TTV."
PKG_TOOLCHAIN="manual"

pre_make_target(){
  cp $ROOT/private/$PKG_NAME/ttv-logo.src $PKG_BUILD 2>/dev/null || true
}

make_target() {
  CC=$CC CFLAGS=$CFLAGS ./shc -v -r -B -f ttvget-live.src
  CC=$CC CFLAGS=$CFLAGS ./shc -v -r -B -f ttvget-direct.src
  CC=$CC CFLAGS=$CFLAGS ./shc -v -r -B -f ttvstream.src
  [ -f ttv-logo.src ] && CC=$CC CFLAGS=$CFLAGS ./shc -v -r -B -f ttv-logo.src || true
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp ttvget-live.src.x $INSTALL/usr/bin/ttvget-live
    cp ttvget-direct.src.x $INSTALL/usr/bin/ttvget-direct
    cp ttvstream.src.x $INSTALL/usr/bin/ttvstream
    cp ttv-logo.src.x $INSTALL/usr/bin/ttv-logo 2>/dev/null || true
  mkdir -p $INSTALL/usr/config/acestream
    cp $PKG_DIR/config/* $INSTALL/usr/config/acestream
}
