# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE batch search&replace tool"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdewebdev-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE=""

SLOT="3.5"

RDEPEND="kde-base/kdelibs:${SLOT}"

DEPEND="${RDEPEND}"

S=${WORKDIR}/kdewebdev

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KFILEREPLACE=ON
	)

	cmake-utils_src_configure
}
