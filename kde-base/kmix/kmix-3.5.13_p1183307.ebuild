# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="aRts mixer gui"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdemultimedia-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="alsa"

SLOT="3.5"

RDEPEND="kde-base/kdelibs:${SLOT}
    alsa? ( media-libs/alsa-lib )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/kdemultimedia

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KMIX=ON
	)

	cmake-utils_src_configure
}
