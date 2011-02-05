# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="Integrated Development Environment for Unix, supporting KDE/Qt, C/C++ and many other languages."
HOMEPAGE="http://www.kdevelop.org/"
SRC_URI="http://www.thel.ro/distfiles/${P}.tar.bz2"
LICENSE="GPL-2"
KEYWORDS="~x86"

languages="ada bash +cpp csharp fortran java pascal perl php python ruby sql"
vcs="cvs clearcase perforce subversion"
components="designer"
IUSE="$languages $vcs $components"

SLOT="3.5"

RDEPEND="kde-base/kdelibs:${SLOT}
    >=sys-libs/db-4.1
    cvs? ( kde-base/cervisia:3.5 )
    subversion? ( dev-vcs/subversion )"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib

		# build tools
		$(cmake-utils_use_with ada BUILDTOOL_ADA)
		$(cmake-utils_use_with java BUILDTOOL_ANT)
		$(cmake-utils_use_with pascal BUILDTOOL_PASCAL)
		-DWITH_BUILDTOOL_ALL=ON

		# programming languages
		$(cmake-utils_use_with ada LANGUAGE_ADA )
		$(cmake-utils_use_with bash LANGUAGE_BASH )
		$(cmake-utils_use_with cpp LANGUAGE_CPP )
		$(cmake-utils_use_with fortran LANGUAGE_FORTRAN )
		$(cmake-utils_use_with java LANGUAGE_JAVA )
		$(cmake-utils_use_with csharp LANGUAGE_CSHARP )
		$(cmake-utils_use_with pascal LANGUAGE_PASCAL )
		$(cmake-utils_use_with perl LANGUAGE_PERL )
		$(cmake-utils_use_with php LANGUAGE_PHP )
		$(cmake-utils_use_with python LANGUAGE_PYTHON )
		$(cmake-utils_use_with ruby LANGUAGE_RUBY )
		$(cmake-utils_use_with sql LANGUAGE_SQL )

		# version control systems
		$(cmake-utils_use_with cvs VCS_CVSSERVICE)
		$(cmake-utils_use_with clearcase VCS_CLEARCASE)
		$(cmake-utils_use_with perforce VCS_PERFORCE)
		$(cmake-utils_use_with subversion VCS_SUBVERSION)
		$(cmake-utils_use designer BUILD_BUILD_KDEVDESIGNER)
	)

	cmake-utils_src_configure
}
