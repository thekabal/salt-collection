{% if grains['os_family'] == "RedHat" %}
/etc/selinux/config:
  file.managed:
    - template: jinja
    - source: salt://selinux/selinux_config
    - uid: 0
    - gid: 0
    - mode: 0644
{% endif %}
