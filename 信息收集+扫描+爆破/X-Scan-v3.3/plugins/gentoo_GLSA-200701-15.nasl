# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200701-15.xml
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
 script_id(24251);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200701-15");
 script_cve_id("CVE-2006-6731", "CVE-2006-6736", "CVE-2006-6737", "CVE-2006-6745");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200701-15 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200701-15
(Sun JDK/JRE: Multiple vulnerabilities)


    Chris Evans has discovered multiple buffer overflows in Sun JDK and Sun
    JRE possibly related to various AWT or font layout functions. Tom
    Hawtin has discovered an unspecified vulnerability in Sun JDK and Sun
    JRE relating to unintended applet data access. He has also discovered
    multiple other unspecified vulnerabilities in Sun JDK and Sun JRE
    allowing unintended Java applet or application resource acquisition.
  
Impact

    An attacker could entice a user to run a specially crafted Java applet
    or application that could read, write, or execute local files with the
    privileges of the user running the JVM; access data maintained in other
    Java applets; or escalate the privileges of the currently running Java
    applet or application allowing for unauthorized access to system
    resources.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Sun Java Development Kit users should upgrade to the latest
    version:
    # emerge --sync
    # emerge --ask --oneshot --verbose "dev-java/sun-jdk"
    All Sun Java Runtime Environment users should upgrade to the latest
    version:
    # emerge --sync
    # emerge --ask --oneshot --verbose "dev-java/sun-jre-bin"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-6731');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-6736');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-6737');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-6745');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200701-15.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200701-15] Sun JDK/JRE: Multiple vulnerabilities');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Sun JDK/JRE: Multiple vulnerabilities');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "dev-java/sun-jre-bin", unaffected: make_list("ge 1.5.0.09", "rge 1.4.2.18", "rge 1.4.2.17", "rge 1.4.2.15", "rge 1.4.2.14", "rge 1.4.2.13"), vulnerable: make_list("lt 1.5.0.09")
)) { security_hole(0); exit(0); }
if (qpkg_check(package: "dev-java/sun-jdk", unaffected: make_list("ge 1.5.0.09", "rge 1.4.2.18", "rge 1.4.2.17", "rge 1.4.2.15", "rge 1.4.2.14", "rge 1.4.2.13"), vulnerable: make_list("lt 1.5.0.09")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
