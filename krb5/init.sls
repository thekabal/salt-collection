{% if grains['os_family'] == 'RedHat' %}
krb5-workstation:
  pkg:
    - installed
krb5-libs:
  pkg:
    - installed
pam_krb5:
  pkg:
    - installed
  file.managed:
    - name: /etc/krb5.conf
    - template: jinja
    - source: salt://krb5/krb5.conf.jinja
    - mode: 0644
    - require:
      - pkg: pam_krb5
{% endif %}
