# This script was automatically generated from the dsa-261
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15098);
 script_version("$Revision: 1.13 $");
 script_xref(name: "DSA", value: "261");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-261 security update');
 script_set_attribute(attribute: 'description', value:
'A problem has been discovered in tcpdump, a powerful tool for network
monitoring and data acquisition.  An attacker is able to send a
specially crafted RADIUS network packet which causes tcpdump to enter
an infinite loop.
For the stable distribution (woody) this problem has been
fixed in version 3.6.2-2.4.
The old stable distribution (potato) does not seem to be affected
by this problem.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2003/dsa-261');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your tcpdump package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA261] DSA-261-1 tcpdump");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_cve_id("CVE-2003-0093", "CVE-2003-0145");
 script_summary(english: "DSA-261-1 tcpdump");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'tcpdump', release: '3.0', reference: '3.6.2-2.4');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
