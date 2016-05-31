/etc/rc.d/rc.local:
  file.managed:
    - source: salt://rclocal/rc.local.jinja
    - template: jinja
    - uid: 0
    - gid: 0
    - mode: 0755
