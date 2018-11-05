# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present CoreELEC (https://coreelec.org)
# Copyright (C) 2011-present AlexELEC (http://www.alexelec.in.ua)

PKG_NAME="entware"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/Entware/Entware"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="entware: A software repository that offers various software programs that can be installed on your device"
PKG_LONGDESC="entware: A software repository that offers various software programs that can be installed on your device"
PKG_TOOLCHAIN="manual"

post_install() {
  mkdir -p $INSTALL/usr/sbin
    cp -P $PKG_DIR/scripts/entware-install $INSTALL/usr/sbin

    # Replace Entware Arch
    sed -e "s/@ENTWARE_ARCH@/$ENTWARE_ARCH/g" \
         -i $INSTALL/usr/sbin/entware-install

  enable_service entware.service
}
