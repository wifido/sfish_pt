# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200505-10.xml
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
 script_id(18269);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200505-10");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200505-10 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200505-10
(phpBB: Cross-Site Scripting Vulnerability)


    phpBB is vulnerable to a cross-site scripting vulnerability due to
    improper sanitization of user supplied input. Coupled with poor
    validation of BBCode URLs which may be included in a forum post, an
    unsuspecting user may follow a posted link triggering the
    vulnerability.
  
Impact

    Successful exploitation of the vulnerability could cause arbitrary
    scripting code to be executed in the browser of a user.
  
Workaround

    There are no known workarounds at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All phpBB users should upgrade to the latest version:
    emerge --sync
    emerge --ask --oneshot --verbose ">=www-apps/phpBB-2.0.15"
  ');
script_set_attribute(attribute: 'risk_factor', value: 'Medium');
script_set_attribute(attribute: 'see_also', value: 'http://www.securityfocus.com/bid/13344/info/');
script_set_attribute(attribute: 'see_also', value: 'http://securitytracker.com/id?1013918');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200505-10.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200505-10] phpBB: Cross-Site Scripting Vulnerability');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'phpBB: Cross-Site Scripting Vulnerability');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "www-apps/phpBB", unaffected: make_list("ge 2.0.15"), vulnerable: make_list("lt 2.0.15")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
