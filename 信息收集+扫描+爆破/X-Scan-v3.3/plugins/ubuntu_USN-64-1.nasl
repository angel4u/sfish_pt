# This script was automatically generated from the 64-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(20683);
script_version("$Revision: 1.5 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "64-1");
script_summary(english:"xpdf, cupsys vulnerabilities");
script_name(english:"USN64-1 : xpdf, cupsys vulnerabilities");
script_set_attribute(attribute:'synopsis', value: 'These remote packages are missing security patches :
- cupsys 
- cupsys-bsd 
- cupsys-client 
- libcupsimage2 
- libcupsimage2-dev 
- libcupsys2-dev 
- libcupsys2-gnutls10 
- xpdf 
- xpdf-common 
- xpdf-reader 
- xpdf-utils 
');
script_set_attribute(attribute:'description', value: 'A buffer overflow has been found in the xpdf viewer. An insufficient
input validation of the encryption key length could be exploited by an
attacker providing a specially crafted PDF file which, when processed
by xpdf, could result in abnormal program termination or the execution
of attacker supplied program code with the user\'s privileges.

The Common UNIX Printing System (CUPS) uses the same code to print PDF
files. In this case, this bug could be exploited to gain the
privileges of the CUPS print server (by default, user cupsys).');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- cupsys-1.1.20final+cvs20040330-4ubuntu16.4 (Ubuntu 4.10)
- cupsys-bsd-1.1.20final+cvs20040330-4ubuntu16.4 (Ubuntu 4.10)
- cupsys-client-1.1.20final+cvs20040330-4ubuntu16.4 (Ubuntu 4.10)
- libcupsimage2-1.1.20final+cvs20040330-4ubuntu16.4 (Ubuntu 4.10)
- libcupsimage2-dev-1.1.20final+cvs20040330-4ubuntu16.4 (Ubuntu 4.10)
- libcupsys2-dev-1.1.20final+cvs20040330-4ubuntu16.4 (Ubuntu 4.10)
- libcupsys2-gnutls10-1.1.20final+cvs20040330-4ubuntu16.4 (Ubuntu 4.10)
- xpdf-3.00-8ubuntu1.4 (Ubuntu 4.1
[...]');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

script_cve_id("CVE-2005-0064");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "4.10", pkgname: "cupsys", pkgver: "1.1.20final+cvs20040330-4ubuntu16.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package cupsys-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to cupsys-1.1.20final+cvs20040330-4ubuntu16.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "cupsys-bsd", pkgver: "1.1.20final+cvs20040330-4ubuntu16.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package cupsys-bsd-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to cupsys-bsd-1.1.20final+cvs20040330-4ubuntu16.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "cupsys-client", pkgver: "1.1.20final+cvs20040330-4ubuntu16.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package cupsys-client-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to cupsys-client-1.1.20final+cvs20040330-4ubuntu16.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libcupsimage2", pkgver: "1.1.20final+cvs20040330-4ubuntu16.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libcupsimage2-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libcupsimage2-1.1.20final+cvs20040330-4ubuntu16.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libcupsimage2-dev", pkgver: "1.1.20final+cvs20040330-4ubuntu16.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libcupsimage2-dev-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libcupsimage2-dev-1.1.20final+cvs20040330-4ubuntu16.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libcupsys2-dev", pkgver: "1.1.20final+cvs20040330-4ubuntu16.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libcupsys2-dev-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libcupsys2-dev-1.1.20final+cvs20040330-4ubuntu16.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libcupsys2-gnutls10", pkgver: "1.1.20final+cvs20040330-4ubuntu16.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libcupsys2-gnutls10-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libcupsys2-gnutls10-1.1.20final+cvs20040330-4ubuntu16.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "xpdf", pkgver: "3.00-8ubuntu1.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package xpdf-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to xpdf-3.00-8ubuntu1.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "xpdf-common", pkgver: "3.00-8ubuntu1.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package xpdf-common-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to xpdf-common-3.00-8ubuntu1.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "xpdf-reader", pkgver: "3.00-8ubuntu1.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package xpdf-reader-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to xpdf-reader-3.00-8ubuntu1.4
');
}
found = ubuntu_check(osver: "4.10", pkgname: "xpdf-utils", pkgver: "3.00-8ubuntu1.4");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package xpdf-utils-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to xpdf-utils-3.00-8ubuntu1.4
');
}

if (w) { security_hole(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
