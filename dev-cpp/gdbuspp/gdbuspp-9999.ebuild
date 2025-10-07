EAPI=8

inherit meson

DESCRIPTION="C++ wrapper for GLib D-Bus (used by OpenVPN)"
HOMEPAGE="https://codeberg.org/OpenVPN/gdbuspp"
SRC_URI="https://codeberg.org/OpenVPN/gdbuspp/archive/master.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RESTRICT="!test? ( test )"

DEPEND="
    >=dev-libs/glib-2.56
    >=dev-build/meson-0.56
    >=dev-util/ninja-1.8
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

S="${WORKDIR}/${PN}"