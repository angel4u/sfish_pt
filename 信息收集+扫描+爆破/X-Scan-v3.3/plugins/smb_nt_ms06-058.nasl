#
# (C) Tenable Network Security
#


include("compat.inc");

if(description)
{
 script_id(22531);
 script_cve_id("CVE-2006-3435","CVE-2006-3876","CVE-2006-3877","CVE-2006-4694");
 script_bugtraq_id(20226, 20304, 20322, 20325);
 script_xref(name:"OSVDB", value:"29259");
 script_xref(name:"OSVDB", value:"29446");
 script_xref(name:"OSVDB", value:"29447");
 script_xref(name:"OSVDB", value:"29448");
 script_version("$Revision: 1.7 $");

 name["english"] = "MS06-058: Vulnerabilities in Microsoft PowerPoint Could Allow Remote Code Execution (924163)";

 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"Arbitrary code can be executed on the remote host through Microsoft
PowerPoint." );
 script_set_attribute(attribute:"description", value:
"The remote host is running a version of Microsoft PowerPoint
which is subject to a flaw which may allow arbitrary code to be run.

An attacker may use this to execute arbitrary code on this host.

To succeed, the attacker would have to send a rogue file to 
a user of the remote computer and have it open it. Then a bug in
the font parsing handler would result in code execution." );
 script_set_attribute(attribute:"solution", value:
"Microsoft has released a set of patches for PowerPoint 2000, XP and 2003 :

http://www.microsoft.com/technet/security/bulletin/ms06-058.mspx" );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:H/Au:N/C:C/I:C/A:C" );


script_end_attributes();

 
 summary["english"] = "Determines the version of PowerPoint.exe";

 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");
 family["english"] = "Windows : Microsoft Bulletins";
 script_family(english:family["english"]);
 
 script_dependencies("smb_nt_ms02-031.nasl");
 script_require_ports(139, 445);
 exit(0);
}

include("smb_func.inc");
include("smb_hotfixes_fcheck.inc");
port = get_kb_item("SMB/transport");


#
# PowerPoint
#
v = get_kb_item("SMB/Office/PowerPoint/Version");
if ( v ) 
{
 if(ereg(pattern:"^9\..*", string:v))
 {
  # PowerPoint 2000 - fixed in 9.00.00.8952
  sub =  ereg_replace(pattern:"^9\.00?\.00?\.([0-9]*)$", string:v, replace:"\1");
  if(sub != v && int(sub) < 8952 ) { {
 set_kb_item(name:"SMB/Missing/MS06-058", value:TRUE);
 hotfix_security_hole();
 }}
 }
 else if(ereg(pattern:"^10\..*", string:v))
 {
  # PowerPoint XP - fixed in 10.0.6819.0
   middle =  ereg_replace(pattern:"^10\.0\.([0-9]*)\.[0-9]*$", string:v, replace:"\1");
  if(middle != v && int(middle) < 6819) { {
 set_kb_item(name:"SMB/Missing/MS06-058", value:TRUE);
 hotfix_security_hole();
 }}
 }
 else if(ereg(pattern:"^11\..*", string:v))
 {
  # PowerPoint 2003 - fixed in 11.8110.0
   middle =  ereg_replace(pattern:"^11\.0\.([0-9]*)\.[0-9]*$", string:v, replace:"\1");
  if(middle != v && int(middle) < 8110) { {
 set_kb_item(name:"SMB/Missing/MS06-058", value:TRUE);
 hotfix_security_hole();
 }}
 }
}
