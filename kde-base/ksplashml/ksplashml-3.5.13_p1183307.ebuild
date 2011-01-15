# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE splashscreen framework (the splashscreen of KDE itself, not of individual apps)"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdebase-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="xinerama"

SLOT="3.5"

DEPEND="x11-libs/libXcursor
        xinerama? ( x11-proto/xineramaproto )"
RDEPEND="x11-libs/libXcursor
        xinerama? ( x11-libs/libXinerama )"

S=${WORKDIR}/kdebase

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KSPLASHML=ON
		$(cmake-utils_use_with xinerama XINERAMA)
	)

	cmake-utils_src_configure
}
