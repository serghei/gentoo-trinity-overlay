# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-pda/libopensync-plugin-kdepim/libopensync-plugin-kdepim-0.21.ebuild,v 1.2 2007/02/14 20:24:38 peper Exp $

EAPI=1

inherit qt3

DESCRIPTION="OpenSync Kdepim Plugin"
HOMEPAGE="http://www.opensync.org/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND="=app-pda/libopensync-${PV}*
	kde-base/libkcal:3.5"

RDEPEND="${DEPEND}"

# interactive and broken
RESTRICT="test"

src_compile() {
	econf --without-arts
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README
}
