#
#  (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(27599);
  script_version("$Revision: 1.8 $");

  script_cve_id("CVE-2007-5660", "CVE-2007-6654");
  script_bugtraq_id(26280, 27013);
  script_xref(name:"OSVDB", value:"38347");
  script_xref(name:"OSVDB", value:"39980");

  script_name(english:"FLEXnet Connect Update Service ActiveX Control Multiple Code Execution Vulnerabilities");
  script_summary(english:"Checks version of Update Service ActiveX control"); 
 
 script_set_attribute(attribute:"synopsis", value:
"The remote Windows host has an ActiveX control that allows execution
of arbitrary code." );
 script_set_attribute(attribute:"description", value:
"Macrovision FLEXnet Connect, formerly known as InstallShield Update
Service, is installed on the remote host.  It is a software management
solution for internally-developed and third-party applications, and
may have been installed as part of the FLEXnet Connect SDK, other
InstallShield software, or by running FLEXnet Connect-enabled Windows
software. 

The version of the FLEXnet Connect client on the remote host includes
an ActiveX control -- the InstallShield Update Service Agent -- that
is marked as 'safe for scripting' and contains several methods that
allow for downloading and launching arbitrary programs.  If a remote
attacker can trick a user on the affected host into visiting a
specially-crafted web page, he may be able to leverage this issue to
execute arbitrary code on the host subject to the user's privileges. 

It addition, it is reported affected by a buffer overflow that can be
triggered by passing a long argument for 'ProductCode' to the
'DownloadAndExecute()' method." );
 script_set_attribute(attribute:"see_also", value:"http://labs.idefense.com/intelligence/vulnerabilities/display.php?id=618" );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/483062/30/0/threaded" );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/fulldisclosure/2007-12/0553.html" );
 script_set_attribute(attribute:"see_also", value:"http://support.installshield.com/kb/view.asp?articleid=Q113602" );
 script_set_attribute(attribute:"see_also", value:"http://support.installshield.com/kb/view.asp?articleid=Q113020" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to version 6.0.100.65101 or later of the FLEXnet Connect
client." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C" );


script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2007-2009 Tenable Network Security, Inc.");

  script_dependencies("smb_hotfixes.nasl");
  script_require_keys("SMB/Registry/Enumerated");
  script_require_ports(139, 445);

  exit(0);
}


include("global_settings.inc");
include("smb_func.inc");
include("smb_activex_func.inc");


if (!get_kb_item("SMB/Registry/Enumerated")) exit(0);


# Locate the file used by the controls.
if (activex_init() != ACX_OK) exit(0);

clsid = "{E9880553-B8A7-4960-A668-95C68BED571E}";
file = activex_get_filename(clsid:clsid);
if (file)
{
  # Check its version.
  ver = activex_get_fileversion(clsid:clsid);
  if (ver && activex_check_fileversion(clsid:clsid, fix:"6.0.100.65101") == TRUE)
  {
    report = NULL;
    if (report_paranoia > 1)
      report = string(
        "Version ", ver, " of the vulnerable control is installed as :\n",
        "\n",
        "  ", file, "\n",
        "\n",
        "Note, though, that Nessus did not check whether the 'kill' bit was\n",
        "set for the control's CLSID because of the Report Paranoia setting\n",
        "in effect when this scan was run.\n"
      );
    else if (activex_get_killbit(clsid:clsid) != TRUE)
      report = string(
        "Version ", ver, " of the vulnerable control is installed as :\n",
        "\n",
        "  ", file, "\n",
        "\n",
        "Moreover, its 'kill' bit is not set so it is accessible via Internet\n",
        "Explorer.\n"
      );
    if (report) security_hole(port:kb_smb_transport(), extra:report);
  }
}
activex_end();
