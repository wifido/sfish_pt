#
# (C) Tenable Network Security
#
# This plugin text is was extracted from the Fedora Security Advisory
#


if ( ! defined_func("bn_random") ) exit(0);

include("compat.inc");

if(description)
{
 script_id(20023);
 script_version ("$Revision: 1.5 $");
 script_cve_id("CVE-2005-2969");
 
 name["english"] = "Fedora Core 4 2005-986: openssl097a";
 
 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host is missing a vendor-supplied security patch" );
 script_set_attribute(attribute:"description", value:
"The remote host is missing the patch for the advisory FEDORA-2005-986 (openssl097a).

The OpenSSL toolkit provides support for secure communications between
machines. OpenSSL includes a certificate management tool and shared
libraries which provide various cryptographic algorithms and
protocols.


* Tue Oct 11 2005 Tomas Mraz <tmraz redhat com> 0.9.7a-3.1
- fix CVE-2005-2969 - remove SSL_OP_MSIE_SSLV2_RSA_PADDING which
disables the countermeasure against man in the middle attack in SSLv2
(#169863)
- more fixes for constant time/memory access for DSA signature algorithm
- updated ICA engine patch" );
 script_set_attribute(attribute:"solution", value:
"Get the newest Fedora Updates" );
 script_set_attribute(attribute:"risk_factor", value:"High" );



 script_end_attributes();

 
 summary["english"] = "Check for the version of the openssl097a package";
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2005 Tenable Network Security");
 family["english"] = "Fedora Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");
if ( rpm_check( reference:"openssl097a-0.9.7a-3.1", release:"FC4") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_exists(rpm:"openssl097a-", release:"FC4") )
{
 set_kb_item(name:"CVE-2005-2969", value:TRUE);
}
