# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Trinity Qt Interface"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/kde-sunset/${P}.tar.bz2"
LICENSE="GPL-2"
KEYWORDS="~x86"
#IUSE="qt4"

SLOT="3.5"

#RDEPEND="qt4? ( x11-libs/qt-gui )"
DEPEND="${RDEPEND}
    dev-util/cmake"

src_compile() {
	cd ${PN}
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DINCLUDE_INSTALL_DIR=include/tqt
	emake
}

src_install() {
	cd ${PN}
        make install DESTDIR="${D}" || die "make install failed"
}
