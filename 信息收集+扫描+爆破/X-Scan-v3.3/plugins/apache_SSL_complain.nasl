#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(15588);
 script_version("$Revision: 1.15 $");
 script_name(english:"Web Server SSL Port HTTP Traffic Detection");
 
 script_set_attribute(attribute:"synopsis", value:
"An SSL detection issue might impede the Nessus Scan." );
 script_set_attribute(attribute:"description", value:
"Nessus has discovered that it is talking in plain HTTP on a SSL port. 

Nessus has corrected this issue by enabling HTTPS for this port only. 
However if other SSL ports are used on the remote host, they might be
skipped." );
 script_set_attribute(attribute:"solution", value:
"Enable SSL tests in the 'Services' preference setting, or increase the
timeouts if this option is already set and the plugin missed this
port." );
 script_set_attribute(attribute:"risk_factor", value:"None" );
 script_end_attributes();

 script_summary(english:"Web server complains that we are talking plain HTTP on HTTPS port");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
 script_family(english: "Web Servers");
 script_dependencie("find_service1.nasl");
 exit(0);
}

# 
include("global_settings.inc");
include("misc_func.inc");

banners = get_kb_list("FindService/tcp/*/get_http");
if (COMMAND_LINE)
{
  soc = http_open_socket(443);
  if (! soc) exit(0);
  send(socket: soc, data: 'GET / HTTP/1.0\r\n\r\n');
  banner = recv(socket: soc, length: 65535);
  http_close_socket(soc);
  if (! banner) exit(0);
  banners = make_array(443, banner);  
}
if ( isnull(banners) ) exit(0);

foreach p (keys(banners))
{
# If there are several values, get_kb_item will fork and that's bad.
# However, this only happens when the KB is saved?
  b = banners[p];
  port = ereg_replace(string: p, pattern: ".*/([0-9]+)/.*", replace: "\1");
  port = int(port);
  if (port)
    if (# Apache
        b =~ "<!DOCTYPE HTML .*You're speaking plain HTTP to an SSL-enabled server" ||
        # Webmin
        "Bad Request" >< b && "<pre>This web server is running in SSL mode" >< b)
  {
    security_note(port);
    if (COMMAND_LINE) display("\n **** SSL server detected on ", get_host_ip(), ":", port, " ****\n\n");
    if (service_is_unknown(port: port)) 
      register_service(port: port, proto: "www");
    for (t = ENCAPS_SSLv2; t <= ENCAPS_TLSv1; t ++)
    {
      s = open_sock_tcp(port, transport: t);
      if (s)
      {
        send(socket: s, data: 'GET / HTTP/1.0\r\n\r\n');
        b = recv(socket: s, length: 4096);
        close(s);
        k = "Transports/TCP/"+port;
        if (defined_func("replace_kb_item"))
        {
          replace_kb_item(name: k, value: t);
          if (b)
          {
            replace_kb_item(name: "FindService/tcp/"+port+"/get_http", value: b);
            replace_kb_item(name: "www/banner/"+port, value: b);
          }
        }
        else
        {
          set_kb_item(name: k, value: t);
          if (b)
          {
            set_kb_item(name: "FindService/tcp/"+port+"/get_http", value: b);
            set_kb_item(name: "www/banner/"+port, value: b);
          }
        }
        break;
      }
    }
  }
}

