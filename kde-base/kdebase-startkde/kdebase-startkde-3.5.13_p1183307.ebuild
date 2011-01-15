# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="startkde script, which starts a complete KDE session, and associated scripts"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdebase-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"

SLOT="3.5"

RDEPEND="x11-apps/xmessage
        x11-apps/xsetroot
        x11-apps/xset
        x11-apps/xrandr
        x11-apps/mkfontdir
        x11-apps/xprop
        >=kde-base/kdesktop-${PV}:${SLOT}
        >=kde-base/kcminit-${PV}:${SLOT}
        >=kde-base/ksmserver-${PV}:${SLOT}
        >=kde-base/kwin-${PV}:${SLOT}
        >=kde-base/kpersonalizer-${PV}:${SLOT}
        >=kde-base/kreadconfig-${PV}:${SLOT}
        >=kde-base/ksplashml-${PV}:${SLOT}"

S=${WORKDIR}/kdebase

src_configure() {
	mycmakeargs=(
		-DBUILD_STARTKDE=ON
	)

	cmake-utils_src_configure
}
