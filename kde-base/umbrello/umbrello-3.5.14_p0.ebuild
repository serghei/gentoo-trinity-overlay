# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE: Umbrello UML Modeller"
HOMEPAGE="http://www.trinitydesktop.org/"
SRC_URI="http://www.thel.ro/distfiles/kdesdk-3.5.14_p0.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE=""

SLOT="3.5"

RDEPEND="
	kde-base/kdelibs"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/kdesdk

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_UMBRELLO=ON
	)

	cmake-utils_src_configure
}
