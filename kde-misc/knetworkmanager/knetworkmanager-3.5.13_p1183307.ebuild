# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="A KDE frontend for NetworkManager"
HOMEPAGE="http://en.opensuse.org/Projects/KNetworkManager"
SRC_URI="http://www.thel.ro/distfiles/${P}.tar.bz2"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="openvpn"

SLOT="3.5"

RDEPEND="kde-base/kdelibs:${SLOT}
    dev-libs/dbus-1-tqt"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		$(cmake-utils_use_with openvpn OPENVPN)
	)

	cmake-utils_src_configure
}
