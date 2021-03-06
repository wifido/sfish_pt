#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if ( description )
{
 script_id(31139);
 script_version("$Revision: 1.3 $");
 script_name(english:"CentOS : RHSA-2008-0134");
 script_set_attribute(attribute: "synopsis", value: "The remote host is missing a security update.");
 script_set_attribute(attribute: "description", value: 
"The remote CentOS system is missing a security update which has been 
documented in Red Hat advisory RHSA-2008-0134.");
 script_set_attribute(attribute: "see_also", value:
"https://rhn.redhat.com/errata/RHSA-2008-0134.html");
 script_set_attribute(attribute: "solution", value:
"Upgrade to the newest packages by doing :

  yum update");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
script_end_attributes();

script_cve_id("CVE-2007-4772","CVE-2007-5378","CVE-2008-0553");

 script_summary(english:"Checks for missing updates on the remote CentOS system");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is (C) 2009 Tenable Network Security, Inc.");
 script_family(english:"CentOS Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/CentOS/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/CentOS/rpm-list") ) exit(1, "Could not obtain the list of packages");

if ( rpm_check(reference:"expect-5.38.0-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"expect-devel-5.38.0-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"expectk-5.38.0-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"itcl-3.2-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcl-8.3.5-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcl-devel-8.3.5-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcl-html-8.3.5-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcllib-1.3-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tclx-8.3-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tix-8.1.4-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tk-8.3.5-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tk-devel-8.3.5-92.8.c3", release:"CentOS-3", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"expect-5.38.0-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"expect-devel-5.38.0-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"itcl-3.2-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcl-8.3.5-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcl-devel-8.3.5-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tclx-8.3-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tix-8.1.4-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tk-8.3.5-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tk-devel-8.3.5-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"expectk-5.38.0-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcl-html-8.3.5-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcllib-1.3-92.8", release:"CentOS-3", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"expect-5.38.0-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"expect-devel-5.38.0-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"itcl-3.2-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcl-8.3.5-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcl-devel-8.3.5-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tclx-8.3-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tix-8.1.4-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tk-8.3.5-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tk-devel-8.3.5-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"expectk-5.38.0-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcl-html-8.3.5-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"tcllib-1.3-92.8", release:"CentOS-3", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
