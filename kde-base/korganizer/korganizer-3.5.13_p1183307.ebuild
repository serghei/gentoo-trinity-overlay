# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="A Personal Organizer for KDE"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdepim-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="exchange"

SLOT="3.5"

RDEPEND="kde-base/certmanager:${SLOT}
    kde-base/libkholidays:${SLOT}
    exchange? ( kde-base/libkpimexchange:${SLOT} )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/kdepim

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KORGANIZER=ON
		-DBUILD_KGANTT=ON
		$(cmake-utils_use_with exchange EXCHANGE)
	)

	cmake-utils_src_configure
}
