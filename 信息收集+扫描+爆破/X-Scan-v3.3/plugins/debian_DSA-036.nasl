# This script was automatically generated from the dsa-036
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(14873);
 script_version("$Revision: 1.8 $");
 script_xref(name: "DSA", value: "036");
 script_cve_id("CVE-2000-1109");
 script_bugtraq_id(2016);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-036 security update');
 script_set_attribute(attribute: 'description', value:
'It has been reported that a local user could tweak
Midnight Commander of another user into executing an arbitrary program under
the user id of the person running Midnight Commander.  This behaviour has been
fixed by Andrew V. Samoilov.

We recommend you upgrade your mc package.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2001/dsa-036');
 script_set_attribute(attribute: 'solution', value: 
'Read http://www.debian.org/security/2001/dsa-036
and install the recommended updated packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA036] DSA-036-1 Midnight Commander");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-036-1 Midnight Commander");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'gmc', release: '2.2', reference: '4.5.42-11.potato.6');
deb_check(prefix: 'mc', release: '2.2', reference: '4.5.42-11.potato.6');
deb_check(prefix: 'mc-common', release: '2.2', reference: '4.5.42-11.potato.6');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
