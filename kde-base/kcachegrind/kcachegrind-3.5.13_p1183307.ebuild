# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE Frontend for Cachegrind"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdesdk-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE=""

SLOT="3.5"

RDEPEND="
	kde-base/kdelibs
	media-gfx/graphviz"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/kdesdk

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KCACHEGRIND=ON
	)

	cmake-utils_src_configure
}

pkg_postinst() {
	echo
	elog "To make full use of ${PN} you should emerge >=dev-util/valgrind-3.2.0 and/or"
	elog "dev-util/oprofile."
	echo
}
