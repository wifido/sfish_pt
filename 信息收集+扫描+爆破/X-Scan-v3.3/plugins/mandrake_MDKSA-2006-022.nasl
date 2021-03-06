
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(20816);
 script_version ("$Revision: 1.3 $");
 script_name(english: "MDKSA-2006:022: perl-Convert-UUlib");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2006:022 (perl-Convert-UUlib).");
 script_set_attribute(attribute: "description", value: "A buffer overflow was discovered in the perl Convert::UUlib module in
versions prior to 1.051, which could allow remote attackers to execute
arbitrary code via a malformed parameter to a read operation.
This update provides version 1.051 which is not vulnerable to this
flaw.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2006:022");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2005-1349");
script_summary(english: "Check for the version of the perl-Convert-UUlib package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"perl-Convert-UUlib-1.051-0.1.102mdk", release:"MDK10.2", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"perl-Convert-UUlib-", release:"MDK10.2") )
{
 set_kb_item(name:"CVE-2005-1349", value:TRUE);
}
exit(0, "Host is not affected");
