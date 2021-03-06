# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200511-13.xml
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
 script_id(20234);
 script_version("$Revision: 1.4 $");
 script_xref(name: "GLSA", value: "200511-13");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200511-13 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200511-13
(Sylpheed, Sylpheed-Claws: Buffer overflow in LDIF importer)


    Colin Leroy reported buffer overflow vulnerabilities in Sylpheed
    and Sylpheed-Claws. The LDIF importer uses a fixed length buffer to
    store data of variable length. Two similar problems exist also in the
    Mutt and Pine addressbook importers of Sylpheed-Claws.
  
Impact

    By convincing a user to import a specially-crafted LDIF file into
    the address book, a remote attacker could cause the program to crash,
    potentially allowing the execution of arbitrary code with the
    privileges of the user running the software.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Sylpheed users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=mail-client/sylpheed-2.0.4"
    All Sylpheed-Claws users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=mail-client/sylpheed-claws-1.0.5-r1"
  ');
script_set_attribute(attribute: 'risk_factor', value: 'Medium');
script_set_attribute(attribute: 'see_also', value: 'http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-3354');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200511-13.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200511-13] Sylpheed, Sylpheed-Claws: Buffer overflow in LDIF importer');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Sylpheed, Sylpheed-Claws: Buffer overflow in LDIF importer');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "mail-client/sylpheed-claws", unaffected: make_list("ge 1.0.5-r1"), vulnerable: make_list("lt 1.0.5-r1")
)) { security_warning(0); exit(0); }
if (qpkg_check(package: "mail-client/sylpheed", unaffected: make_list("ge 2.0.4"), vulnerable: make_list("lt 2.0.4")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
