# This script was automatically generated from the SSA-2007-325-01a
# Slackware Security Advisory
# It is released under the Nessus Script Licence.
# Slackware Security Advisories are copyright 1999-2009 Slackware Linux, Inc.
# SSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.
# See http://www.slackware.com/about/ or http://www.slackware.com/security/
# Slackware(R) is a registered trademark of Slackware Linux, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(28296);
script_version("$Revision: 1.3 $");
script_category(ACT_GATHER_INFO);
script_family(english: "Slackware Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_copyright("This script is Copyright (C) 2009 Tenable Network Security, Inc.");
script_require_keys("Host/Slackware/release", "Host/Slackware/packages");

script_set_attribute(attribute:'synopsis', value:
'The remote host is missing the SSA-2007-325-01a security update');
script_set_attribute(attribute:'description', value: '
New libpng packages are available for Slackware 10.1 and 10.2 that
were left out of the last batch of updates.  These fix the same
security problems as the other 1.2.23 upgrades.

More details about these issues may be found in the Common
Vulnerabilities and Exposures (CVE) database:
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5266
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5267
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5268
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5269


');
script_set_attribute(attribute:'solution', value: 
'Update the packages that are referenced in the security advisory.');
script_xref(name: "SSA", value: "2007-325-01a");
script_summary("SSA-2007-325-01a libpng for Slackware 10.1 and 10.2 ");
script_name(english: "SSA-2007-325-01a libpng for Slackware 10.1 and 10.2 ");
script_cve_id("CVE-2007-5266","CVE-2007-5267","CVE-2007-5268","CVE-2007-5269");
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P');
script_end_attributes();
exit(0);
}

include('slackware.inc');
include('global_settings.inc');

if ( ! get_kb_item('Host/Slackware/packages') ) exit(1, 'Could not obtain the list of packages');

extrarep = NULL;
if (slackware_check(osver: "10.1", pkgname: "libpng", pkgver: "1.2.23", pkgnum:  "1", pkgarch: "i486")) {
w++;
if (report_verbosity > 0) extrarep = strcat(extrarep, '
The package libpng is vulnerable in Slackware 10.1
Upgrade to libpng-1.2.23-i486-1_slack10.1 or newer.
');
}
if (slackware_check(osver: "10.2", pkgname: "libpng", pkgver: "1.2.23", pkgnum:  "1", pkgarch: "i486")) {
w++;
if (report_verbosity > 0) extrarep = strcat(extrarep, '
The package libpng is vulnerable in Slackware 10.2
Upgrade to libpng-1.2.23-i486-1_slack10.2 or newer.
');
}

if (w) { security_warning(port: 0, extra: extrarep); }

else exit(0, "Host is not affected");
