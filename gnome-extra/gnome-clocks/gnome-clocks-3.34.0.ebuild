# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome.org gnome2-utils meson vala xdg

DESCRIPTION="Clocks application for GNOME"
HOMEPAGE="https://wiki.gnome.org/Apps/Clocks"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	>=dev-libs/glib-2.44:2
	>=dev-libs/libgweather-3.27.2:2=
	>=gnome-base/gnome-desktop-3.8:3=
	>=media-libs/gsound-0.98
	>=sci-geosciences/geocode-glib-1
	>=app-misc/geoclue-2.4:2.0
	>=x11-libs/gtk+-3.20:3
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/libxml2:2
	dev-util/itstool
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
	$(vala_depend)
	dev-libs/libgweather:2[vala]
	media-libs/gsound[vala]
"

src_prepare() {
	xdg_src_prepare
	vala_src_prepare
}

src_configure() {
	meson_src_configure -Dprofile=default
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
