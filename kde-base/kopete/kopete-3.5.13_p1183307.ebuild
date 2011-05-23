# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE multi-protocol IM client"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdenetwork-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"

SLOT="3.5"

IUSE=""
PLUGINS="history"
PROTOCOLS="yahoo jabber jingle gadu meanwhile"
IUSE="${IUSE} ${PLUGINS} ${PROTOCOLS}"


RDEPEND="kde-base/kdelibs:${SLOT}
    jingle? ( >=media-libs/speex-1.1.6 )
    gadu? ( net-libs/libgadu )
    meanwhile? ( net-libs/meanwhile )"

DEPEND="${RDEPEND}"

S=${WORKDIR}/kdenetwork

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KOPETE=ON
		$(cmake-utils_use_with jingle JINGLE)
		$(cmake-utils_use yahoo BUILD_KOPETE_PROTOCOL_YAHOO)
		$(cmake-utils_use jabber BUILD_KOPETE_PROTOCOL_JABBER)
		$(cmake-utils_use gadu BUILD_KOPETE_PROTOCOL_GADU)
		$(cmake-utils_use meanwhile BUILD_KOPETE_PROTOCOL_MEANWHILE)
		$(cmake-utils_use history BUILD_KOPETE_PLUGIN_HISTORY)
	)

	cmake-utils_src_configure
}
