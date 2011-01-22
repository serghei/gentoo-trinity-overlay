# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="Integrated Development Environment for Unix, supporting KDE/Qt, C/C++ and many other languages."
HOMEPAGE="http://www.kdevelop.org/"
SRC_URI="http://www.thel.ro/distfiles/${P}.tar.bz2"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="ada"

SLOT="3.5"

RDEPEND="kde-base/kdelibs:${SLOT}
    >=sys-libs/db-4.1"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		$(cmake-utils_use_with ada BUILDTOOL_ADA)
		$(cmake-utils_use_with ada LANGUAGE_ADA)
		-DWITH_BUILDTOOL_ALL=ON
		-DWITH_LANGUAGE_ALL=ON
	)

	cmake-utils_src_configure
}
