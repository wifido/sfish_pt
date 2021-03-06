#
# (C) Tenable Network Security
#


include("compat.inc");

if (description)
{
  script_id(21597);
  script_version("$Revision: 1.4 $");

  script_cve_id("CVE-2006-2513");
  script_bugtraq_id(18018);
  script_xref(name:"OSVDB", value:"25575");

  script_name(english:"Sun Server Console Authentication Bypass");
  script_summary(english:"Tries to authenticate to Server Console as admin/admin");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server is protected with a default set of credentials." );
 script_set_attribute(attribute:"description", value:
"The remote host is running the Sun ONE Server Console, which provides
an administrative interface to the Sun Java System Directory Server
installed there. 

The Server Console instance on the remote host allows authentication
using a default set of credentials - 'admin' / 'admin'.  This is
likely the result not of a deliberate choice during installation but
rather a flaw in the version of Directory Server used for the initial
installation." );
 script_set_attribute(attribute:"see_also", value:"http://sunsolve.sun.com/search/document.do?assetkey=1-26-102345-1" );
 script_set_attribute(attribute:"solution", value:
"Manually change the administrative user password as described in the
vendor advisory referenced above." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );
script_end_attributes();


  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses");

  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");

  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 390);

  exit(0);
}


include("global_settings.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");


port = get_http_port(default:390);
if (!get_port_state(port)) exit(0);


# Make sure that it looks like the the Server Console and that it's protected.
banner = get_http_banner(port:port);
if (!banner || "Netscape-Enterprise" >!< banner) exit(0);

url = "/admin-serv/authenticate";
req = http_get(item:url, port:port);
res = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
if (res == NULL) exit(0);
if ('WWW-authenticate: basic realm="Sun ONE Administration Server"' >!< res) exit(0);


# Try to log in.
req = http_get(item:url, port:port);
req = str_replace(
  string:req,
  find:"User-Agent:",
  replace:string(
    "Authorization: Basic ", base64(str:"admin:admin"), "\r\n",
    "User-Agent:"
  )
);
res = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
if (res == NULL) exit(0);


# There's a problem if we get in.
if ("UserDN: cn=admin-serv" >< res) security_hole(port);
