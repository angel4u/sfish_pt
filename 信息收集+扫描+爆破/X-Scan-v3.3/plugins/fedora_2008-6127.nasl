
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2008-6127
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(33416);
 script_version ("$Revision: 1.3 $");
script_name(english: "Fedora 8 2008-6127: ruby-gnome2");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2008-6127 (ruby-gnome2)");
 script_set_attribute(attribute: "description", value: "This is a set of bindings for the GNOME-2.x libraries for use from Ruby.

-
Update Information:

Updated firefox packages that fix several security issues are now available for
Fedora 8.    This update has been rated as having critical security impact by
the Fedora Security Response Team.    Multiple flaws were found in the
processing of malformed JavaScript content. A web page containing such maliciou
s
content could cause Firefox to crash or, potentially, execute arbitrary code as
the user running Firefox. (CVE-2008-2801, CVE-2008-2802, CVE-2008-2803)
Several flaws were found in the processing of malformed web content. A web page
containing malicious content could cause Firefox to crash or, potentially,
execute arbitrary code as the user running Firefox. (CVE-2008-2798,
CVE-2008-2799, CVE-2008-2811)    Several flaws were found in the way malformed
web content was displayed. A web page containing specially-crafted content coul
d
potentially trick a Firefox user into surrendering sensitive information.
(CVE-2008-2800)    Two local file disclosure flaws were found in Firefox. A web
page containing malicious content could cause Firefox to reveal the contents of
a local file to a remote attacker. (CVE-2008-2805, CVE-2008-2810)    A flaw was
found in the way a malformed .properties file was processed by Firefox. A
malicious extension could read uninitialized memory, possibly leaking sensitive
data to the extension. (CVE-2008-2807)    A flaw was found in the way Firefox
escaped a listing of local file names. If a user could be tricked into listing
a
local directory containing malicious file names, arbitrary JavaScript could be
run with the permissions of the user running Firefox. (CVE-2008-2808)    A flaw
was found in the way Firefox displayed information about self-signed
certificates. It was possible for a self-signed certificate to contain multiple
alternate name entries, which were not all displayed to the user, allowing them
to mistakenly extend trust to an unknown site. (CVE-2008-2809)    Updated
packages update Mozilla Firefox to upstream version 2.0.0.15 to address these
flaws:    [9]http://www.mozilla.org/projects/security/known-
vulnerabilities.html#firefox2.0.0.15    This update also contains blam, chmsee,
devhelp, epiphany, epiphany-extensions, galeon, gnome-python2-extras, gnome-web
-
photo, gtkmozembedmm, kazehakase, liferea, Miro, openvrml, ruby-gnome2 and yelp
packages rebuilt against new Firefox / Gecko libraries.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2007-6183", "CVE-2008-2798", "CVE-2008-2799", "CVE-2008-2800", "CVE-2008-2801", "CVE-2008-2802", "CVE-2008-2803", "CVE-2008-2805", "CVE-2008-2807", "CVE-2008-2808", "CVE-2008-2809", "CVE-2008-2810", "CVE-2008-2811");
script_summary(english: "Check for the version of the ruby-gnome2 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"ruby-gnome2-0.17.0-0.2.rc1.fc8", release:"FC8") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
