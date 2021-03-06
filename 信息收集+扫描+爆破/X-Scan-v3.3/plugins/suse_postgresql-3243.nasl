
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(27401);
 script_version ("$Revision: 1.6 $");
 script_name(english: "SuSE Security Update:  This update fixes two vulnerabilities in PostgreSQL (postgresql-3243)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch postgresql-3243");
 script_set_attribute(attribute: "description", value: "This update fixes two vulnerabilities that affect the
backend server and can only be exploited by authenticated
users to cause a denial-of-service, or maybe to access
other tables/databases without authentication.
(CVE-2007-0555, CVE-2007-0556)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:S/C:C/I:N/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch postgresql-3243");
script_end_attributes();

script_cve_id("CVE-2007-0555", "CVE-2007-0556");
script_summary(english: "Check for the postgresql-3243 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"postgresql-8.1.9-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"postgresql-contrib-8.1.9-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"postgresql-devel-8.1.9-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"postgresql-docs-8.1.9-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"postgresql-libs-8.1.9-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"postgresql-libs-32bit-8.1.9-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"postgresql-libs-64bit-8.1.9-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"postgresql-pl-8.1.9-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"postgresql-server-8.1.9-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");
