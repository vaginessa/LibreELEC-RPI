# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="LibreELEC-settings"
PKG_VERSION="c11801c8e617db9d413f579a46f910ddc6157752"
PKG_SHA256="560a985087a5d2809ede62b70184501d2e0c74a93a972ccd7f880fb4d85c7185"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/AlexELEC/service.libreelec.settings-rpi"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 connman pygobject dbus-python bkeymaps"
PKG_LONGDESC="LibreELEC-settings: is a settings dialog for LibreELEC"

PKG_MAKE_OPTS_TARGET="DISTRONAME=$DISTRONAME ROOT_PASSWORD=$ROOT_PASSWORD"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libreelec
    cp $PKG_DIR/scripts/* $INSTALL/usr/lib/libreelec

  ADDON_INSTALL_DIR=$INSTALL/usr/share/kodi/addons/service.libreelec.settings

  $TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/resources/lib/ -f
  rm -rf $(find $ADDON_INSTALL_DIR/resources/lib/ -name "*.py")

  $TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/oe.py -f
  rm -rf $ADDON_INSTALL_DIR/oe.py
}

post_install() {
  enable_service backup-restore.service
  enable_service factory-reset.service
}
