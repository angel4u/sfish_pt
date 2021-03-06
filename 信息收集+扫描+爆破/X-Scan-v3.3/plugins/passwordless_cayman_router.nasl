#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(10345);
 script_version ("$Revision: 1.11 $");
 script_cve_id("CVE-1999-0508");

 script_name(english:"Cayman DSL Router Unauthenticated Access");
 
 script_set_attribute(attribute:"synopsis", value:
"It is possible to log in to the remote router without any
password." );
 script_set_attribute(attribute:"description", value:
"The remote router has no password. An intruder
may connect to it and disable it easily." );
 script_set_attribute(attribute:"solution", value:
"Set a strong password." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );

script_end_attributes();

 script_summary(english:"Notifies that the remote cayman router has no password");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2000-2009 Tenable Network Security, Inc.");
 script_family(english:"Misc.");
 script_dependencie("find_service1.nasl");
 script_require_ports("Services/telnet", 23);
 exit(0);
}

#
# The script code starts here
#
include('telnet_func.inc');
port = get_kb_item("Services/telnet");
if(!port) port = 23;

if(get_port_state(port))
{
 buf = get_telnet_banner(port:port);
 if ( ! buf || "Terminal shell" >!< buf ) exit(0);
 soc = open_sock_tcp(port);
 if(soc)
 {
  buf = telnet_negotiate(socket:soc);
  if("Terminal shell" >< buf)
  	{
	 r = recv(socket:soc, length:2048);
	 b = buf + r;
	 if("completed login" >< b)security_hole(port);
	}
  close(soc);
 }
}
