# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libcaldav/libcaldav-0.6.2.ebuild,v 1.1 2010/11/08 22:32:34 dilfridge Exp $

EAPI=3

inherit base

DESCRIPTION="C library implementing client support for CalDAV"
HOMEPAGE="http://libcaldav.sourceforge.net/"
SRC_URI="https://quickbuild.pearsoncomputing.net/~trinity/+archive/trinity-builddeps/+files/${PN}_${PV}-0debian2.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="
	dev-libs/glib
	net-misc/curl
"
DEPEND="${RDEPEND}
	doc? ( 	app-doc/doxygen
		virtual/latex-base )"

S=${WORKDIR}/${PN}-0.6.4

src_configure() {
	./autogen.sh
	econf $(use_enable doc) || die
}
