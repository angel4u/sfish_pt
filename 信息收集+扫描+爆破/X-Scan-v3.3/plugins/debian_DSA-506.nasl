# This script was automatically generated from the dsa-506
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15343);
 script_version("$Revision: 1.11 $");
 script_xref(name: "DSA", value: "506");
 script_cve_id("CVE-2004-0398");
 script_bugtraq_id(10385);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-506 security update');
 script_set_attribute(attribute: 'description', value:
'Stefan Esser discovered a problem in neon, an HTTP and WebDAV client
library.  User input is copied into variables not large enough for all
cases.  This can lead to an overflow of a static heap variable.
For the stable distribution (woody) this problem has been fixed in
version 0.19.3-2woody5.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2004/dsa-506');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your libneon* packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA506] DSA-506-1 neon");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-506-1 neon");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'libneon-dev', release: '3.0', reference: '0.19.3-2woody5');
deb_check(prefix: 'libneon19', release: '3.0', reference: '0.19.3-2woody5');
deb_check(prefix: 'neon', release: '3.0', reference: '0.19.3-2woody5');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
