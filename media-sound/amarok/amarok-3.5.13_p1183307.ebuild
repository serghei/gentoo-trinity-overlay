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
IUSE="+xine yauap ipod ifp njb mtp riokarma daap konqsidebar translations visualization doc"

SLOT="3.5"

RDEPEND="kde-base/kdelibs:${SLOT}
    >=media-libs/taglib-1.5
    media-libs/xine-lib
    yauap? ( media-sound/yauap )
    dev-db/sqlite
    visualization? ( media-libs/libsdl =media-plugins/libvisual-plugins-0.4* )
    ipod? ( media-libs/libgpod )
    ifp? ( media-libs/libifp )
    njb? ( media-libs/libnjb )
    mtp? ( media-libs/libmtp )
    riokarma? ( media-libs/libkarma )"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DWITH_XINE=ON
		$(cmake-utils_use_with yauap YAUAP)
		$(cmake-utils_use_with konqsidebar KONQSIDEBAR)
		$(cmake-utils_use_with visualization LIBVISUAL)
		$(cmake-utils_use_with ipod IPOD)
		$(cmake-utils_use_with ifp IFP)
		$(cmake-utils_use_with njb NJB)
		$(cmake-utils_use_with mtp MTP)
		$(cmake-utils_use_with riokarma RIOKARMA)
		$(cmake-utils_use_with daap DAAP)
		$(cmake-utils_use translations BUILD_TRANSLATIONS)
		$(cmake-utils_use doc BUILD_DOC)
	)

	cmake-utils_src_configure
}
