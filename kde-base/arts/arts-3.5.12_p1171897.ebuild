# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils cmake-utils

DESCRIPTION="aRts, the KDE sound (and all-around multimedia) server/output manager"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/kde-sunset/${P}.tar.bz2 http://www.thel.ro/kde-sunset/arts-cmake.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"

SLOT="3.5"

RDEPEND="x11-libs/qt:3
    kde-base/tqtinterface
    >=dev-libs/glib-2
    media-libs/audiofile
    mp3? ( media-libs/libmad )
    nas? ( media-libs/nas )
    alsa? ( media-libs/alsa-lib )
    vorbis? ( media-libs/libogg media-libs/libvorbis )
    esd? ( media-sound/esound )
    jack? ( >=media-sound/jack-audio-connection-kit-0.90 )"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${PN}"
	epatch "${FILESDIR}/arts-1.5.9-glibc2.8-build-fix.patch"
}

src_configure() {
#	S="${PN}"

	mycmakeargs=(
		-DCMAKE_IN_SOURCE_BUILD=1
		-DWITH_AUDIOFILE=on
		$(cmake-utils_use_with mp3)
		$(cmake-utils_use_with nas)
		$(cmake-utils_use_with alsa)
		$(cmake-utils_use_with vorbis)
		$(cmake-utils_use_with esd)
		$(cmake-utils_use_with jack)
	)

	cmake-utils_src_configure
}

#src_compile() {
#	cd "${PN}"
#	#cmake -DCMAKE_INSTALL_PREFIX=/usr/kde/3.5 || die "configure failed"
#	emake || die "make failed"
#}

src_install() {
	cd "${PN}"
        make install DESTDIR="${D}" || die "make install failed"
}
