# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="The KDE Control Center"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdebase-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="samba logitech-mouse ieee1394"


SLOT="3.5"

RDEPEND="x11-libs/libX11
    x11-libs/libXext
    x11-libs/libXrender
    x11-libs/libXtst
    x11-libs/libXcursor
    x11-libs/libXrandr
    samba? ( net-fs/samba )
    logitech-mouse? ( =virtual/libusb-0* )
    ieee1394? ( sys-libs/libraw1394 )
    kde-base/kcminit:${SLOT}
    kde-base/kdelibs:${SLOT}"

DEPEND="${RDEPEND}"

S=${WORKDIR}/kdebase

src_configure() {
        mycmakeargs=(
                -DBUILD_KCONTROL=ON
		-DWITH_XCURSOR=ON
		-DWITH_XRANDR=ON
		-DWITH_USBIDS=/usr/share/misc/usb.ids
		$(cmake-utils_use_with samba SAMBA)
		$(cmake-utils_use_with logitech-mouse LIBUSB)
		$(cmake-utils_use_with ieee1394 LIBRAW1394)
        )

        cmake-utils_src_configure
}
