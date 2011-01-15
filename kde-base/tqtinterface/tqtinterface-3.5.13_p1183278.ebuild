# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils

DESCRIPTION="Interface and abstraction library for Qt and Trinity"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/${P}.tar.bz2"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="+qt3 -qt4"

SLOT="3.5"

RDEPEND="qt3? ( x11-libs/qt:3 )
    qt4? ( x11-libs/qt:4 )"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_configure() {
	mycmakeargs=(
	    $(cmake-utils_use_with qt3)
	    $(cmake-utils_use_with qt4)
	 )

	 cmake-utils_src_configure
}

