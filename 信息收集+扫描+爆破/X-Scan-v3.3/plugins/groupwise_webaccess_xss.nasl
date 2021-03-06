#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description) {
  script_id(19228);
  script_version("$Revision: 1.9 $");

  script_cve_id("CVE-2005-2276");
  script_bugtraq_id(14310);
  script_xref(name:"OSVDB", value:"18064");

  script_name(english:"Novell GroupWise WebAccess E-Mail IMG SRC XSS");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a script that is affected by a cross-
site scripting issue." );
 script_set_attribute(attribute:"description", value:
"The remote host is running a version of GroupWise WebAccess from
Novell that fails to sanitize email messages of HTML and script code
embedded in IMG tags.  An attacker can exploit this flaw to launch
cross-site scripting attacks against users of WebAccess by sending
them specially crafted email messages." );
 script_set_attribute(attribute:"see_also", value:"http://www.infobyte.com.ar/adv/ISR-11.html" );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2005-07/0322.html" );
 script_set_attribute(attribute:"see_also", value:"http://support.novell.com/cgi-bin/search/searchtid.cgi?/10098301.htm" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to GroupWise 6.5 SP5 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N" );
script_end_attributes();

 
  summary["english"] = "Checks for cross-site scripting vulnerability in GroupWise WebAccess";
  script_summary(english:summary["english"]);
 
  script_category(ACT_GATHER_INFO);
  script_family(english:"CGI abuses : XSS");

  script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");

  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_require_keys("Settings/ParanoidReport");
  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);

# The aboutpqa.htm associated with the Palm app often has more detailed info
# but isn't necessarily upgraded so check only if Report Paranoia is
# set to Paranoid.
if (report_paranoia < 2) exit(0);

w = http_send_recv3(method:"GET", item:"/com/novell/webaccess/palm/en/aboutpqa.htm", port:port);
if (isnull(w)) exit(1, "the web server did not answer");
res = w[2];
# nb: looks like:
#     <BR>Program Release:
#     <BR>6.5.4 
if ("<BR>Program Release:" >< res) {
  res = strstr(res, "Program Release:");
  pat = "^<BR>([0-9].+)$";
  if (egrep(string:res, pattern:pat, icase:TRUE)) {
    matches = egrep(pattern:pat, string:res, icase:TRUE);
    foreach match (split(matches)) {
      match = chomp(match);
      ver = eregmatch(pattern:pat, string:match);
      if (!isnull(ver)) {
        ver = ver[1];
        break;
      }
    }
  }
}

# If that failed, try to get it from WebAccess' main page.
if (isnull(ver)) {
  w = http_send_recv3(method:"GET", item:"/servlet/webacc", port:port);
  if (isnull(w)) exit(1, "the web server did not answer");
  res = w[2];

  # Look for the version number in the banner.
  pat = "^<BR>Version ([0-9].+)";
  if (egrep(string:res, pattern:pat, icase:TRUE)) {
    matches = egrep(pattern:pat, string:res, icase:TRUE);
    foreach match (split(matches)) {
      match = chomp(match);
      ver = eregmatch(pattern:pat, string:match);
      if (!isnull(ver)) {
        ver = ver[1];
        # nb: 6.5 by itself doesn't give us enough details.
        if (ver =~ "^6\.5$") {
          ver = NULL;
        }
        break;
      }
    }
  }
}

# Versions 6.5.4 and below are affected.
if (ver && ver =~ "^([0-5]\.|6\.([0-4]|5\.[0-4]))") {
  security_warning(port);
  set_kb_item(name: 'www/'+port+'/XSS', value: TRUE);
  exit(0);
}
