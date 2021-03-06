# This script was automatically generated from the dsa-1420
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(29227);
 script_version("$Revision: 1.4 $");
 script_xref(name: "DSA", value: "1420");
 script_cve_id("CVE-2007-6210");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1420 security update');
 script_set_attribute(attribute: 'description', value:
'Bas van Schaik discovered that the agentd process of Zabbix, a network
monitor system, may run user-supplied commands as group id root, not
zabbix, which may lead to a privilege escalation.


zabbix is not included in the oldstable distribution (sarge).


For the stable distribution (etch), this problem has been fixed in version
1:1.1.4-10etch1.

');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2007/dsa-1420');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your zabbix packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:P/I:N/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1420] DSA-1420-1 zabbix");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1420-1 zabbix");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'zabbix-agent', release: '4.0', reference: '1.1.4-10etch1');
deb_check(prefix: 'zabbix-frontend-php', release: '4.0', reference: '1.1.4-10etch1');
deb_check(prefix: 'zabbix-server-mysql', release: '4.0', reference: '1.1.4-10etch1');
deb_check(prefix: 'zabbix-server-pgsql', release: '4.0', reference: '1.1.4-10etch1');
deb_check(prefix: 'zabbix', release: '4.0', reference: '1.1.4-10etch1');
if (deb_report_get()) security_note(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
