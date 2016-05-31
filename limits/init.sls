#!jinja|yaml
{% if grains['os_family'] == 'RedHat' %}
/etc/security/limits.conf:
  file.managed:
    - source: salt://limits/limits.conf.jinja
    - template: jinja
    - uid: 0
    - gid: 0
    - mode: 0644

/etc/security/limits.d/90-nproc.conf:
    file.managed:
    - source: salt://limits/90-nproc.conf
    - user: root
    - group: root
    - mode: 0644
{% endif %}
