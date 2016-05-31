pam_access:
  file.managed:
    - name: /etc/security/access.conf
    - template: jinja
    - source: salt://access/access.conf.jinja
    - uid: 0
    - group: wheel
    - mode: 0644
