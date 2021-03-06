#
# This script was written by Xue Yong Zhi <xueyong@udel.edu>
#
# See the Nessus Scripts License for details
#

# Changes by Tenable:
# - Revised plugin title, OSVDB ref, output formatting (9/16/09)
# - Updated to use compat.inc, added CVSS score (11/20/2009)



include("compat.inc");

if(description)
{
 script_id(11348);
 script_version ("$Revision: 1.5 $");
 script_cve_id("CVE-1999-1309");
 script_xref(name:"OSVDB", value:"7530");

 script_name(english:"Sendmail < 8.6.8 -debug Local Privilege Escalation");

 script_set_attribute(attribute:"synopsis", value:
"The remote host has an application that is affected by local
privilege escalation vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote sendmail server, according to its version number,
allows local users to gain root access via a large value in
the debug (-d) command line option" );
 script_set_attribute(attribute:"solution", value:
"Install sendmail newer than versions 8.6.8 or install
a vendor supplied patch." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C" );


script_end_attributes();

 script_summary(english:"Checks the version number");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2003-2009 Xue Yong Zhi");
 script_family(english:"SMTP problems");
 script_dependencie("find_service1.nasl", "smtpserver_detect.nasl");
 script_require_ports("Services/smtp", 25);
 script_require_keys("SMTP/sendmail");
 exit(0);
}

#
# The script code starts here
#

include("smtp_func.inc");

port = get_kb_item("Services/smtp");
if(!port) port = 25;

banner = get_smtp_banner(port:port);

if(banner)
{
 #looking for Sendmail 8.6.7 and previous
 if(egrep(pattern:".*sendmail[^0-9]*(SMI-)?8\.([0-5]|[0-5]\.[0-9]+|6|6\.[0-7])/.*", string:banner, icase:TRUE))
 	security_hole(port);
}
