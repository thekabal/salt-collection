{% if grains['os_family'] == 'RedHat' %}
ntp:
  pkg:
    - installed

ntpd:
  service.running:
    - enable: True
    - watch:
      - file: /etc/ntp.conf
    - require:
      - pkg: ntp

{% if grains['id'] == 'ntp-master1' or grains['id'] == 'ntp-master2' or grains['id'] == 'ntp-master3' %}
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf.servers
    - uid: 0
    - gid: 0
    - mode: 0644
    - require:
        - pkg: ntp
{% else %}
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf.clients
    - uid: 0
    - gid: 0
    - mode: 0644
    - require:
        - pkg: ntp
{% endif %}
{% endif %}

{# TODO: Add this back, but have a require that turns off ntp prior, runs this, then starts ntp
ntp-sync:
    cmd:
    - run
    - name: ntpdate ntp-master1.ourdomain.net
#}
