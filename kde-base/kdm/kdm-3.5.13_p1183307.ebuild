# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE login manager, similar to xdm and gdm"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdebase-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="pam"

SLOT="3.5"

RDEPEND="kde-base/kdelibs:${SLOT}
	pam? ( kde-base/kdebase-pam )
	x11-apps/xinit
	x11-apps/xmessage
	x11-libs/libXdmcp
	sys-apps/dbus"
DEPEND="${RDEPEND}"

S=${WORKDIR}/kdebase

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KDM=ON
		-DWITH_SHADOW=ON
		-DWITH_XDMCP=ON
		$(cmake-utils_use_with pam PAM )
	)

	cmake-utils_src_configure
}
