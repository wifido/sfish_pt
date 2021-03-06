# This script was automatically generated from the dsa-1334
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(25743);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "1334");
 script_cve_id("CVE-2007-2754");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1334 security update');
 script_set_attribute(attribute: 'description', value:
'A problem was discovered with freetype, a FreeType2 font engine, which
could allow the execution of arbitrary code via an integer overflow in
specially crafted TTF files.
For the old stable distribution (sarge), this problem has been fixed in 
version 2.1.7-8.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2007/dsa-1334');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your freetype package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1334] DSA-1334-1 freetype");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1334-1 freetype");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'freetype2-demos', release: '3.1', reference: '2.1.7-8');
deb_check(prefix: 'libfreetype6', release: '3.1', reference: '2.1.7-8');
deb_check(prefix: 'libfreetype6-dev', release: '3.1', reference: '2.1.7-8');
deb_check(prefix: 'freetype', release: '3.1', reference: '2.1.7-8');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
