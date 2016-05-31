{% if grains['os_family'] == 'RedHat' %}
/etc/postfix:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 0644
    - makedirs: True

postfix-main-conf:
    file.managed:
        - template: jinja
        - name: /etc/postfix/main.cf
        - source: salt://postfix/postfix.redhat.jinja
        - user: root
        - group: root
        - mode: 0644

postfix:
  pkg:
    - installed
{% elif grains['os_family'] == 'FreeBSD' %}
postfix-main-conf:
    file.managed:
        - template: jinja
        - name: /usr/local/etc/postfix/main.cf
        - source: salt://postfix/postfix.freebsd.jinja

postfix:
  pkg:
    - installed
{% endif %}
