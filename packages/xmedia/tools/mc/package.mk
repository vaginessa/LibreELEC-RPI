# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="mc"
PKG_VERSION="4.8.21"
PKG_SHA256="8f37e546ac7c31c9c203a03b1c1d6cb2d2f623a300b86badfd367e5559fe148c"
PKG_LICENSE="GPL"
PKG_SITE="http://www.midnight-commander.org/"
PKG_URL="http://ftp.midnight-commander.org/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libtool:host gettext:host glib pcre slang"
PKG_LONGDESC="Midnight Commander is a visual file manager"

pre_configure_target() {
 CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/slang"
}

PKG_CONFIGURE_OPTS_TARGET=" \
  --prefix=/usr \
  --sysconfdir=/etc \
  --with-screen=slang \
  --with-sysroot=$SYSROOT_PREFIX \
  --with-gnu-ld \
  --with-subshell \
  --with-edit \
  --without-gpm-mouse \
  --enable-charset \
  --enable-background \
  --enable-vfs-extfs \
  --enable-vfs-ftp \
  --enable-vfs-tar \
  --without-x"

post_makeinstall_target() {
  rm -rf $INSTALL/etc/mc
  mkdir -p  $INSTALL/usr/config/mc
    cp -a $PKG_DIR/etc/* $INSTALL/usr/config/mc
    ln -sf /storage/.config/mc $INSTALL/etc/mc
}
