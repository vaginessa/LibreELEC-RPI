# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="wget"
PKG_VERSION="1.19"
PKG_SHA256="0f1157bbf4daae19f3e1ddb70c6ccb2067feb834a6aa23c9d9daa7f048606384"
PKG_LICENSE="GPL"
PKG_SITE="http://www.wget-editor.org/"
PKG_URL="http://ftp.gnu.org/gnu/wget/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain openssl pcre"
PKG_LONGDESC="wget: A non-interactive network retriever"

PKG_CONFIGURE_OPTS_TARGET="--disable-nls \
                           --disable-rpath \
                           --with-gnu-ld \
                           --with-ssl=openssl \
                           --with-openssl=yes"

post_makeinstall_target() {
  rm -rf $INSTALL/etc
}
