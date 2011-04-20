# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-pda/libopensync-plugin-kdepim/libopensync-plugin-kdepim-9999.ebuild,v 1.1 2007/11/26 20:19:47 peper Exp $

EAPI=1

inherit cmake-utils subversion kde-functions

DESCRIPTION="OpenSync Kdepim Plugin"
HOMEPAGE="http://www.opensync.org/"
SRC_URI=""

ESVN_REPO_URI="http://svn.opensync.org/plugins/kdepim"

KEYWORDS=""
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND="=app-pda/libopensync-${PV}*
	kde-base/libkcal:3.5"
RDEPEND="${DEPEND}"

pkg_setup() {
	set-kdedir "3.5"
}
