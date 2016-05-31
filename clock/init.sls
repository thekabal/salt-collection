/etc/localtime:
    file.symlink:
    - force: True
    - target: /usr/share/zoneinfo/America/New_York

/etc/sysconfig/clock:
    file.managed:
        - name: /etc/sysconfig/clock
        - source: salt://clock/sysconfig-clock
