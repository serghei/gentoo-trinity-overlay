# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils

DESCRIPTION="Interface and abstraction library for Qt and Trinity"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/kde-sunset/${P}.tar.bz2 http://www.thel.ro/kde-sunset/${PN}-cmake.tar.bz2"
LICENSE="GPL-2"
KEYWORDS="~x86"

SLOT="3.5"

DEPEND="${RDEPEND}
    dev-util/cmake"

S=${WORKDIR}/${PN}
