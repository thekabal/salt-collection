/etc/sysctl.conf:
  file.managed:
    - source: salt://sysctl/sysctl.conf
    - user: root
    - group: root
    - mode: 0644
