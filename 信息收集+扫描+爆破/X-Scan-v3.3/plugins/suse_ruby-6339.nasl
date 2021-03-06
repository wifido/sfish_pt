
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(42032);
 script_version ("$Revision: 1.1 $");
 script_name(english: "SuSE Security Update:  ruby: update for several security issues (ruby-6339)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch ruby-6339");
 script_set_attribute(attribute: "description", value: "This ruby update improves return value checks for openssl
function OCSP_basic_verify() (CVE-2009-0642) which allowed
an attacker to use revoked certificates. The entropy of DNS
identifiers was increased (CVE-2008-3905) to avaid spoofing
attacks. The code for parsing XML data was vulnerable to a
denial of service bug (CVE-2008-3790). An attack on
algorithm complexity was possible in function
WEBrick::HTTP::DefaultFileHandler() while parsing HTTP
requests (CVE-2008-3656) as well as by using the regex
engine (CVE-2008-3443) causing high CPU load. Ruby's access
restriction code (CVE-2008-3655) as well as safe-level
handling using function DL.dlopen() (CVE-2008-3657) and big
decimal handling (CVE-2009-1904) was improved. Bypassing
HTTP basic authentication (authenticate_with_http_digest)
is not possible anymore.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch ruby-6339");
script_end_attributes();

script_cve_id("CVE-2009-0642", "CVE-2008-3905", "CVE-2008-3790", "CVE-2008-3656", "CVE-2008-3443", "CVE-2008-3655", "CVE-2008-3657", "CVE-2009-1904");
script_summary(english: "Check for the ruby-6339 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"ruby-1.8.6.p369-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"ruby-devel-1.8.6.p369-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"ruby-doc-html-1.8.6.p369-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"ruby-doc-ri-1.8.6.p369-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"ruby-examples-1.8.6.p369-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"ruby-test-suite-1.8.6.p369-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"ruby-tk-1.8.6.p369-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");
