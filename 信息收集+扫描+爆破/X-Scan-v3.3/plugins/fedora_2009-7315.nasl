
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2009-7315
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(39602);
 script_version ("$Revision: 1.1 $");
script_name(english: "Fedora 11 2009-7315: drupal");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2009-7315 (drupal)");
 script_set_attribute(attribute: "description", value: "Equipped with a powerful blend of features, Drupal is a Content Management
System written in PHP that can support a variety of websites ranging from
personal weblogs to large community-driven websites.  Drupal is highly
configurable, skinnable, and secure.

-
Update Information:

Fixes SA-CORE-2009-007 ( [9]http://drupal.org/node/507572 ).    Remember to log
in
to your site as the admin user before upgrading this package. After upgrading
the package, browse to [10]http://host/drupal/update.php to run the upgrade scr
ipt.
Multiple vulnerabilities and weaknesses were discovered in Drupal.    Cross-sit
e
scripting    The Forum module does not correctly handle certain arguments
obtained from the URL. By enticing a suitably privileged user to visit a
specially crafted URL, a malicious user is able to insert arbitrary HTML and
script code into forum pages. Such a cross-site scripting attack may lead to th
e
malicious user gaining administrative access. Wikipedia has more information
about cross-site scripting (XSS).    This issue affects Drupal 6.x only.
Input format access bypass    User signatures have no separate input format,
they use the format of the comment with which they are displayed. A user will n
o
longer be able to edit a comment when an administrator changes the comment's
input format to a format that is not accessible to the user. However they will
still be able to modify their signature, which will then be processed by the ne
w
input format.    If the new format is very permissive, via their signature, the
user may be able to insert arbitrary HTML and script code into pages or, when
the PHP filter is enabled for the new format, execute PHP code.    This issue
affects Drupal 6.x only.      Password leaked in URL    When an anonymous user
fails to login due to mistyping his username or password, and the page he is on
contains a sortable table, the (incorrect) username and password are included i
n
links on the table. If the user visits these links the password may then be
leaked to external sites via the HTTP referer.    In addition, if the anonymous
user is enticed to visit the site via a specially crafted URL while the Drupal
page cache is enabled, a malicious user might be able to retrieve the
(incorrect) username and password from the page cache.    This issue affects
both Drupal 5.x and Drupal 6.x
");
 script_set_attribute(attribute: "risk_factor", value: "High");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

script_summary(english: "Check for the version of the drupal package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"drupal-6.13-1.fc11", release:"FC11") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
