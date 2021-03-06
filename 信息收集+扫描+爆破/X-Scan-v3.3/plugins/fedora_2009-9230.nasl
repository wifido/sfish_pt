
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2009-9230
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(40854);
 script_version ("$Revision: 1.2 $");
script_name(english: "Fedora 11 2009-9230: mapserver");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2009-9230 (mapserver)");
 script_set_attribute(attribute: "description", value: "Mapserver is an internet mapping program that converts GIS data to
map images in real time. With appropriate interface pages,
Mapserver can provide an interactive internet map based on
custom GIS data.

-
Update Information:

Changelog is:        * Changing imagepath and imageurl no longer allowed via UR
L
(#1836)      * New fix for incomplete CVE-2009-0840 security fix made in 5.2.2
(#2943)      * Fixed seg fault if font not found with label ANGLE FOLLOW (#2973
)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2009-0840", "CVE-2009-0842", "CVE-2009-1177");
script_summary(english: "Check for the version of the mapserver package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"mapserver-5.2.3-1.fc11", release:"FC11") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
