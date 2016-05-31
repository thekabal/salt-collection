{% if grains['os_family'] == 'RedHat' %}
{% if "HP" in grains['manufacturer'] %}
hpraid-pkg:
    pkg.installed:
    - sources:
        - hpacucli: salt://repos/hpacucli-9.40-12.0.x86_64.rpm
    - skip_verify: True
{% endif %}

{% if "Dell" in grains['manufacturer'] %}
/etc/yum.repos.d/dell-omsa-repository.repo:
  file.managed:
    - source: salt://repos/dell-omsa-repository.repo
    - uid: 0
    - gid: 0
    - mode: 0644

srvadmin-all:
  pkg:
    - installed
{% endif %}
{% endif %}
