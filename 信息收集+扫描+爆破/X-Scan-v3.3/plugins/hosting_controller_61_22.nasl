#
# (C) Tenable Network Security
#



include("compat.inc");

if (description) {
  script_id(19255);
  script_version("$Revision: 1.8 $");

  script_bugtraq_id(14302, 14393);
  script_xref(name:"OSVDB", value:"17915");
  script_xref(name:"OSVDB", value:"17916");
  script_xref(name:"OSVDB", value:"17917");
  script_xref(name:"OSVDB", value:"17918");
  script_xref(name:"OSVDB", value:"18347");

  name["english"] = "Hosting Controller <= 6.1 Hotfix 2.2 Multiple Vulnerabilities";
  script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains an ASP application that is affected by
multiple vulnerabilities." );
 script_set_attribute(attribute:"description", value:
"According to its version number, the installation of Hosting
Controller on the remote host improperly allows an authenticated user
to add hosting plans to his account, to edit the details of his own or
anyone else's hosting plans, to view the folders of all resellers and
the web admin, to add domains with unlimited quotas, and to influence
SQL queries via the 'hostcustid' parameter of the 'plandetails.asp'
script." );
 script_set_attribute(attribute:"see_also", value:"http://securitytracker.com/alerts/2005/Jul/1014496.html" );
 script_set_attribute(attribute:"see_also", value:"http://hostingcontroller.com/english/logs/hotfixlogv61_2_3.html" );
 script_set_attribute(attribute:"solution", value:
"Apply Hotfix 2.3 or later for version 6.1." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:S/C:P/I:P/A:P" );
script_end_attributes();

 
  summary["english"] = "Checks for multiple vulnerabilities in Hosting Controller <= 6.1 Hotfix 2.2";
  script_summary(english:summary["english"]);
 
  script_category(ACT_GATHER_INFO);
  script_family(english:"CGI abuses");

  script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");

  script_dependencies("hosting_controller_detect.nasl");
  script_require_ports("Services/hosting_controller");

  exit(0);
}


include("global_settings.inc");
include("misc_func.inc");


# Check for Hosting Controller installs.
ports = add_port_in_list(list:get_kb_list("Services/www"), port:8887);
foreach port (ports) {
  ver = get_kb_item(string("www/", port, "/hosting_controller"));
  if (ver) {
    # nb: versions <= 6.1 hotfix 2.2 are vulnerable.
    if (ver =~ "^(2002|[0-5]\.|6\.(0|1($| hotfix ([01]\.|2\.[0-2]))))") {
      security_warning(port);
      if (!thorough_tests) exit(0);
    }
  }
}
