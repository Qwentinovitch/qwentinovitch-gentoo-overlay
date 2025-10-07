EAPI=8

PYTHON_COMPAT=( python3_11 )

inherit git-r3 meson

DESCRIPTION="OpenVPN 3 Linux client - command-line, D-Bus, and systemd integration"
HOMEPAGE="https://github.com/OpenVPN/openvpn3-linux"
EGIT_REPO_URI="https://github.com/OpenVPN/openvpn3-linux.git"
S="${WORKDIR}/${PN}-9999"

PATCHES=(
    "${FILESDIR}/use-system-libfmt.patch"
)

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# Runtime and build-time dependencies
DEPEND="
    ${PYTHON_DEPS}
    dev-lang/python:3.11
    dev-python/setuptools
    >=dev-libs/glib-2.56
    >=dev-build/meson-0.56
    >=dev-util/ninja-1.8
    dev-cpp/jsoncpp
    dev-cpp/gdbuspp
    sys-apps/systemd
    virtual/pkgconfig
    dev-libs/libfmt
"

RDEPEND="${DEPEND}"

BDEPEND="
    dev-libs/libfmt
    virtual/pkgconfig
"
src_configure() {
    meson_src_configure --wrap-mode nopromote -Dunit_tests=disabled -Dtest_programs=disabled
}
