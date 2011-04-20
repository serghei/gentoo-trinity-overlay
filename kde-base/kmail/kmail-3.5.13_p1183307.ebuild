# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KMail is the email component of Kontact, the integrated personal information manager of KDE."
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdepim-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="debug"

SLOT="3.5"

RDEPEND="kde-base/kdelibs:${SLOT}
    kde-base/libkmime:${SLOT}
    kde-base/libkpgp:${SLOT}
    kde-base/libkdepim:${SLOT}
    kde-base/libkpimidentities:${SLOT}
    kde-base/mimelib:${SLOT}
    kde-base/libksieve:${SLOT}
    kde-base/kdepim-kioslaves:${SLOT}"
DEPEND="${RDEPEND}"

S=${WORKDIR}/kdepim

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KMAIL=ON
		-DBUILD_PLUGINS=ON
	)

	cmake-utils_src_configure
}
