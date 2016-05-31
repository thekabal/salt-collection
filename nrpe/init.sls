{% if grains['os_family'] == 'RedHat' %}
nrpe:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - file: /etc/nagios/nrpe.cfg

nagios-plugins-load:
  pkg:
    - installed

nagios-plugins-procs:
  pkg:
    - installed

nagios-plugins-disk:
  pkg:
    - installed

  file.managed:
    - template: jinja
    - name: /etc/nagios/nrpe.cfg
    - source: salt://nrpe/nrpe.cfg
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: nrpe
      - pkg: nagios-plugins-load
      - pkg: nagios-plugins-procs
      - pkg: nagios-plugins-disk
{% elif grains['os_family'] == 'FreeBSD' %}
nrpe:
  pkg:
    - installed
    - watch:
      - file: /usr/local/etc/nrpe.cfg

nrpe2:
  service.running:
    - enable: True
  file.managed:
    - template: jinja
    - name: /usr/local/etc/nrpe.cfg
    - source: salt://nrpe/nrpe.cfg.freebsd
    - user: root
    - group: wheel
    - mode: 0644
{% endif %}
