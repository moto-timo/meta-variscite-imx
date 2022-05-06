FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://remove_default_sleep_d.diff \
        file://01-bt.sh \
        file://02-wifi.sh \
"

SRC_URI_append_imx8qxp-var-som = " \
        file://03-eth.sh \
"

SRC_URI_append_imx8qxpb0-var-som = " \
        file://03-eth.sh \
"

FILES_${PN} += "/etc/pm/sleep.d/*"

do_install_append() {
	install -d ${D}/${sysconfdir}/pm/sleep.d
	install -m 0755 ${WORKDIR}/01-bt.sh ${D}/${sysconfdir}/pm/sleep.d
	install -m 0755 ${WORKDIR}/02-wifi.sh ${D}/${sysconfdir}/pm/sleep.d
}

do_install_append_imx8qxp-var-som() {
        install -d ${D}/${sysconfdir}/pm/sleep.d
        install -m 0755 ${WORKDIR}/03-eth.sh ${D}/${sysconfdir}/pm/sleep.d
}

do_install_append_imx8qxpb0-var-som() {
        install -d ${D}/${sysconfdir}/pm/sleep.d
        install -m 0755 ${WORKDIR}/03-eth.sh ${D}/${sysconfdir}/pm/sleep.d
}
