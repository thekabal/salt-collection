{% if grains['os_family'] == 'RedHat' %}
{% if 'Dell' in grains['manufacturer'] %}
megaraid-pkg:
    pkg.installed:
    - sources:
        - MegaCli: salt://megaraid/MegaCli-8.07.14-1.noarch.rpm
    - skip_verify: True
{% endif %}
{% endif %}
