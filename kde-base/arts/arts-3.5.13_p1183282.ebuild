# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="aRts, the KDE sound (and all-around multimedia) server/output manager"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/${P}.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="alsa esd artswrappersuid jack mp3 nas vorbis"

SLOT="3.5"

RDEPEND="kde-base/tqtinterface
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

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DAUDIOFILE=ON
		$(cmake-utils_use_with mp3 MAD)
		$(cmake-utils_use_with nas NAS)
		$(cmake-utils_use_with alsa ALSA)
		$(cmake-utils_use_with vorbis VORBIS)
		$(cmake-utils_use_with esd ESD)
		$(cmake-utils_use_with jack JACK)
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	# used for realtime priority, but off by default as it is a security hazard
	use artswrappersuid && chmod u+s "${D}/${PREFIX}/bin/artswrapper"
}

pkg_postinst() {
	if ! use artswrappersuid ; then
		elog "Run chmod u+s ${PREFIX}/bin/artswrapper to let artsd use realtime priority"
		elog "and so avoid possible skips in sound. However, on untrusted systems this"
		elog "creates the possibility of a DoS attack that'll use 100% cpu at realtime"
		elog "priority, and so is off by default. See bug #7883."
		elog "Or, you can set the local artswrappersuid USE flag to make the ebuild do this."
	fi
}
