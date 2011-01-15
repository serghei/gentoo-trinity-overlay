# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="Advanced audio player based on KDE framework."
HOMEPAGE="http://amarok.kde.org/"
SRC_URI="http://www.thel.ro/distfiles/${P}.tar.bz2"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="+xine konqsidebar visualization"

SLOT="3.5"

RDEPEND="kde-base/kdelibs:${SLOT}
    >=media-libs/taglib-1.5
    media-libs/xine-lib
    dev-db/sqlite
    visualization? ( media-libs/libsdl =media-plugins/libvisual-plugins-0.4* )"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DWITH_XINE=ON
		$(cmake-utils_use_with konqsidebar KONQSIDEBAR)
		$(cmake-utils_use_with visualization LIBVISUAL)
	)

	cmake-utils_src_configure
}