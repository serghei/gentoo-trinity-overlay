# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDesktop is the KDE interface that handles the icons, desktop popup menus and screensaver system."
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdebase-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="pam xscreensaver"

SLOT="3.5"

DEPEND="x11-libs/libXext
    x11-libs/libXrender
    x11-libs/libXfixes
    xscreensaver? ( x11-proto/scrnsaverproto )
    kde-base/libkonq:${SLOT}"

RDEPEND="${RDEPEND}
    xscreensaver? ( x11-libs/libXScrnSaver )"

S=${WORKDIR}/kdebase

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KDESKTOP=ON
		$(cmake-utils_use_with pam PAM)
		$(cmake-utils_use_with xscreensaver XSCREENSAVER)
	)

	cmake-utils_src_configure
}
