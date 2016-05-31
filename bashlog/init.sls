{% if grains['os_family'] == 'RedHat' %}
/etc/profile.d/bashlog.sh:
  file:
    - managed
    - source: salt://bashlog/bashlog.sh
    - uid: 0
    - gid: 0
    - mode: 0644
{% endif %}
