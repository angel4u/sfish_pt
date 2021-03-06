#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(22094);
  script_version("$Revision: 1.7 $");

  script_name(english:"Check Point FireWall-1 ICA Service Detection");
  script_summary(english:"Checks for Check Point ICA Service");

 script_set_attribute(attribute:"synopsis", value:
"The remote host is a firewall." );
 script_set_attribute(attribute:"description", value:
"The remote host is running Check Point FireWall-1 and is operating a
web server on this port for its internal certificate authority (ICA),
which provides users with certificate revocation lists and registers
users when using the Policy Server. 

Note that it is not known whether it is possible to disable this
service or limit its access to only certain interfaces or addresses." );
 script_set_attribute(attribute:"see_also", value:"http://www.checkpoint.com/products/firewall-1/index.html" );
 script_set_attribute(attribute:"risk_factor", value:"None" );
 script_set_attribute(attribute:"solution", value:"n/a" );
 script_end_attributes();


  script_category(ACT_GATHER_INFO);
  script_family(english:"Firewalls");

  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");

  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 18264);

  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");


port = get_http_port(default:18264);

banner = get_http_banner(port:port);
if (banner && "Server: Check Point SVN" >< banner)
{
  res = http_get_cache(item:"/", port:port);
  if (res == NULL) exit(0);

  if ("<TITLE>Check Point Certificate Services</TITLE>" >< res)
  {
    security_note(port);

    register_service(port:port, ipproto:"tcp", proto:"cp_ica");
  }
}
