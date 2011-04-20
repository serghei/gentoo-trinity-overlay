# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE window manager"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdebase-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="xcomposite"

SLOT="3.5"

RDEPEND="x11-libs/libXext
    x11-libs/libXrender
    x11-libs/libXfixes
    x11-libs/libXext
    xcomposite? ( x11-libs/libXcomposite )"

DEPEND="${RDEPEND}"

S=${WORKDIR}/kdebase

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KWIN=ON
		$(cmake-utils_use_with xcomposite XCOMPOSITE)
		-DWITH_XRENDER=ON
		-DWITH_XFIXES=ON
		-DWITH_XDAMAGE=ON
		-DWITH_XEXT=ON
	)

	cmake-utils_src_configure
}
