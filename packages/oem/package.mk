# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="oem"
PKG_VERSION=""
PKG_LICENSE="various"
PKG_SITE="http://alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain wget mc ImageMagick"
PKG_SECTION="virtual"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"

# torrent services
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET scan-m3u"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET acestream-rpi"
