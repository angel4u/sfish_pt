# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200603-24.xml
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
 script_id(21148);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200603-24");
 script_cve_id("CVE-2006-0323");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200603-24 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200603-24
(RealPlayer: Buffer overflow vulnerability)


    RealPlayer is vulnerable to a buffer overflow when processing
    malicious SWF files.
  
Impact

    By enticing a user to open a specially crafted SWF file an
    attacker could execute arbitrary code with the permissions of the user
    running the application.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All RealPlayer users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=media-video/realplayer-10.0.7"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-0323');
script_set_attribute(attribute: 'see_also', value: 'http://service.real.com/realplayer/security/03162006_player/en/');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200603-24.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200603-24] RealPlayer: Buffer overflow vulnerability');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'RealPlayer: Buffer overflow vulnerability');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "media-video/realplayer", unaffected: make_list("ge 10.0.7"), vulnerable: make_list("lt 10.0.7")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
