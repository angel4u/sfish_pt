# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200610-07.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(22893);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200610-07");
 script_cve_id("CVE-2006-4980");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200610-07 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200610-07
(Python: Buffer Overflow)


    Benjamin C. Wiley Sittler discovered a buffer overflow in Python\'s
    "repr()" function when handling UTF-32/UCS-4 encoded strings.
  
Impact

    If a Python application processes attacker-supplied data with the
    "repr()" function, this could potentially lead to the execution of
    arbitrary code with the privileges of the affected application or a
    Denial of Service.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Python users should update to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=dev-lang/python-2.4.3-r4"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-4980');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200610-07.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200610-07] Python: Buffer Overflow');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Python: Buffer Overflow');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "dev-lang/python", unaffected: make_list("ge 2.4.3-r4", "rge 2.3.5-r3", "rge 2.3.6"), vulnerable: make_list("lt 2.4.3-r4")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
