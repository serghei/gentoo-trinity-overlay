# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit qt3

DESCRIPTION="D-BUS Qt3 bindings compatible with old application API and new dbus"
HOMEPAGE="http://freedesktop.org/wiki/Software/dbus"
SRC_URI="http://people.freedesktop.org/~krake/dbus-1-qt3/dbus-1-qt3-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0.9"
KEYWORDS="~x86"
IUSE="debug"

RDEPEND=">=sys-apps/dbus-0.91"
DEPEND="${RDEPEND}
	=x11-libs/qt-3*"

S=${WORKDIR}/dbus-1-qt3-${PV}

src_compile() {
	econf --enable-qt3 --with-qt3-moc=${QTDIR}/bin/moc \
		  $(use_enable debug qt-debug) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
