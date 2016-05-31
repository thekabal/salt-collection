/etc/resolv.conf:
  file.managed:
    - template: jinja
    - source: salt://resolv/resolv.conf.jinja
    - uid: 0
    - gid: 0
    - mode: 0644
