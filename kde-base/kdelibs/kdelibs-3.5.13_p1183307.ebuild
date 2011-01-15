# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE libraries needed by all KDE programs."
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/${P}.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="alsa arts cups jpeg2k openexr spell tiff lua"

SLOT="3.5"

RDEPEND="kde-base/tqtinterface
    >=dev-libs/openssl-0.9.7d
    media-libs/fontconfig
    >=media-libs/freetype-2
    media-libs/libart_lgpl
    net-dns/libidn
    net-dns/avahi[qt3]
    alsa? ( media-libs/alsa-lib )
    arts? ( >=kde-base/arts-3.5.13 )
    cups? ( >=net-print/cups-1.1.19 )
    jpeg2k? ( media-libs/jasper )
    openexr? ( >=media-libs/openexr-1.2.2-r2 )
    spell? ( >=app-dicts/aspell-en-6.0.0 >=app-text/aspell-0.60.5 )
    tiff? ( media-libs/tiff )
    lua? ( dev-lang/lua )"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DWITH_LIBIDN=ON
		-DWITH_SSL=ON
		-DWITH_LIBART=ON
		$(cmake-utils_use_with alsa ALSA)
		$(cmake-utils_use_with arts ARTS)
		$(cmake-utils_use_with cups CUPS)
		$(cmake-utils_use_with jpeg2k JASPER)
		$(cmake-utils_use_with openexr OPENEXR)
		$(cmake-utils_use_with spell ASPELL)
		$(cmake-utils_use_with tiff TIFF)
		$(cmake-utils_use_with lua LUA)
	)

	cmake-utils_src_configure
}
