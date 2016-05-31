{% if grains['id'] == 'rsyslog-master1' or grains['id'] == 'rsyslog-master2' %}
rsyslog:
  pkg:
    - installed

/etc/rsyslog.conf:
  file.managed:
    - template: jinja
    - source: salt://syslog/rsyslog.conf.server.jinja
    - uid: 0
    - gid: 0
    - mode: 0644
{% elif grains['os_family'] == 'RedHat' %}
rsyslog:
  pkg:
    - installed

/etc/rsyslog.conf:
  file.managed:
    - template: jinja
    - source: salt://syslog/rsyslog.conf.client.jinja
    - uid: 0
    - gid: 0
    - mode: 0644
{% elif grains['os_family'] == 'FreeBSD' %}
/etc/syslog.conf:
  file.managed:
    - template: jinja
    - source: salt://syslog/syslog.conf.freebsd.jinja
    - uid: 0
    - gid: 0
    - mode: 0644
{% endif %}
