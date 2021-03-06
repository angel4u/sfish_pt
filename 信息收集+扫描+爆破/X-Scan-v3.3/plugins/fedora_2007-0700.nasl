
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2007-0700
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(27674);
 script_version ("$Revision: 1.2 $");
script_name(english: "Fedora 7 2007-0700: firestarter");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2007-0700 (firestarter)");
 script_set_attribute(attribute: "description", value: "Firestarter is an easy-to-use, yet powerful, Linux firewall tool for GNOME.
Use it to quickly set up a secure environment using the firewall creation
wizard, or use it's monitoring and administrating features with your old
firewall scripts.

-
ChangeLog:


Update information :

* Tue Jun 26 2007 Damien Durand <splinux fedoraproject org> - 1.0.3-16
- Fix BR
- Fix active connections status
");
 script_set_attribute(attribute: "risk_factor", value: "High");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

script_summary(english: "Check for the version of the firestarter package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"firestarter-1.0.3-16.fc7", release:"FC7") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
