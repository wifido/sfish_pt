
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandriva Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(42133);
 script_version("$Revision: 1.1 $");
 script_name(english: "MDVSA-2009:278: compiz-fusion-plugins-main");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDVSA-2009:278 (compiz-fusion-plugins-main).");
 script_set_attribute(attribute: "description", value: "A vulnerability has been found and corrected in
compiz-fusion-plugins-main:
The Expo plugin in Compiz Fusion 0.7.8 allows local users with physical
access to drag the screen saver aside and access the locked desktop
by using Expo mouse shortcuts, a related issue to CVE-2007-3920
(CVE-2008-6514).
This update fixes this vulnerability.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:L/AC:H/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDVSA-2009:278");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2007-3920", "CVE-2008-6514");
script_summary(english: "Check for the version of the compiz-fusion-plugins-main package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"compiz-fusion-plugins-main-0.7.8-0.20080912.1.1mdv2009.0", release:"MDK2009.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"compiz-fusion-plugins-main-devel-0.7.8-0.20080912.1.1mdv2009.0", release:"MDK2009.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"compiz-fusion-plugins-main-", release:"MDK2009.0") )
{
 set_kb_item(name:"CVE-2007-3920", value:TRUE);
 set_kb_item(name:"CVE-2008-6514", value:TRUE);
}
exit(0, "Host is not affected");
