EAPI=8

inherit git-r3

DESCRIPTION="OpenVPN 3 Indicator for GNOME Shell"
HOMEPAGE="https://github.com/OpenVPN/openvpn3-indicator"
EGIT_REPO_URI="https://github.com/OpenVPN/openvpn3-indicator.git"
S="${WORKDIR}/${PN}-9999"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Dépendances nécessaires
RDEPEND="
    dev-python/secretstorage
    dev-python/setproctitle
    app-arch/zip
    gnome-extra/gnome-shell-extension-appindicator
    gnome-base/gnome-shell
    net-vpn/openvpn3-linux
"
DEPEND="
    ${RDEPEND}
"
src_compile() {
    :
}

src_install() {
    emake DESTDIR="${D}" install || die "Installation failed"
}

pkg_postinst() {
    gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com || die "Failed to enable AppIndicator extension"
    elog "OpenVPN 3 Indicator has been successfully installed and the AppIndicator extension has been enabled."
}

pkg_prerm() {
    gnome-extensions disable appindicatorsupport@rgcjonas.gmail.com || die "Failed to disable AppIndicator extension"
}
