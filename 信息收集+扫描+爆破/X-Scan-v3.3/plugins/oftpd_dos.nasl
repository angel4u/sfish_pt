#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(12125);
 script_version ("$Revision: 1.10 $");

 script_cve_id("CVE-2004-0376");
 script_bugtraq_id(9980);
 script_xref(name:"OSVDB", value:"4581");

 script_name(english:"oftpd PORT Command Remote DoS");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host has an application that is affected by a
denial of service vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote FTP server seems to be running oftpd version 
0.3.6 or older. There is a bug in this version which may 
allow an attacker to disable this service remotely by 
sending a malformed PORT command.

An attacker may exploit this flaw to prevent this system 
from doing its job." );
 script_set_attribute(attribute:"solution", value:
"Upgrade to oftpd 0.3.7 or newer" );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P" );
	 	     
script_end_attributes();

		    
 
 script_summary(english:"Determines if the remote oftpd server might be vulnerable to a DoS attack");
 script_category(ACT_ATTACK);
 script_family(english:"FTP");
 
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
		  
 script_dependencie("find_service1.nasl", "ftpserver_detect_type_nd_version.nasl", "ftp_anonymous.nasl");
 script_require_keys("ftp/login", "ftp/wuftpd");
 script_require_ports("Services/ftp", 21);
  
 exit(0);
}

#
# The script code starts here : 
#
include("ftp_func.inc");

login = get_kb_item("ftp/login");
pass  = get_kb_item("ftp/password");


port = get_kb_item("Services/ftp");
if(!port)port = 21;
if (! get_port_state(port)) exit(0);

banner = get_ftp_banner(port: port);

if ("Service ready for new user" >!< banner ) exit(0);

if ( ! login ) login = "ftp";

soc = open_sock_tcp(port);
if(soc)
{
 if(ftp_authenticate(socket:soc, user:login, pass:pass))
 {
  # oftpd 0.3.6 and older will happily return the size of
  # a directory, whereas 0.3.7 issues an error.
  send(socket:soc, data:'TYPE I\r\n');
  err = ftp_recv_line(socket:soc);
  send(socket:soc, data:'SIZE .\r\n');
  err = ftp_recv_line(socket:soc);
  if ( egrep(pattern:"^213 [0-9]*", string:err) ) security_warning(port);
 }
}
