# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200509-16.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(19815);
 script_version("$Revision: 1.6 $");
 script_xref(name: "GLSA", value: "200509-16");
 script_cve_id("CVE-2005-2556", "CVE-2005-2557");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200509-16 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200509-16
(Mantis: XSS and SQL injection vulnerabilities)


    Mantis fails to properly sanitize untrusted input before using it.
    This leads to an SQL injection and several cross-site scripting
    vulnerabilities.
  
Impact

    An attacker could possibly use the SQL injection vulnerability to
    access or modify information from the Mantis database. Furthermore the
    cross-site scripting issues give an attacker the ability to inject and
    execute malicious script code or to steal cookie-based authentication
    credentials, potentially compromising the victim\'s browser.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Mantis users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=www-apps/mantisbt-0.19.2"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2005-2556');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2005-2557');
script_set_attribute(attribute: 'see_also', value: 'http://secunia.com/advisories/16506/');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200509-16.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200509-16] Mantis: XSS and SQL injection vulnerabilities');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Mantis: XSS and SQL injection vulnerabilities');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "www-apps/mantisbt", unaffected: make_list("ge 0.19.2"), vulnerable: make_list("lt 0.19.2")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
