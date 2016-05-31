/etc/nsswitch.conf:
  file.managed:
    - template: jinja
{% if grains['os_family'] == 'RedHat' %}
{% if grains['osrelease'].split('.')[0] == '6' %}
    - source: salt://sssd/nsswitch.conf
{% endif %}
{% elif grains['os_family'] == 'FreeBSD' %}
    - source: salt://sssd/nsswitch.conf.freebsd
{% endif %}
    - uid: 0
    - gid: 0
    - mode: 0644
