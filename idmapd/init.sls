{% if grains['os_family'] == 'RedHat' %}
/etc/idmapd.conf:
  file.managed:
    - source: salt://idmapd/idmapd.conf.{{ grains['os_family'].lower() }}{{ grains['osrelease'].split(".")[0] }}
    - uid: 0
    - gid: 0
    - mode: 0644
{% endif %}
