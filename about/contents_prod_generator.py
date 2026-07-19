import re
TEMPLATE = """[general]
swname=MeeGo 1.2 Harmattan - CU {cpr_version}
warrantytext=qtn_warr_terms
warrantytimer=true
"""
CPR_RE = r"^Version: (\d*\.\d*)$"
def get_cpr_version():
    with open("../prs/mp-harmattan-community-pr/DEBIAN/control") as f:
        control = f.read()
    version = re.search(CPR_RE, control, re.MULTILINE)
    assert version is not None
    return version.group(1)
CPR_VERSION = get_cpr_version()
print(repr(CPR_VERSION))
with open("about-contents-prod/usr/share/about-contents/contents_prod.ini", 'w') as f:
    f.write(TEMPLATE.format(cpr_version=CPR_VERSION))