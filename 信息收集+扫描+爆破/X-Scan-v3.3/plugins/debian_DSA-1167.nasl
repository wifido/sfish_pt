# This script was automatically generated from the dsa-1167
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(22709);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "1167");
 script_cve_id("CVE-2005-3352", "CVE-2006-3918");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1167 security update');
 script_set_attribute(attribute: 'description', value:
'Several remote vulnerabilities have been discovered in the Apache, the
worlds most popular webserver, which may lead to the execution of arbitrary
web script.  The Common Vulnerabilities and Exposures project identifies
the following problems:
CVE-2005-3352
   A cross-site scripting (XSS) flaw exists in the mod_imap component of
   the Apache server.
CVE-2006-3918
   Apache does not sanitize the Expect header from an HTTP request when 
   it is reflected back in an error message, which might allow cross-site 
   scripting (XSS) style attacks.
For the stable distribution (sarge) these problems have been fixed in
version 1.3.33-6sarge3.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2006/dsa-1167');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your apache package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1167] DSA-1167-1 apache");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1167-1 apache");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'apache', release: '3.1', reference: '1.3.33-6sarge3');
deb_check(prefix: 'apache-common', release: '3.1', reference: '1.3.33-6sarge3');
deb_check(prefix: 'apache-dbg', release: '3.1', reference: '1.3.33-6sarge3');
deb_check(prefix: 'apache-dev', release: '3.1', reference: '1.3.33-6sarge3');
deb_check(prefix: 'apache-doc', release: '3.1', reference: '1.3.33-6sarge3');
deb_check(prefix: 'apache-perl', release: '3.1', reference: '1.3.33-6sarge3');
deb_check(prefix: 'apache-ssl', release: '3.1', reference: '1.3.33-6sarge3');
deb_check(prefix: 'apache-utils', release: '3.1', reference: '1.3.33-6sarge3');
deb_check(prefix: 'libapache-mod-perl', release: '3.1', reference: '1.29.0.3-6sarge3');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
