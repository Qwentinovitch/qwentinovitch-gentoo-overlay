EAPI=8

inherit git-r3

DESCRIPTION="Gnome Shell System Monitor Applet"
HOMEPAGE="https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet"
EGIT_REPO_URI="https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git"
S="${WORKDIR}/${PN}-9999"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="gnome-base/gnome-shell"
DEPEND="${RDEPEND}"

src_unpack() {
    git-r3_src_unpack
}

src_install() {
    insinto /usr/share/gnome-shell/extensions/system-monitor@paradoxxx.zero.gmail.com
    doins -r "${S}/system-monitor@paradoxxx.zero.gmail.com/"*
}

pkg_postinst() {
    gnome-extensions enable system-monitor-next@paradoxxx.zero.gmail.com || die "Failed to enable extension"
}

pkg_prerm() {
    gnome-extensions disable system-monitor-next@paradoxxx.zero.gmail.com || die "Failed to disable extension"
}
