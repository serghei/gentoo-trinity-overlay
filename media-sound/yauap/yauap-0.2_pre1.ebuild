# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

DESCRIPTION="Simple commandline audio player that is using the GStreamer multimedia framework."
HOMEPAGE="http://www.nongnu.org/yauap/"
SRC_URI="http://savannah.nongnu.org/download/${PN}/${P/_}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=media-libs/gst-plugins-base-0.10
	>=sys-apps/dbus-1.0
	>=dev-libs/glib-2.0"

RDEPEND="${DEPEND}
	>=media-libs/gst-plugins-good-0.10"

S=${WORKDIR}/"${P/_}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}"/${P}-as-needed.patch
}

src_compile() {
	emake CC="$(tc-getCC)" || die "emake failed"
}

src_install() {
	dobin yauap || die "Cannot install yauap"
	dodoc ChangeLog README
}
