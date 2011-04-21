# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils

DESCRIPTION="D-BUS TQt bindings"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/dbus-tqt-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
SLOT="0"

RDEPEND="x11-libs/qt:3"

S=${WORKDIR}/dbus-tqt

src_configure() {
	mycmakeargs=(
	)

	cmake-utils_src_configure
}
