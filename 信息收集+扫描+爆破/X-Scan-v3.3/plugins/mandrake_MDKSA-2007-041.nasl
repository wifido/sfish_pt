
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(24654);
 script_version ("$Revision: 1.3 $");
 script_name(english: "MDKSA-2007:041: ImageMagick");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2007:041 (ImageMagick).");
 script_set_attribute(attribute: "description", value: "Vladimir Nadvornik discovered a buffer overflow in GraphicsMagick and
ImageMagick allows user-assisted attackers to cause a denial of service
and possibly execute execute arbitrary code via a PALM image that is
not properly handled by the ReadPALMImage function in coders/palm.c.
This is related to an earlier fix for CVE-2006-5456 that did not fully
correct the issue.
Updated packages have been patched to correct this issue.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2007:041");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2007-0770");
script_summary(english: "Check for the version of the ImageMagick package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"ImageMagick-6.2.4.3-1.5.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"ImageMagick-doc-6.2.4.3-1.5.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libMagick8.4.2-6.2.4.3-1.5.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libMagick8.4.2-devel-6.2.4.3-1.5.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"perl-Image-Magick-6.2.4.3-1.5.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"ImageMagick-6.2.9.2-1.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"ImageMagick-doc-6.2.9.2-1.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libMagick10.4.0-6.2.9.2-1.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libMagick10.4.0-devel-6.2.9.2-1.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"perl-Image-Magick-6.2.9.2-1.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"ImageMagick-", release:"MDK2006.0")
 || rpm_exists(rpm:"ImageMagick-", release:"MDK2007.0") )
{
 set_kb_item(name:"CVE-2007-0770", value:TRUE);
}
exit(0, "Host is not affected");
