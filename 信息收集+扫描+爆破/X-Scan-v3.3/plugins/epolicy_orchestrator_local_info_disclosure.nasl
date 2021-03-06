#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description) {
  script_id(19552);
  script_version("$Revision: 1.10 $");

  script_cve_id("CVE-2005-2554");
  script_bugtraq_id(14549);
  script_xref(name:"OSVDB", value:"18735");

  script_name(english:"ePolicy Orchestrator Symlink Arbitrary Privileged File Access");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is prone to an information disclosure
vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote host is running ePolicy Orchestrator / ProtectionPilot, a
system security management solution from McAfee. 

According to its banner, the Common Management Agent (CMA) associated
with ePolicy Orchestrator / ProtectionPilot on the remote host can be
used by local users to view files residing on the same partition as
the affected application with LocalSystem level privileges by creating
symbolic links in the agent's web root directory.  This may enable
them to read files to which they would not otherwise have access." );
 script_set_attribute(attribute:"see_also", value:"http://reedarvin.thearvins.com/20050811-01.html" );
 script_set_attribute(attribute:"see_also", value:"http://knowledge.mcafee.com/article/430/KB42216_f.SAL_Public.html" );
 script_set_attribute(attribute:"solution", value:
"Apply CMA 3.5 Patch 4 as described in the vendor's advisory." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:L/AC:L/Au:N/C:C/I:N/A:N" );
script_end_attributes();

 
  script_summary(english:"Checks for local information disclosure vulnerability in ePolicy Orchestrator");
  script_category(ACT_GATHER_INFO);
  script_family(english:"Web Servers");
  script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 8081);

  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");


port = get_http_port(default:8081);

# Grab the initial page.
res = http_get_cache(item:"/", port:port);
if (res == NULL) exit(0);


# There's a problem if ...
if (
  # it looks like EPO and...
  '<?xml-stylesheet type="text/xsl" href="FrameworkLog.xsl"?>' >< res &&
  egrep(string:res, pattern:"^ +<Log component=.+</Log") &&
  # the version is below 3.5.0.508 (ie, 3.5.0 patch 4)
  egrep(string:res, pattern:"^ +<version>3\.([0-4]\..*|5\.0\.([0-4].*|50[0-7]))<")
) {
  security_warning(port);
}
