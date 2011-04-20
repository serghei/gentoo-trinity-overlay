# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE PIM groupware plugin collection"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdepim-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="egroupware exchange kolab slox groupwise featureplan groupdav birthdays newexchange scalix caldav carddav"

SLOT="3.5"

RDEPEND="kde-base/libkdepim:${SLOT}
  exchange? ( kde-base/libkpimexchange:${SLOT} )
  featureplan? ( kde-base/kode )
  caldav? ( >=dev-libs/libcaldav-0.6.5 )
  carddav? ( dev-libs/libcarddav )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/kdepim

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KRESOURCES=ON
		$(cmake-utils_use_with egroupware EGROUPWARE)
		$(cmake-utils_use_with exchange EXCHANGE)
		$(cmake-utils_use_with kolab KOLAB)
		$(cmake-utils_use_with slox SLOX)
		$(cmake-utils_use_with groupwise GROUPWISE)
		$(cmake-utils_use_with featureplan FEATUREPLAN)
		$(cmake-utils_use_with groupdav GROUPDAV)
		$(cmake-utils_use_with birthdays BIRTHDAYS)
		$(cmake-utils_use_with newexchange NEWEXCHANGE)
		$(cmake-utils_use_with scalix SCALIX)
		$(cmake-utils_use_with caldav CALDAV)
		$(cmake-utils_use_with carddav CARDDAV)
	)

	cmake-utils_src_configure
}
