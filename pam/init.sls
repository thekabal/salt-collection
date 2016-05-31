{% if grains['os_family'] == 'RedHat' %}
{% if grains['osrelease'].split('.')[0] == '6' %}
/etc/pam.d/password-auth:
    file.symlink:
    - force: True
    - target: /etc/pam.d/password-auth-ac

/etc/pam.d/system-auth:
    file.symlink:
    - force: True
    - target: /etc/pam.d/system-auth-ac

pamd_password_ac_file:

  file.managed:
    - name: /etc/pam.d/password-auth-ac
    - source: salt://pam/password-auth-ac
    - uid: 0
    - gid: 0
    - mode: 0644

pamd_system_ac_file:

  file.managed:
    - name: /etc/pam.d/system-auth-ac
    - source: salt://pam/system-auth-ac
    - uid: 0
    - gid: 0
    - mode: 0644
{% endif %}
{% elif grains['os_family'] == 'FreeBSD'%}
pamd_sshd_file:

  file.managed:
    - name: /etc/pam.d/sshd
    - source: salt://pam/freebsd-pamd-sshd
    - uid: 0
    - gid: 0
    - mode: 0644
{% endif %}
